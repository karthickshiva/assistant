import { NavLink, Outlet } from 'react-router-dom'
import './App.css'

const navItems = [
  { to: '/', label: 'Dashboard' },
  { to: '/tasks', label: 'Tasks' },
  { to: '/journal', label: 'Journal' },
  { to: '/settings', label: 'Settings' },
]

function App() {
  return (
    <div className="app-shell">
      <header className="app-header">
        <h1>Personal Assistant</h1>
        <p>Plan your day and track what matters.</p>
      </header>
      <nav className="app-nav" aria-label="Primary">
        {navItems.map((item) => (
          <NavLink
            key={item.to}
            to={item.to}
            end={item.to === '/'}
            className={({ isActive }) => (isActive ? 'nav-link active' : 'nav-link')}
          >
            {item.label}
          </NavLink>
        ))}
      </nav>
      <main className="app-main">
        <Outlet />
      </main>
    </div>
  )
}

export default App
