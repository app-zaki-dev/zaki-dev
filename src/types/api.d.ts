import { DB_COLUMNS } from './dbColumns';

/**
 * apiのリクエスト、レスポンス型定義
 */
export type ArticlesResType = {
  count: number;
  articles: DB_COLUMNS['t_articles'][];
};
