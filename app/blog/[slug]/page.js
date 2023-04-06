import { apiBaseUrl } from "@/lib/constants";
import { notFound } from "next/navigation";

export const dynamicParams = true;

export async function generateMetadata({ params }) {
  const res = await fetch(`${apiBaseUrl}/posts/${params.slug}`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const blog = await res.json();
  return {
    title: blog?.meta_title,
  };
}

export default async function Page({ params }) {
  const res = await fetch(`${apiBaseUrl}/posts/${params.slug}`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const blog = await res.json();

  const createMarkup = (content) => {
    return { __html: content };
  };

  if (!blog.title) {
    return notFound();
  }

  return (
    <main className="flex flex-col lg:flex-row">
      <main className="flex-1 px-3 lg:px-12 bg-gray-100 space-y-3">
        <img
          className="w-full p-3 lg:p-6 aspect-video"
          src={`/${blog?.thumbnail}`}
          alt="poster image"
        />
        <article className="prose max-w-none text-left md:px-12 md:text-lg">
          <h1>{blog?.title}</h1>
          <main dangerouslySetInnerHTML={createMarkup(blog?.content)}></main>
        </article>
      </main>

      <aside className="w-1/3">
        <h3 className="text-3xl text-primary font-semibold">Related Posts</h3>
      </aside>
    </main>
  );
}

export async function generateStaticParams() {
  const res = await fetch(`${apiBaseUrl}/posts/?page=1&limit=6`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const blogs = await res.json();
  return blogs?.data?.map((blog) => ({
    slug: blog.slug,
  }));
}
