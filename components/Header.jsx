import { apiBaseUrl } from "@/lib/constants";
import Link from "next/link";

export default async function Header() {
  const res = await fetch(`${apiBaseUrl}/posts/categories`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const categories = await res.json();

  return (
    <header className="flex flex-col md:flex-row items-center md:px-6 bg-base-200 text-base-content">
      <div className="inline-flex items-center font-medium text-gray-900">
        <img className="w-12" src="/site/education.png" alt="" />
        <Link href="/">
          <span className="text-xl">Blog Website</span>
        </Link>
      </div>

      <nav className="md:ml-auto md:mr-auto flex flex-wrap items-center md:text-lg justify-center space-x-3 md:space-x-6 bg-info md:bg-inherit font-bold text-white md:text-gray-500 rounded-xl px-2 py-1">
        {categories.map((blog) => {
          const { id, title, slug } = blog;
          return (
            <Link
              key={id}
              href={`/category/${slug}`}
              className="hover:text-gray-900 capitalize"
            >
              {title}
            </Link>
          );
        })}
      </nav>
    </header>
  );
}
