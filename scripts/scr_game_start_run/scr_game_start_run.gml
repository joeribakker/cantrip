function scr_game_start_run() {
	if (state_new) {
		floors = scr_generate_floors();
		
		if (game_mode == "loot") {
			player_deck_list = scr_get_deck_list_starter();
		}
		
		if (game_mode == "draft") {
			player_deck_list = scr_get_deck_list_empty();
		}
		
		player_max_hand_size = 7;
		player_max_ability_points = 3;
		battles_won = 0;
		current_room = undefined;
		current_floor = undefined;
		
		run_duration = 0;
		is_run_timer_running = true;
	
		with (obj_pause_controller) {
			state_switch("unpaused");
		}
	
		state_switch("gotoDraft");
	}


}
