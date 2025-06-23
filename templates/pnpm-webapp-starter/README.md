# How to scaffold a Vite + React + Typescript + TailwindCSS project as of 2025?

1. Initialize the project.

   ```console
   pnpm create vite@latest .
   ```
   
   I would recommend `React` with `Typescript + SWC`.
   
2. Install the tailwind toolkit

   ```console
   pnpm install -D tailwindcss @tailwindcss/vite
   ```
   
3. Following the instruction [here](https://tailwindcss.com/docs/installation/using-vite) to configure the tailwindcss plugin. Without vite, you'd want to run tailwind cli to constantly watch the changes and translate the tailwind css classes. With the vite plugin for tailwind configured, vite will do the job.
