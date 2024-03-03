import { ArticlesResType } from '@/types/api';

export default function Page({ count, articles }: ArticlesResType) {
  return (
    <main>
      <p>記事{count}件</p>
      {count > 0 &&
        articles.map((article) => (
          <div key={article.id} className='p-4 bg-blue-200 rounded-lg mb-4'>
            <h2>{article.title}</h2>
            <p>{article.content}</p>
            <p>{article.updated_at ?? article.created_at}</p>
          </div>
        ))}
    </main>
  );
}

export const getServerSideProps = async () => {
  let response: ArticlesResType;
  try {
    const res = await fetch('http://localhost:8888/api/hello');
    response = await res.json();
    console.log('これは？', response);
  } catch (err) {
    console.error('Api call failed......', err);
    response = { count: 0, articles: [] };
  }

  return { props: response };
};
