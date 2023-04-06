"use client";

import { useEffect, useState, useRef } from "react";
import { Editor } from "@tinymce/tinymce-react";
import Link from "next/link";
import axios from "@/lib/my-axios";
import { useRouter } from "next/navigation";
import { apiBaseUrl } from "@/lib/constants";

export default function page() {
  const [title, setTitle] = useState("");
  const [slug, setSlug] = useState("");
  const [metaTitle, setMetaTitle] = useState("");
  const [metaDescription, setMetaDescription] = useState("");

  const editorRef = useRef(null);

  const [selectedImage, setSelectedImage] = useState("");
  const [selectedFile, setSelectedFile] = useState();

  const handleUpload = async () => {
    try {
      if (!selectedFile) return;
      const formData = new FormData();
      formData.append("myImage", selectedFile);
      const { data } = await axios.post("/upload", formData);
      return data;
    } catch (error) {
      console.log(error.response.data);
    }
  };

  const [apiCat, setApiCat] = useState([]);
  const [apiTag, setApiTag] = useState([]);
  const [selectedCats, setSelectedCats] = useState([]);
  const [selectedtags, setSelectedTags] = useState([]);

  useEffect(() => {
    fetch(`${apiBaseUrl}/posts/categories`)
      .then((data) => data.json())
      .then((val) => setApiCat(val));
    fetch(`${apiBaseUrl}/posts/tags`)
      .then((data) => data.json())
      .then((val) => setApiTag(val));
  }, []);
  const handleChangeCats = (e, id) => {
    const activeData = document.getElementById(id).checked;
    if (activeData == true) {
      setSelectedCats((oldData) => [...oldData, e.target.value]);
    } else {
      setSelectedCats(
        selectedCats.filter((values) => values !== e.target.value)
      );
    }
  };
  const handleChangeTags = (e, id) => {
    const activeData = document.getElementById(id).checked;
    if (activeData == true) {
      setSelectedTags((oldData) => [...oldData, e.target.value]);
    } else {
      setSelectedTags(
        selectedtags.filter((values) => values !== e.target.value)
      );
    }
  };

  const metadata = [
    { name: "title", content: metaTitle },
    { name: "description", content: metaDescription },
  ];
  const [status, setStatus] = useState(0);
  const router = useRouter();

  const handlePublish = async (e) => {
    e.preventDefault();
    const imgUrl = await handleUpload();
    try {
      const res = await axios.post(`/admin/post`, {
        title,
        content: editorRef.current.getContent(),
        status: 2,
        thumbnail: imgUrl,
        meta_title: metaTitle,
        slug: slug.replace(/\s+/g, "-").toLowerCase(),
        categories: selectedCats,
        tags: selectedtags,
        metadata,
      });
      setStatus(res.status);
    } catch (err) {
      setStatus(404);
      console.log(err.message);
    }
    setTimeout(() => {
      router.push("/admin/stacks/posts");
    }, 3000);
  };
  const handleDraft = async (e) => {
    e.preventDefault();
    const imgUrl = await handleUpload();
    try {
      const res = await axios.post(`/admin/post`, {
        title,
        content: editorRef.current.getContent(),
        status: 1,
        thumbnail: imgUrl,
        meta_title: metaTitle,
        slug: slug.replace(/\s+/g, "-").toLowerCase(),
        categories: selectedCats,
        tags: selectedtags,
        metadata,
      });
      setStatus(res.status);
    } catch (err) {
      setStatus(404);
      console.log(err.message);
    }
    setTimeout(() => {
      router.push("/admin/stacks/posts");
    }, 3000);
  };
  return (
    <div className="flex flex-col lg:flex-row gap-6 mt-6">
      {/* Content */}
      <main className="px-2 lg:px-9 bg-slate-300" style={{ flex: "5" }}>
        {status == 200 && (
          <div className="alert alert-success shadow-lg mt-3">
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
              <span>New Post is Added Successfully!</span>
            </div>
          </div>
        )}
        {status == 404 && (
          <div className="alert alert-error shadow-lg mt-3">
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

        <section className="mt-3 space-y-2">
          <input
            className="w-full rounded-md border border-gray-300 bg-white py-3 px-6 text-base font-medium text-gray-600 outline-none focus:border-purple-400 focus:shadow-md"
            type="text"
            placeholder="title"
            onChange={(e) => setTitle(e.target.value)}
          />
          <div className="editor h-1/2 overflow-scroll bg-white">
            <Editor
              apiKey="idw7xyxfre7k97232m8itu8o6z8mtog3ehj5vk8qax5gn33t"
              onInit={(evt, editor) => (editorRef.current = editor)}
              initialValue=""
              init={{
                height: 500,
                menubar: false,
                plugins:
                  "anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount",
                toolbar:
                  "undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat",
                content_style:
                  "body { font-family:Helvetica,Arial,sans-serif; font-size:14px }",
              }}
            />
          </div>
        </section>
        <div className="divider"></div>
        <section className="space-y-2">
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
            onChange={(e) => setMetaDescription(e.target.value)}
            placeholder="Meta Description"
            className="w-full resize-none rounded-md border border-gray-300 bg-white py-3 px-6 text-base font-medium text-gray-600 outline-none focus:border-purple-400 focus:shadow-md"
          ></textarea>
        </section>
      </main>

      {/* Sidebar */}
      <aside
        className="flex flex-col gap-6 bg-slate-300 px-3 py-6"
        style={{ flex: "2" }}
      >
        {/* post submit */}
        <div className="flex justify-between">
          <Link href="/admin/add-post">
            <button className="btn btn-info gap-2" onClick={handlePublish}>
              <img src="/site/dashbord/upload.svg" className="w-9" alt="" />
              Publish
            </button>
          </Link>
          <Link href="/admin/add-post">
            <button className="btn btn-info gap-2" onClick={handleDraft}>
              <img src="/site/dashbord/save.svg" className="w-9" alt="" />
              Save as Draft
            </button>
          </Link>
        </div>
        {/* post thumbnail */}
        <label>
          <input
            type="file"
            hidden
            onChange={({ target }) => {
              if (target.files) {
                const file = target.files[0];
                setSelectedImage(URL.createObjectURL(file));
                setSelectedFile(file);
              }
            }}
          />
          <div className="aspect-video w-60 rounded flex items-center justify-center border-4 border-dashed cursor-pointer">
            {selectedImage ? (
              <img src={selectedImage} alt="" />
            ) : (
              <span className="text-2xl">Select Image</span>
            )}
          </div>
        </label>
        {/* post checkboxes */}
        <div className="form-control">
          <h3>Select Category</h3>
          {apiCat?.map((cat) => (
            <div key={cat.id} className="label cursor-pointer w-1/2">
              <input
                id={cat.id}
                type="checkbox"
                value={cat.id}
                onChange={(e) => handleChangeCats(e, cat.id)}
                className="checkbox checkbox-info"
              />
              <span className="label-text">{cat.title}</span>
            </div>
          ))}
        </div>
        <div className="form-control">
          <h3>Select Tags</h3>
          {apiTag?.map((tag) => (
            <div key={tag.id} className="label cursor-pointer w-1/2">
              <input
                id={tag.id}
                type="checkbox"
                value={tag.id}
                onChange={(e) => handleChangeTags(e, tag.id)}
                className="checkbox checkbox-info"
              />
              <span className="label-text">{tag.title}</span>
            </div>
          ))}
        </div>
      </aside>
    </div>
  );
}
