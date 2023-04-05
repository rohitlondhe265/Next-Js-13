import React from "react";
import Link from "next/link";
const SideNav = () => {
  const Menus = [
    { id: 1, title: "Dashboard", src: "dashbord", href: "/admin/stacks" },
    { id: 2, title: "Posts", src: "posts", href: "/admin/stacks/posts" },
    {
      id: 3,
      title: "Categories",
      src: "category",
      href: "/admin/stacks/categories",
      gap: true,
    },
    { id: 4, title: "Tags ", src: "tag", href: "/admin/stacks/tags" },
    {
      id: 5,
      title: "comments",
      src: "comment",
      href: "/admin/stacks/comments",
    },
    { id: 6, title: "Logout", src: "logout", href: "/admin", gap: true },
  ];
  return (
    <div className="w-72 p-5 pt-8 relative">
      <Link href="/admin/add-post">
        <button className="btn btn-primary gap-2">
          <img src="/site/button.png" className="w-9" alt="" />
          Add New Post
        </button>
      </Link>
      <ul className="pt-6">
        {Menus.map((menu, index) => (
          <Link href={`${menu.href}`} key={menu.id}>
            <li
              key={index}
              className={`flex  rounded-md p-2 cursor-pointer hover:bg-white text-gray-300 text-sm items-center gap-x-4 
  ${menu.gap ? "mt-9" : "mt-2"} hover:bg-gray-300`}
            >
              <img className="w-9" src={`/site/dashbord/${menu.src}.svg`} />
              <span className="origin-left text-lg duration-200 text-black">
                {menu.title}
              </span>
            </li>
          </Link>
        ))}
      </ul>
    </div>
  );
};

export default SideNav;
