import { apiBaseUrl } from "@/lib/constants";
import Link from "next/link";

export default async function PostList() {
  const res = await fetch(`${apiBaseUrl}/posts/`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const blogs = await res.json();

  return (
    <section className="text-gray-600 body-font overflow-hidden md:w-1/3 mt-6 md:mt-0">
      <h3 className="bg-primary text-xl text-white font-bold text-center py-1 mb-2">
        Trending Posts
      </h3>
      <div className="space-y-3 md:space-y-6 w-full">
        {blogs.data.map((blog) => {
          const { id, title, thumbnail, slug, categories, created_at } = blog;
          return (
            <div
              key={id}
              className="flex items-center justify-center flex-nowrap space-x-2 drop-shadow-xl"
            >
              <div className="w-1/3 aspect-video object-fill">
                <img
                  src={`/${thumbnail}`}
                  className="cursor-pointer rounded-xl"
                />
              </div>
              <div className="flex-1">
                <Link href={`/blog/${slug}`}>
                  <h2 className="text-base font-semibold text-gray-900 hover:text-primary text-justify">
                    {title}
                  </h2>
                </Link>
                <div className="flex justify-between text-primary">
                  <span>{categories}</span>
                  <span>{created_at}</span>
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </section>
  );
}
