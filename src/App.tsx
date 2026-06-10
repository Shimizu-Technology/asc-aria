import './App.css'

const stats = [
  { value: '675+', label: 'retirement plans managed' },
  { value: '50,000+', label: 'participants represented' },
  { value: '$1B+', label: 'assets managed' },
  { value: '5', label: 'locations in the region' },
]

const participantTasks = [
  'Enroll in my plan',
  'Find a form',
  'Understand 401(k) loans',
  'Read my statement',
  'Update beneficiaries',
  'Contact ASC',
]

const values = [
  'Participants Come First',
  'Uncompromising Ethics',
  'Superior Products',
]

function App() {
  return (
    <main className="site-shell">
      <nav className="top-nav" aria-label="Main navigation">
        <a className="brand" href="#hero" aria-label="ASC Trust concept home">
          <span className="brand-mark">ASC</span>
          <span>
            <strong>ASC Trust</strong>
            <small>Digital Support Concept</small>
          </span>
        </a>
        <div className="nav-links" aria-label="Concept sections">
          <a href="#participants">Participants</a>
          <a href="#aria">ARIA</a>
          <a href="#secure-support">Secure support</a>
        </div>
        <a className="login-link" href="#secure-support">Account Login</a>
      </nav>

      <section id="hero" className="hero-section">
        <div className="hero-copy">
          <p className="eyebrow">Retirement Plan Leader in Micronesia</p>
          <h1><span>Retirement</span><span>support,</span><span>made clearer.</span></h1>
          <p className="hero-lede">
            ASC Trust helps participants, employers, and communities plan for a stronger financial future — one paycheck at a time.
          </p>
          <div className="hero-actions" aria-label="Primary actions">
            <a className="primary-button" href="#participants">I’m a participant</a>
            <a className="secondary-button" href="#employers">I’m an employer</a>
          </div>
        </div>

        <aside className="aria-preview-card" aria-label="ARIA preview">
          <div className="card-topline">
            <span className="status-dot" />
            <span>ARIA is ready</span>
          </div>
          <h2><span>Ask ASC’s</span><span>retirement support</span><span>assistant.</span></h2>
          <div className="chat-window mini">
            <p className="message user">Can I borrow from my 401(k)?</p>
            <p className="message aria">
              I can explain how 401(k) loans generally work. For account-specific eligibility, I’ll move you into secure support with ASC review.
            </p>
          </div>
          <a className="text-link" href="#aria">See the ARIA flow →</a>
        </aside>
      </section>

      <section className="stats-strip" aria-label="ASC Trust public credibility stats">
        {stats.map((stat) => (
          <div className="stat" key={stat.label}>
            <strong>{stat.value}</strong>
            <span>{stat.label}</span>
          </div>
        ))}
      </section>

      <section id="participants" className="split-section participant-section">
        <div>
          <p className="eyebrow">Participant support hub</p>
          <h2>Give participants one clear place to start.</h2>
          <p>
            Public ASC content can be reorganized around the jobs participants actually need to complete: enroll, find forms, understand loans, read statements, and contact support.
          </p>
        </div>
        <div className="task-grid" aria-label="Participant task cards">
          {participantTasks.map((task) => (
            <a href="#aria" className="task-card" key={task}>
              <span>{task}</span>
              <small>Get help →</small>
            </a>
          ))}
        </div>
      </section>

      <section id="employers" className="employer-section">
        <div className="dark-panel">
          <p className="eyebrow light">For employers and plan sponsors</p>
          <h2>A premium digital front door for ASC’s full-service retirement plan support.</h2>
          <p>
            ASC designs, administers, consults on, and supports retirement plans for organizations across Guam, Saipan, and Micronesia — from plan design and compliance to recordkeeping, communications, investments, and trustee services.
          </p>
          <div className="value-row">
            {values.map((value) => <span key={value}>{value}</span>)}
          </div>
        </div>
      </section>

      <section id="aria" className="aria-section">
        <div className="section-heading">
          <p className="eyebrow">Public ARIA</p>
          <h2>Helpful answers first. Secure handoff when it becomes personal.</h2>
          <p>
            ARIA should answer general questions on the public site, then route account-specific questions into a secure supervised workflow.
          </p>
        </div>
        <div className="conversation-layout">
          <div className="phone-frame" aria-label="Mobile ARIA conversation mockup">
            <div className="phone-bar" />
            <div className="chat-window">
              <p className="message aria">Hi, I’m ARIA. I can help with retirement plan questions, forms, and next steps.</p>
              <p className="message user">Can I borrow from my 401(k)?</p>
              <p className="message aria">
                I can explain common 401(k) loan rules. Your plan may vary, so I’ll keep this general unless you start secure support.
              </p>
              <button className="secure-button">Start secure support</button>
            </div>
          </div>

          <div className="workflow-card">
            <h3>What ARIA can safely do here</h3>
            <ul>
              <li>Explain general retirement-plan concepts</li>
              <li>Point participants to forms and contact paths</li>
              <li>Route sensitive questions to secure support</li>
              <li>Keep ASC staff in the loop for participant-specific guidance</li>
            </ul>
          </div>
        </div>
      </section>

      <section id="secure-support" className="secure-section">
        <div className="section-heading narrow">
          <p className="eyebrow">Secure supervised workflow</p>
          <h2>Designed for sensitive participant questions.</h2>
          <p>
            This demo uses fake participant data only. In production, authentication, audit logs, approved scripts, and ASC review would be scoped separately.
          </p>
        </div>

        <div className="dashboard-shell">
          <div className="participant-panel">
            <div className="panel-header">
              <span>Participant view</span>
              <strong>401(k) loan inquiry</strong>
            </div>
            <div className="verification-card">
              <span className="badge">Demo verification</span>
              <h3>David John</h3>
              <p>Employer: Bank of Mila • Plan: Sample 401(k)</p>
              <p className="fine-print">Sample data for concept demo. Not connected to Relias, Airtable, or ASC participant records.</p>
            </div>
            <div className="chat-window contained">
              <p className="message user">Am I eligible to take a loan?</p>
              <p className="message aria">
                I’m checking this with ASC support. I can prepare a general explanation, but staff review is required before account-specific next steps.
              </p>
            </div>
          </div>

          <div className="staff-panel">
            <div className="panel-header">
              <span>ASC staff review</span>
              <strong>Human-in-the-loop</strong>
            </div>
            <div className="review-list">
              <div><span>Verification</span><strong>Pending staff approval</strong></div>
              <div><span>Workflow</span><strong>Loan eligibility explanation</strong></div>
              <div><span>Data source</span><strong>Airtable plan rules + staff account check</strong></div>
              <div><span>Response</span><strong>Drafted by ARIA, approved by ASC</strong></div>
            </div>
            <button className="approve-button">Approve sample response</button>
          </div>
        </div>
      </section>

      <section className="forms-section">
        <div>
          <p className="eyebrow">Resource organization</p>
          <h2>Forms and services become easier to navigate.</h2>
        </div>
        <div className="resource-tags" aria-label="ASC form and service categories">
          {['401(k)/403(b)', 'Guam College Savings Plan', 'IRA', 'Section 125', 'HSA', 'FSM / Palau / RMI Plans', 'Retirement Plans', 'Charitable Giving'].map((item) => (
            <span key={item}>{item}</span>
          ))}
        </div>
      </section>

      <footer className="site-footer">
        <strong>ASC + ARIA Digital Support Concept</strong>
        <span>Private proof of concept using public ASC content and sample-only workflow data.</span>
      </footer>
    </main>
  )
}

export default App
