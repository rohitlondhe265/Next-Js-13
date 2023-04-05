import excuteQuery from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(req, { params }) {
    const { searchParams } = req.nextUrl;
    const page = parseInt(searchParams.get("page")) - 1 || 0;
    const limit = parseInt(searchParams.get("limit")) || 3;
    const slug = params.slug;

    const result = await excuteQuery({
        query: "SELECT COUNT(p.id) as 'total' FROM tag t INNER JOIN post_tag pt ON t.id = pt.tag_id INNER JOIN post p ON pt.post_id = p.id WHERE t.slug = ?",
        values: [slug]
    });
    const total = await result[0].total;
    const skip = page * limit;

    try {
        const result = await excuteQuery({
            query: "SELECT p.*, t.title FROM tag t INNER JOIN post_tag pt ON t.id = pt.tag_id INNER JOIN post p ON pt.post_id = p.id WHERE t.slug = ? ORDER BY p.created_at DESC LIMIT ? OFFSET ?",
            values: [slug, limit, skip]
        });
        return NextResponse.json({ tag: slug, data: result, page: page + 1, limit, total })
    } catch (error) {
        return NextResponse.json(error);
    }
}