import Link from "next/link";

export default function Corousel() {

  const Images = [
    { id: 1, alt: "Dashboard", src: "/images/1680102115462_Infosys Deloitte Hiring freshers 2022.jpg", href: "/admin/stacks" },
    { id: 2, alt: "Posts", src: "/images/1680102115462_Infosys Deloitte Hiring freshers 2022.jpg", href: "/admin/stacks/posts" },
    { id: 3, alt: "Categories", src: "/images/1680102115462_Infosys Deloitte Hiring freshers 2022.jpg", href: "/admin/stacks/categories" },
    { id: 4, alt: "Tags ", src: "/images/1680102115462_Infosys Deloitte Hiring freshers 2022.jpg", href: "/admin/stacks/tags" },
    { id: 5, alt: "comments", src: "/images/1680102115462_Infosys Deloitte Hiring freshers 2022.jpg", href: "/admin/stacks/comments" },
    { id: 6, alt: "Logout", src: "/images/1680102115462_Infosys Deloitte Hiring freshers 2022.jpg", href: "/admin" },
  ];

  return (
    <section className="md:w-1/2">
      <div className="carousel w-full aspect-video rounded-2xl ">

        {Images.map((img) => {
          const { id, alt, src, href } = img;
          let prev;
          if (id == 1) {
            prev = Images.length;
          } else {
            prev = id - 1;
          }
          let next;
          if (id == Images.length) {
            next = 1;
          } else {
            next = id + 1;
          }
          return (
            <div id={id} key={id} className="carousel-item relative w-full">
              <Link href={href}><img
                src={src}
                className="w-full" /></Link>
              <div className="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                <a href={`#${prev}`} className="btn btn-circle">
                  ❮
                </a>
                <a href={`#${next}`} className="btn btn-circle">
                  ❯
                </a>
              </div>
            </div>
          );
        })}

      </div>
    </section>
  );
}
