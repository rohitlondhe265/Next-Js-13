import mysql from 'serverless-mysql';

const db = mysql({
  config: {
    host: 'localhost',
    database: 'blog_db',
    user: 'root',
    password: 'Rohit9011@#'
  },
  onConnect: (e) => { console.log('Connection Success: ' + e) },
  onConnectError: (e) => { console.log('Connection Error: ' + e) },
});

export default async function excuteQuery({ query, values }) {
  try {
    const results = await db.query(query, values);
    await db.end();
    return results;
  } catch (error) {
    return { error };
  }
}