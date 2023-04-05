import excuteQuery from "@/lib/db";
import { nanoid } from "nanoid";
import { NextResponse } from "next/server";

export async function POST(request) {

    const body = await request.json();
    const { title, description, meta_title, slug } = body;
    const id = nanoid();

    try {
        const result = await excuteQuery({
            query: `INSERT INTO tag (id, title, description, meta_title, slug) VALUES (?, ?, ?, ?, ?)`,
            values: [id, title, description, meta_title, slug]
        });
        return NextResponse.json(result);
    } catch (error) {
        return NextResponse.json(error);
    }
}

export async function PUT(request) {

    const body = await request.json();
    const { id, title, description, meta_title } = body;

    try {
        const result = await excuteQuery({
            query: `UPDATE tag SET title = ?, description = ?, meta_title = ? WHERE id = ?`,
            values: [title, description, meta_title, id]
        });
        return NextResponse.json(result);
    } catch (error) {
        return NextResponse.json(error);
    }
}

export async function DELETE(request) {
    const body = await request.json();
    const id = body.id;
    try {
        const result = await excuteQuery({
            query: "DELETE FROM tag WHERE id = ?",
            values: [id]
        });
        return NextResponse.json(result);
    } catch (error) {
        return NextResponse.json(error);
    }
}