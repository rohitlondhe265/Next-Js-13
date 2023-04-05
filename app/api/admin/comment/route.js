import excuteQuery from "@/lib/db";
import { NextResponse } from "next/server";

export async function POST(request) {
    const body = await request.json();
    const { title, description, user_id } = body;
    try {
        const result = await excuteQuery({
            query: `INSERT INTO post_comment (title, description, user_id) VALUES (?, ?, ?)`,
            values: [title, description, user_id]
        });
        return NextResponse.json(result);
    } catch (error) {
        return NextResponse.json(error);
    }
}

export async function DELETE(request) {
    const id = request.json().id;
    try {
        const result = await excuteQuery({
            query: "DELETE FROM post_comment WHERE id = ?",
            values: [id]
        });
        return NextResponse.json(result);
    } catch (error) {
        return NextResponse.json(error);
    }
}