This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

npm install @prisma/client
npm install prisma --save-dev

npx prisma init
npx prisma migrate dev --name init
npx prisma generate
npx prisma db pull
npx prisma studio

npx prisma migrate dev --name add_auto_increment_to_id