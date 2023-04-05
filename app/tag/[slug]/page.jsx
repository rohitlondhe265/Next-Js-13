import { apiBaseUrl } from "@/lib/constants";
import Link from "next/link";

export async function generateMetadata({ params }) {
    const res = await fetch(`${apiBaseUrl}/posts/tags/`, {
        next: { revalidate: 30 },
    });
    if (!res.ok) {
        throw new Error("Failed to fetch data");
    }
    const tags = await res.json();
    const tag = await tags.find((tag) => {
        return tag.slug == params.slug;
    })

    return {
        title: tag.meta_title,
        description: tag.description,
    };
}

export default async function Page({ params }) {
    const res = await fetch(`${apiBaseUrl}/posts/tags/${params.slug}`, {
        next: { revalidate: 30 },
    });
    if (!res.ok) {
        throw new Error("Failed to fetch data");
    }
    const blogs = await res.json();

    return (
        <section className="flex flex-col md:flex-row flex-wrap gap-6 md:gap-9 items-center justify-center mx-2">
            {blogs.data.map((blog) => {
                const {
                    id,
                    title,
                    slug,
                    thumbnail,
                    meta_title,
                    created_at,
                } = blog;
                return (
                    <div
                        key={id}
                        className="card card-compact bg-base-100 shadow-xl border border-gray-300 md:w-1/4"
                    >
                        <figure>
                            <img
                                src={`/images/${thumbnail}`}
                                alt="Shoes"
                                className="aspect-video"
                            />
                        </figure>
                        <div className="card-body">
                            <div className="flex justify-between text-primary">
                                <span>{created_at}</span>
                            </div>
                            <h2 className="card-title">{title}</h2>
                            <p>{meta_title}</p>
                            <div className="card-actions justify-end">
                                <Link href={`/blog/${slug}`}>
                                    <button className="btn btn-primary btn-sm">Read More</button>
                                </Link>
                            </div>
                        </div>
                    </div>
                );
            })}
        </section>
    );
}

export async function generateStaticParams() {
    const res = await fetch(`${apiBaseUrl}/posts/tags/`, {
        next: { revalidate: 30 },
    });
    if (!res.ok) {
        throw new Error("Failed to fetch data");
    }
    const tags = await res.json();
    return tags.map((tag) => ({
        slug: tag.slug,
    }));
}
