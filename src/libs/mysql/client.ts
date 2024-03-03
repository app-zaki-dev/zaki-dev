import mysql from 'mysql2/promise';

/**
 * PlanetScaleに接続
 */
export async function client() {
  return await mysql.createConnection(process.env.DATABASE_URL ?? '');
}
