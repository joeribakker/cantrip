function scr_calculate_position_x_in_hand(
	index_of_card_in_hand,
	amount_of_cards_in_hand,
	hand_position_x,
	hand_width
) {
	var card_width = 64;

	if ((amount_of_cards_in_hand * card_width) <= hand_width) {
		return floor((hand_position_x + (hand_width / 2)) - ((card_width / 2) * amount_of_cards_in_hand) + (index_of_card_in_hand * card_width));
	}
	
	if (index_of_card_in_hand == 0) {
		return hand_position_x;
	}
	
	if (index_of_card_in_hand == amount_of_cards_in_hand - 1) {
		return hand_position_x + hand_width - card_width;
	}
	
	return hand_position_x + (index_of_card_in_hand * ((hand_width - card_width) / (amount_of_cards_in_hand - 1)));
}
