if 'guake' in window.get_active_title().lower():
    keyboard.send_keys("<alt>+/")
else:
    keyboard.send_keys("<shift>+<tab>")
