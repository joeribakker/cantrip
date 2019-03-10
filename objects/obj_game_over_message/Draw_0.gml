draw_set_halign(fa_center);
draw_set_colour(global.palette_5);
draw_text_ext(room_width / 2, 84, "You died!", 8, 160);

draw_set_colour(global.palette_1);
draw_text_ext(room_width / 2, 100, "You reached room " + string(current_room_number) + " on floor " + string(current_floor_number) + "\nafter winning " + string(battles_won) + " battles.", 8, 160);

draw_set_colour(global.palette_1);
if (random_message == 0) {
	draw_text_ext(room_width / 2, 124, "Maybe it just wasn't in the cards for you...", 8, 192);
} else {
	draw_text_ext(room_width / 2, 124, "Better luck next time!", 8, 192);
}