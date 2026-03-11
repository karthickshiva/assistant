import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { registerSW } from 'virtual:pwa-register'
import './index.css'
import App from './App'

const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,
    children: [
      {
        index: true,
        element: (
          <section>
            <h2>Dashboard</h2>
            <p>Your overview cards will appear here.</p>
          </section>
        ),
      },
      {
        path: 'tasks',
        element: (
          <section>
            <h2>Tasks</h2>
            <p>Task list module scaffold.</p>
          </section>
        ),
      },
      {
        path: 'journal',
        element: (
          <section>
            <h2>Journal</h2>
            <p>Daily journal module scaffold.</p>
          </section>
        ),
      },
      {
        path: 'settings',
        element: (
          <section>
            <h2>Settings</h2>
            <p>Profile and application settings scaffold.</p>
          </section>
        ),
      },
    ],
  },
])

registerSW({ immediate: true })

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>,
)
