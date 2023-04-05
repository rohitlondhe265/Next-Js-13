"use client";
import { useState } from "react";
import axios from "@/lib/my-axios";
import { useRouter } from "next/navigation";

export default function Page() {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [slug, setSlug] = useState("");
  const [metaTitle, setMetaTitle] = useState("");
  const [status, setStatus] = useState(0);
  const router = useRouter();

  const handleClick = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post(`/admin/tag`, {
        title,
        description,
        meta_title: metaTitle,
        slug,
      });
      setStatus(res.status);
    } catch (err) {
      setStatus(404);
      console.log(err.message);
    }
    setTimeout(() => {
      router.push("/admin/stacks/tags");
    }, 3000);
  };
  return (
    <main className="px-2 lg:px-9 bg-slate-300 space-y-2 pt-3">
      <h3 className="text-2xl text-primary font-semibold">Add New Tag</h3>
      {status == 200 && (
        <div className="alert alert-success shadow-lg">
          <div>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="stroke-current flex-shrink-0 h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
            <span>New Tag is Added!</span>
          </div>
        </div>
      )}
      {status == 404 && (
        <div className="alert alert-error shadow-lg">
          <div>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="stroke-current flex-shrink-0 h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
            <span>Error! Some error Occured Please try again later</span>
          </div>
        </div>
      )}
      <input
        className="w-full rounded-md border border-gray-300 bg-white py-3 px-6 text-base font-medium text-gray-600 outline-none focus:border-purple-400 focus:shadow-md"
        type="text"
        placeholder="title"
        onChange={(e) => setTitle(e.target.value)}
      />
      <input
        className="w-full rounded-md border border-gray-300 bg-white py-3 px-6 text-base font-medium text-gray-600 outline-none focus:border-purple-400 focus:shadow-md"
        type="text"
        placeholder="URL Slug"
        onChange={(e) => setSlug(e.target.value)}
      />
      <input
        className="w-full rounded-md border border-gray-300 bg-white py-3 px-6 text-base font-medium text-gray-600 outline-none focus:border-purple-400 focus:shadow-md"
        type="text"
        placeholder="Meta Title"
        onChange={(e) => setMetaTitle(e.target.value)}
      />
      <textarea
        rows="4"
        onChange={(e) => setDescription(e.target.value)}
        placeholder="Meta Description"
        className="w-full resize-none rounded-md border border-gray-300 bg-white py-3 px-6 text-base font-medium text-gray-600 outline-none focus:border-purple-400 focus:shadow-md"
      ></textarea>
      <button className="btn btn-outline btn-primary" onClick={handleClick}>
        Submit
      </button>
    </main>
  );
}
