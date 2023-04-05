import excuteQuery from "@/lib/db";
import { NextResponse } from "next/server";

export async function PUT(request) {
    const body = await request.json();
    const { id, categories} = body;

    try {
        const catsArr = [categories.map(cat => [id, cat])];
        const delete_result = await excuteQuery({
            query: "DELETE FROM post_category WHERE post_id = ?",
            values: [id]
        });
        const cat_result = await excuteQuery({
            query: `INSERT INTO post_category (post_id, category_id) VALUES ?`,
            values: catsArr
        });

        return NextResponse.json({delete_result, cat_result});

    } catch (error) {
        return NextResponse.json(error);
    }
}