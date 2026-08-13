const header = document.querySelector('.site-header');
const menuButton = document.querySelector('.menu-toggle');
const navigation = document.querySelector('nav');
const languageButton = document.querySelector('.language-toggle');

const translations = {
  id: {
    description: 'Portfolio Anam Maulana — Software Engineer, DevOps, dan Server Specialist di Indonesia.',
    menu: ['Tentang', 'Pengalaman', 'Karya'], menuOpen: 'Buka navigasi', menuClose: 'Tutup navigasi', switchLabel: 'Switch to English',
    waLabel: 'Mulai percakapan dengan Anam melalui WhatsApp',
    wa: ['Halo Anam, saya melihat portfolio Anda dan ingin berdiskusi.', 'Halo Anam, saya tertarik untuk berkolaborasi setelah melihat portfolio Anda.', 'Halo Anam, saya ingin berdiskusi tentang sebuah proyek.'],
    caseButton: 'Lihat case study', caseLabels: ['Tujuan', 'Kontribusi', 'Teknologi', 'Hasil'],
    cases: [
      ['Membangun lingkungan privat untuk menguji deployment dan konfigurasi layanan tanpa mengganggu sistem produksi.', 'Merancang susunan perangkat, menyiapkan sistem Linux, jaringan lokal, container, serta skenario deployment dan troubleshooting.', 'Linux, Docker, networking, reverse proxy, Jenkins, dan shell scripting.', 'Tersedia laboratorium yang dapat digunakan berulang untuk eksperimen aplikasi, otomasi deployment, dan simulasi penanganan gangguan.'],
      ['Menyatukan indikator kesehatan layanan agar anomali pada resource, log, dan availability lebih cepat terlihat.', 'Menentukan sinyal operasional penting, menyusun struktur dashboard, dan merancang alur pemeriksaan ketika layanan bermasalah.', 'Linux metrics, service health check, log monitoring, uptime monitoring, dan dashboard observability.', 'Menghasilkan konsep monitoring terpusat yang mempermudah pemeriksaan kondisi layanan dan membantu proses troubleshooting lebih terarah.'],
      ['Mendukung proses pelayanan pelanggan melalui aplikasi yang menggabungkan informasi operasional dalam satu antarmuka.', 'Mengembangkan dan meningkatkan fitur aplikasi, mengintegrasikan frontend dengan layanan backend, serta mendukung deployment pada server.', 'JavaScript, Java, Quarkus, REST API, MySQL/PostgreSQL, Linux, dan CI/CD.', 'Fitur pelayanan dapat dikembangkan dan didistribusikan melalui alur delivery yang lebih konsisten, dengan dukungan operasional setelah deployment.']
    ],
    values: [
      ['.skip-link', 'Lewati ke konten'], ['.hero-text', 'Saya membangun aplikasi yang andal, mengotomasi proses deployment, dan memastikan infrastruktur server tetap aman, stabil, serta siap berkembang.'],
      ['.cta-text', 'Mulai percakapan'], ['.actions .ghost', 'Unduh CV'], ['.hero-footer span:last-child', 'Scroll untuk menjelajah'],
      ['#about .section-index p', 'Tentang saya'], ['.about-grid h2', 'Menjembatani <em>code</em> dan <em>infrastructure.</em>'],
      ['.body-copy p:first-child', 'Saya mengembangkan solusi digital dari antarmuka pengguna hingga layanan backend dan lingkungan produksinya. Bagi saya, produk yang baik bukan hanya terlihat rapi—tetapi juga cepat, mudah dirawat, dan dapat diandalkan.'],
      ['.body-copy p:last-child', 'Saat ini saya merangkap sebagai Software Engineer, DevOps, dan Server Specialist: menangani pengembangan aplikasi, otomasi CI/CD, deployment, konfigurasi server, serta pemantauan layanan.'],
      ['.capabilities article:nth-child(1) p', 'Aplikasi web modern, API, integrasi sistem, dan database.'], ['.capabilities article:nth-child(2) p', 'Pipeline otomatis, deployment konsisten, dan workflow delivery.'], ['.capabilities article:nth-child(3) p', 'Konfigurasi, observabilitas, troubleshooting, dan reliability.'],
      ['#experience .section-index p', 'Pengalaman terkini'], ['.exp-period', '<i></i> 2024—Sekarang'], ['.exp-summary > p', 'Mengembangkan sistem aplikasi pelayanan pelanggan PLN sekaligus mendukung delivery dan operasional layanan pada lingkungan server.'],
      ['.exp-summary li:nth-child(1)', 'Pengembangan dan peningkatan aplikasi pelayanan pelanggan.'], ['.exp-summary li:nth-child(2)', 'Otomasi build dan deployment melalui pipeline CI/CD.'], ['.exp-summary li:nth-child(3)', 'Pengelolaan, monitoring, dan troubleshooting server aplikasi.'], ['.exp-summary li:nth-child(4)', 'Kolaborasi lintas tim untuk menjaga stabilitas layanan.'],
      ['#work .section-index p', 'Karya pilihan'], ['.work-heading h2', 'Dari rack rumahan hingga layanan yang <em>berjalan.</em>'], ['.work-heading > p', 'Visualisasi proyek yang menggambarkan fokus saya pada infrastructure, observability, dan pengembangan aplikasi web.'],
      ['.project:nth-child(1) .project-description', 'Lingkungan eksperimental untuk mempelajari networking, virtualisasi, deployment, dan operasional layanan secara langsung.'], ['.project:nth-child(2) .project-description', 'Konsep pemantauan health, resource, log, dan availability untuk mendeteksi masalah sebelum berdampak ke pengguna.'], ['.project:nth-child(3) .project-description', 'Visualisasi aplikasi responsif untuk merangkum percakapan, performa tim, dan insight pelayanan dalam satu tampilan.'],
      ['.contact-inner > h2', 'Ada aplikasi untuk dibangun atau server untuk dijaga?'], ['.contact-inner > p', 'Ceritakan kebutuhannya. Saya siap berdiskusi tentang pengembangan produk, otomasi deployment, dan reliability sistem.'], ['.contact-link > span', 'Chat via WhatsApp'], ['footer a[href="#home"]', 'Kembali ke atas ↑']
    ]
  },
  en: {
    description: 'Portfolio of Anam Maulana — Software Engineer, DevOps, and Server Specialist based in Indonesia.',
    menu: ['About', 'Experience', 'Work'], menuOpen: 'Open navigation', menuClose: 'Close navigation', switchLabel: 'Ganti ke Bahasa Indonesia',
    waLabel: 'Start a WhatsApp conversation with Anam',
    wa: ['Hi Anam, I saw your portfolio and would like to discuss something with you.', 'Hi Anam, I am interested in collaborating after seeing your portfolio.', 'Hi Anam, I would like to discuss a project with you.'],
    caseButton: 'View case study', caseLabels: ['Objective', 'Contribution', 'Technology', 'Outcome'],
    cases: [
      ['Build a private environment for testing deployments and service configurations without affecting production systems.', 'Designed the equipment layout and set up Linux systems, local networking, containers, deployment scenarios, and troubleshooting exercises.', 'Linux, Docker, networking, reverse proxy, Jenkins, and shell scripting.', 'Created a reusable lab for application experiments, deployment automation, and incident-response simulations.'],
      ['Bring service-health indicators together so anomalies in resources, logs, and availability are easier to spot.', 'Defined key operational signals, structured the dashboard, and designed a diagnostic flow for investigating service issues.', 'Linux metrics, service health checks, log monitoring, uptime monitoring, and observability dashboards.', 'Produced a centralized monitoring concept that simplifies service checks and makes troubleshooting more focused.'],
      ['Support customer-service operations through an application that brings operational information into one interface.', 'Developed and improved application features, integrated the frontend with backend services, and supported server deployment.', 'JavaScript, Java, Quarkus, REST API, MySQL/PostgreSQL, Linux, and CI/CD.', 'Enabled service features to be developed and delivered through a more consistent workflow with post-deployment operational support.']
    ],
    values: [
      ['.skip-link', 'Skip to content'], ['.hero-text', 'I build reliable applications, automate deployment processes, and keep server infrastructure secure, stable, and ready to scale.'],
      ['.cta-text', 'Start a conversation'], ['.actions .ghost', 'Download CV'], ['.hero-footer span:last-child', 'Scroll to explore'],
      ['#about .section-index p', 'About me'], ['.about-grid h2', 'Bridging <em>code</em> and <em>infrastructure.</em>'],
      ['.body-copy p:first-child', 'I develop digital solutions from user interfaces to backend services and their production environments. To me, a good product is not only polished—it is fast, maintainable, and dependable.'],
      ['.body-copy p:last-child', 'I currently work across Software Engineering, DevOps, and Server Operations: handling application development, CI/CD automation, deployment, server configuration, and service monitoring.'],
      ['.capabilities article:nth-child(1) p', 'Modern web applications, APIs, system integration, and databases.'], ['.capabilities article:nth-child(2) p', 'Automated pipelines, consistent deployments, and delivery workflows.'], ['.capabilities article:nth-child(3) p', 'Configuration, observability, troubleshooting, and reliability.'],
      ['#experience .section-index p', 'Current experience'], ['.exp-period', '<i></i> 2024—Present'], ['.exp-summary > p', 'Developing PLN customer service applications while supporting service delivery and operations across server environments.'],
      ['.exp-summary li:nth-child(1)', 'Develop and improve customer service applications.'], ['.exp-summary li:nth-child(2)', 'Automate builds and deployments through CI/CD pipelines.'], ['.exp-summary li:nth-child(3)', 'Manage, monitor, and troubleshoot application servers.'], ['.exp-summary li:nth-child(4)', 'Collaborate across teams to maintain service stability.'],
      ['#work .section-index p', 'Selected work'], ['.work-heading h2', 'From a home rack to services that <em>stay alive.</em>'], ['.work-heading > p', 'Project visualizations reflecting my focus on infrastructure, observability, and web application development.'],
      ['.project:nth-child(1) .project-description', 'An experimental environment for hands-on learning in networking, virtualization, deployment, and service operations.'], ['.project:nth-child(2) .project-description', 'A monitoring concept covering health, resources, logs, and availability to catch issues before users are affected.'], ['.project:nth-child(3) .project-description', 'A responsive application concept bringing conversations, team performance, and service insights into one interface.'],
      ['.contact-inner > h2', 'Have an application to build or a server to keep running?'], ['.contact-inner > p', 'Tell me what you need. I am ready to discuss product development, deployment automation, and system reliability.'], ['.contact-link > span', 'Chat on WhatsApp'], ['footer a[href="#home"]', 'Back to top ↑']
    ]
  }
};

let currentLanguage = localStorage.getItem('portfolio-language') === 'en' ? 'en' : 'id';

function closeMenu() {
  navigation.classList.remove('open'); document.body.classList.remove('menu-open');
  menuButton.setAttribute('aria-expanded', 'false'); menuButton.setAttribute('aria-label', translations[currentLanguage].menuOpen);
}

function setLanguage(language) {
  currentLanguage = language;
  const content = translations[language];
  document.documentElement.lang = language;
  document.querySelector('meta[name="description"]').content = content.description;
  document.querySelectorAll('nav > a:not(.nav-contact)').forEach((link, index) => { link.textContent = content.menu[index]; });
  content.values.forEach(([selector, html]) => { const element = document.querySelector(selector); if (element) element.innerHTML = html; });
  document.querySelectorAll('.project-case').forEach((caseStudy, projectIndex) => {
    caseStudy.querySelector('summary span').textContent = content.caseButton;
    caseStudy.querySelectorAll('.case-grid > div').forEach((item, detailIndex) => {
      item.querySelector('small').textContent = content.caseLabels[detailIndex];
      item.querySelector('p').textContent = content.cases[projectIndex][detailIndex];
    });
  });
  document.querySelectorAll('.wa-link').forEach((link, index) => { link.href = `https://wa.me/6283114237048?text=${encodeURIComponent(content.wa[index])}`; });
  document.querySelector('.contact-link').setAttribute('aria-label', content.waLabel);
  languageButton.setAttribute('aria-label', content.switchLabel);
  languageButton.querySelectorAll('span').forEach((item, index) => item.classList.toggle('active', index === (language === 'id' ? 0 : 1)));
  localStorage.setItem('portfolio-language', language);
  menuButton.setAttribute('aria-label', navigation.classList.contains('open') ? content.menuClose : content.menuOpen);
}

menuButton.addEventListener('click', () => {
  const isOpen = navigation.classList.toggle('open'); document.body.classList.toggle('menu-open', isOpen);
  menuButton.setAttribute('aria-expanded', String(isOpen)); menuButton.setAttribute('aria-label', isOpen ? translations[currentLanguage].menuClose : translations[currentLanguage].menuOpen);
});
languageButton.addEventListener('click', () => setLanguage(currentLanguage === 'id' ? 'en' : 'id'));
navigation.querySelectorAll('a').forEach(link => link.addEventListener('click', closeMenu));
document.addEventListener('keydown', event => { if (event.key === 'Escape') closeMenu(); });
window.addEventListener('resize', () => { if (window.innerWidth > 900) closeMenu(); });
window.addEventListener('scroll', () => header.classList.toggle('scrolled', window.scrollY > 20), { passive: true });
const revealObserver = new IntersectionObserver(entries => entries.forEach(entry => { if (entry.isIntersecting) { entry.target.classList.add('visible'); revealObserver.unobserve(entry.target); } }), { threshold: 0.1 });
document.querySelectorAll('.reveal').forEach(element => revealObserver.observe(element));
document.getElementById('year').textContent = new Date().getFullYear();
setLanguage(currentLanguage);
