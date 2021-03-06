function scr_game_start() {
	if (state_new) {
		if (room != room_start) {
			room_goto(room_start);
			exit;
		}
	
		scr_load_game();

		game_mode = "loot";

		perks = {
			forbidden_alchemy: false,
			supermoon: false,
			clairvoyant: false,
			vampires_curse: false,
		};
		
		obj_music_controller.add_tracks(obj_music_controller.music_for_title_screen);
	}
}
