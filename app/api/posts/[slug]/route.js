import excuteQuery from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(request, { params }) {
    const slug = params.slug;

    try {
        const data = await excuteQuery({
            query: "SELECT p.*, GROUP_CONCAT(DISTINCT c.title ORDER BY c.title DESC SEPARATOR ', ') AS categories ,GROUP_CONCAT(DISTINCT t.title ORDER BY t.title DESC SEPARATOR ', ') AS tags, GROUP_CONCAT( DISTINCT CONCAT(m.name, '= ',m.content) ORDER BY p.id SEPARATOR ', ') AS meta_data FROM post p INNER JOIN post_meta m ON m.post_id = p.id INNER JOIN post_category pc on p.id = pc.post_id INNER JOIN category c on pc.category_id = c.id INNER JOIN post_tag pt ON p.id = pt.post_id INNER JOIN tag t ON pt.tag_id = t.id WHERE p.slug = ?",
            values: [slug]
        });
        return NextResponse.json(data[0]);
    } catch (error) {
        return NextResponse.json(error);
    }
}