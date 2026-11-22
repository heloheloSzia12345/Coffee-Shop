module ApplicationHelper
  TRANSLATIONS = {
    "Magyar" => {
      app_title: "Fekete Macska Kávézó",
      dashboard: "Kezdőlap",
      profile: "Profil adatok",
      offers: "Ajánlatok",
      cart: "Kosár",
      settings: "Beállítások",
      logout: "Kijelentkezés",
      login: "Bejelentkezés",
      register: "Regisztráció",
      save: "Mentés",
      language: "Nyelv:",
      dark_mode: "Sötét mód",
      your_cart: "Kosarad",
      place_order: "Megrendelés leadása",
      add_to_cart: "Kosárba +",
      search: "Keresés"
    },
    "English" => {
      app_title: "Black Cat Coffee Shop",
      dashboard: "Dashboard",
      profile: "Profile",
      offers: "Offers",
      cart: "Cart",
      settings: "Settings",
      logout: "Logout",
      login: "Login",
      register: "Register",
      save: "Save",
      language: "Language:",
      dark_mode: "Dark mode",
      your_cart: "Your Cart",
      place_order: "Place Order",
      add_to_cart: "Add to cart +",
      search: "Search"
    },
    "Deutsch" => {
      app_title: "Schwarze Katze Café",
      dashboard: "Startseite",
      profile: "Profil",
      offers: "Angebote",
      cart: "Warenkorb",
      settings: "Einstellungen",
      logout: "Abmelden",
      login: "Anmelden",
      register: "Registrieren",
      save: "Speichern",
      language: "Sprache:",
      dark_mode: "Dunkelmodus",
      your_cart: "Dein Warenkorb",
      place_order: "Bestellung aufgeben",
      add_to_cart: "In den Warenkorb +",
      search: "Suchen"
    }
  }.freeze

  def tr(key)
    lang = session[:language] || "Magyar"
    TRANSLATIONS.dig(lang, key) || TRANSLATIONS["Magyar"][key] || key.to_s
  end
end
