// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import { client } from '@/libs/mysql/client';
import type { NextApiRequest, NextApiResponse } from 'next';

type Data = {
  count: number;
  articles: [] | undefined;
};

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data>,
) {
  console.log(process.env.DATABASE_URL);
  let articles;
  let count = 0;
  try {
    const query = 'SELECT * FROM t_articles LIMIT 5;';
    const connection = await client();
    const [results] = await connection.execute<[]>(query);
    articles = results;
    count = results.length;
    console.log(connection.format(query));
    console.log('結果', results);
  } catch (err) {
    console.error('hello api error...', err);
  }

  res.status(200).json({ count, articles });
}
