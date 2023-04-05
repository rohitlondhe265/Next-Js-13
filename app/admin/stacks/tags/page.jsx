import { apiBaseUrl } from "@/lib/constants";
import Link from "next/link";

export default async function Page() {
  const res = await fetch(`${apiBaseUrl}/posts/tags`, {
    next: { revalidate: 30 },
  });
  if (!res.ok) {
    throw new Error("Failed to fetch data");
  }
  const tags = await res.json();

  return (
    <main className="w-full">
      <section className="flex justify-between items-center mb-3">
        <h3 className="text-xl font-bold">All Tags</h3>
        <Link href="/admin/stacks/tags/add-new">
          <button className="btn btn-info gap-2 text-white">
            <img src="/site/dashbord/click.svg" className="w-9" alt="" />
            Add New Tag
          </button>
        </Link>
      </section>
      <div className="overflow-x-auto">
        <table className="table w-full">
          {/* head */}
          <thead>
            <tr>
              <th></th>
              <th>Title</th>
              <th>Meta Title</th>
              <th>Description</th>
              <th>Slug</th>
              <th>Edit</th>
            </tr>
          </thead>
          <tbody>
            {tags.map((cat, i) => {
              const { id, title, meta_title, description, slug } = cat;
              return (
                <tr key={id}>
                  <th>{i + 1}</th>
                  <td>{title}</td>
                  <td>{meta_title.slice(0, 30)}</td>
                  <td>{description.slice(0, 30)}</td>
                  <td>{slug}</td>
                  <td>
                    <Link href={`admin/stacks/tags/edit/${slug}`}>
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
    </main>
  );
}
