function scr_can_character_play_card(source, card) {
	var opponent = scr_get_opponent_of_character(source);

	if (!is_undefined(card.condition)) {
		var condition_result = script_execute(card.condition, opponent, source);

		return !card.is_unplayable
			&& card.cost <= source.ability_points
			&& condition_result
	}

	return !card.is_unplayable && card.cost <= source.ability_points;
}
