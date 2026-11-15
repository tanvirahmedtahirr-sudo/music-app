import flet as ft

def main(page: ft.Page):
    page.title = "My Music App"
    page.theme_mode = ft.ThemeMode.DARK

    song_list = ft.Column()

    def search_clicked(e):
        song_list.controls.append(ft.Text(f"Searching: {search_box.value}"))
        page.update()

    search_box = ft.TextField(hint_text="Search a song...")
    search_btn = ft.FilledButton("Search", on_click=search_clicked)

    page.add(
        ft.Text("🎵 My Music App", size=30, weight=ft.FontWeight.BOLD),
        search_box,
        search_btn,
        song_list,
    )

ft.app(main, view=ft.AppView.WEB_BROWSER)
