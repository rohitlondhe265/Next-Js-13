import excuteQuery from "@/lib/db";
import { NextResponse } from "next/server";

export async function GET(request) {

    try {
        const result = await excuteQuery({
            query: 'SELECT * FROM category',
            values: []
        });
        return NextResponse.json(result);
    } catch (error) {
        return NextResponse.json(error);
    }
}