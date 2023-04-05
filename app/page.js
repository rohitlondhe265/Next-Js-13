import Card from "@/components/Card";
import Corousel from "@/components/Corousel";
import PostList from "@/components/PostList";

export default function Home() {
  return (
    <main>
      <div className="flex flex-wrap justify-center items-center m-2 md:gap-12 mt-3 md:mt-6">
        <Corousel />
        <PostList />
      </div>

      <div className="divider"></div>
      <Card />
    </main>
  );
}