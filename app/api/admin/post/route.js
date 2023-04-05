import { NextResponse } from "next/server";
import excuteQuery from "@/lib/db";
import { nanoid } from "nanoid";

export async function POST(request) {
    const body = await request.json();
    const { title, content, status, thumbnail, meta_title, slug, categories, tags, metadata } = body;

    const id = nanoid();

    try {
        const post_result = await excuteQuery({
            query: `INSERT INTO post (id, title, content, status, thumbnail, meta_title, slug) VALUES (?, ?, ?, ?, ?, ?, ?)`,
            values: [id, title, content, status, thumbnail, meta_title, slug]
        });

        const tagsArr = [tags.map(tagId => [id, tagId])];
        const catsArr = [categories.map(catId => [id, catId])];
        const metaArr = [metadata.map(meta => [id, meta.name, meta.content])];

        const meta_result = await excuteQuery({
            query: `INSERT INTO post_meta (post_id, name, content) VALUES ?`,
            values: metaArr
        });
        const tag_result = await excuteQuery({
            query: `INSERT INTO post_tag (post_id, tag_id) VALUES ?`,
            values: tagsArr
        });
        const cat_result = await excuteQuery({
            query: `INSERT INTO post_category (post_id, category_id) VALUES ?`,
            values: catsArr
        });

        return NextResponse.json({ post: post_result, cat: cat_result, tag: tag_result, meta: meta_result });

    } catch (error) {
        return NextResponse.json(error);
    }
}

export async function PUT(request) {
    const body = await request.json();
    const { id, title, content, status, thumbnail, meta_title, slug} = body;

    try {
        const result = await excuteQuery({
            query: `UPDATE post SET title = ?, content = ?, status = ?, thumbnail = ?, meta_title = ?, slug = ? VALUES WHERE id = ?`,
            values: [title, content, status, thumbnail, meta_title, slug, id]
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
            query: "DELETE FROM post WHERE id = ?",
            values: [id]
        });
        return NextResponse.json(`Post with id = ${id} has Deleted Successfully !`);
    } catch (error) {
        return NextResponse.json(error);
    }
}