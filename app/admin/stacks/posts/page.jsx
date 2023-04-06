import { apiBaseUrl } from "@/lib/constants";
import Link from "next/link";

export default async function Page() {
  const res = await fetch(`${apiBaseUrl}/posts/?page=1&limit=12`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const blogs = await res.json();

  return (
    <div className="overflow-x-auto w-full">
      <table className="table table-compact w-full">
        <thead>
          <tr>
            <th></th>
            <th>Title</th>
            <th>Category</th>
            <th>Staues</th>
            <th>Date</th>
            <th>Edit</th>
          </tr>
        </thead>
        <tbody>
          {blogs?.data?.map((post, i) => {
            const { id, title, categories, status, created_at, slug } = post;
            return (
              <tr key={id}>
                <th>{i + 1}</th>
                <td>{title.slice(0, 45)}</td>
                <td>{categories}</td>
                <td>{status}</td>
                <td>{created_at}</td>
                <td>
                  <Link href={`admin/stacks/posts/edit/${slug}`}>
                    <img
                      className="w-6 cursor-pointer"
                      src="/site/edit.png"
                      alt="edit btn"
                    />
                  </Link>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}
