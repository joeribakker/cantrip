function scr_battle_won() {
	if (state_new) {
		obj_game_manager.battles_won += 1;
	
		var battle_won_announcement = instance_create_layer(0, 0, "Messages", obj_announcement);
		battle_won_announcement.text = "Victory!";
		battle_won_announcement.text_color = global.palette_4;
	}

	if (state_timer >= 3 * room_speed) {
		with (obj_game_manager) {
			if (!scr_has_next_room(floors, current_floor, current_room)) {
				state_switch("victory");
				exit;
			}
			
			if (obj_game_manager.game_mode == "loot") {
				state_switch("gotoDraft");
			}
			
			if (obj_game_manager.game_mode == "draft") {
				state_switch("gotoTravel");
			}

			exit;
		}
	}


}
