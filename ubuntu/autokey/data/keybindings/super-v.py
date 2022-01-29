if 'guake' in window.get_active_title().lower():
    keyboard.send_keys("<shift>+<ctrl>+v")
else:
    keyboard.send_keys("<ctrl>+v")