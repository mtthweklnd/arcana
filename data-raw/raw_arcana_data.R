#' Create Major Arcana Dataset Using new_arcana() Function
#'
#' This approach creates a more object-oriented dataset where each card
#' is represented as both upright and reversed arcana objects.
#' 
arcana_data <- list(
  list(number = 0, name = "The Fool",
       upright = "new beginnings, innocence, spontaneity, free spirit",
       reversed = "holding back, recklessness, risk-taking"),
  
  list(number = 1, name = "The Magician",
       upright = "manifestation, resourcefulness, power, inspired action",
       reversed = "manipulation, poor planning, untapped talents"),
  
  list(number = 2, name = "The High Priestess",
       upright = "intuition, sacred knowledge, divine feminine, subconscious mind",
       reversed = "secrets, disconnected from intuition, withdrawal"),
  
  list(number = 3, name = "The Empress",
       upright = "femininity, beauty, nature, nurturing, abundance",
       reversed = "creative block, dependence on others"),
  
  list(number = 4, name = "The Emperor",
       upright = "authority, establishment, structure, father figure",
       reversed = "tyrant, domineering, rigidity, coldness"),
  
  list(number = 5, name = "The Hierophant",
       upright = "spiritual wisdom, religious beliefs, conformity, tradition",
       reversed = "personal beliefs, freedom, challenging the status quo"),
  
  list(number = 6, name = "The Lovers",
       upright = "love, harmony, relationships, values alignment",
       reversed = "self-love, disharmony, imbalance, misalignment"),
  
  list(number = 7, name = "The Chariot",
       upright = "control, willpower, success, determination",
       reversed = "self-discipline, opposition, lack of direction"),
  
  list(number = 8, name = "Strength",
       upright = "strength, courage, persuasion, influence, compassion",
       reversed = "self doubt, low energy, raw emotion"),
  
  list(number = 9, name = "The Hermit",
       upright = "soul searching, introspection, inner guidance, solitude",
       reversed = "isolation, loneliness, withdrawal"),
  
  list(number = 10, name = "Wheel of Fortune",
       upright = "good luck, karma, life cycles, destiny, turning point",
       reversed = "negative cycles, lack of control, clinging to control"),
  
  list(number = 11, name = "Justice",
       upright = "justice, fairness, truth, cause and effect, law",
       reversed = "unfairness, lack of responsibility, dishonesty"),
  
  list(number = 12, name = "The Hanged Man",
       upright = "suspension, restriction, letting go, sacrifice",
       reversed = "delays, resistance, stalling, indecision"),
  
  list(number = 13, name = "Death",
       upright = "endings, beginnings, change, transformation, transition",
       reversed = "resistance to change, personal transformation, inner purging"),
  
  list(number = 14, name = "Temperance",
       upright = "balance, moderation, patience, purpose, meaning",
       reversed = "imbalance, excess, self-healing, re-alignment"),
  
  list(number = 15, name = "The Devil",
       upright = "bondage, addiction, sexuality, materialism",
       reversed = "releasing limiting beliefs, exploring dark thoughts, detachment"),
  
  list(number = 16, name = "The Tower",
       upright = "sudden change, upheaval, chaos, revelation, awakening",
       reversed = "personal transformation, fear of change, averting disaster"),
  
  list(number = 17, name = "The Star",
       upright = "hope, faith, purpose, renewal, spirituality",
       reversed = "lack of faith, despair, self-trust, disconnection"),
  
  list(number = 18, name = "The Moon",
       upright = "illusion, fear, anxiety, subconscious, intuition",
       reversed = "releasing fear, repressed emotion, inner confusion"),
  
  list(number = 19, name = "The Sun",
       upright = "positivity, fun, warmth, success, vitality",
       reversed = "inner child, feeling down, overly optimistic"),
  
  list(number = 20, name = "Judgement",
       upright = "judgement, rebirth, inner calling, absolution",
       reversed = "self-doubt, inner critic, ignoring the call"),
  
  list(number = 21, name = "The World",
       upright = "completion, integration, accomplishment, travel",
       reversed = "personal closure, incomplete, stagnation")
)

create_major_arcana_objects <- function() {
  all_cards <- list()
  
  for (card_data in arcana_data) {
    # Create upright version
    upright_card <- new_arcana(
      name = card_data$name,
      orientation = "upright",
      keywords = card_data$upright,
      number = card_data$number
    )
    
    # Create reversed version
    reversed_card <- new_arcana(
      name = card_data$name,
      orientation = "reversed", 
      keywords = card_data$reversed,
      number = card_data$number
    )
    
    # Add both versions to the list
    all_cards[[paste0(card_data$name, "_upright")]] <- upright_card
    all_cards[[paste0(card_data$name, "_reversed")]] <- reversed_card
  }
  
  return(all_cards)
}

major_arcana_objects <- create_major_arcana_objects()

usethis::use_data(arcana_data, overwrite = TRUE, internal = TRUE)
usethis::use_data(major_arcana_objects, overwrite = TRUE)
