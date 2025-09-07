#' Create Major Arcana Datasets
#'
#' This script generates two package data objects:
#' 1. `major_arcana_data`: A user-facing tibble containing the raw data
#'    for the 22 Major Arcana cards. Keywords are stored in list-columns.
#' 2. `major_arcana_objects`: An internal list of `arcana` S3 objects,
#'    one for each card in both upright and reversed orientations.
#'
major_arcana_list <- list(
     the_fool = list(
          number = 0,
          name = "The Fool",
          upright = "new beginnings, innocence, spontaneity, free spirit",
          reversed = "holding back, recklessness, risk-taking",
          emoji = "\U0001F0CF"
     ),

     the_magician = list(
          number = 1,
          name = "The Magician",
          upright = "manifestation, resourcefulness, power, inspired action",
          reversed = "manipulation, poor planning, untapped talents",
          emoji = "\U0001FA84"
     ),

     the_high_priestess = list(
          number = 2,
          name = "The High Priestess",
          upright = "intuition, sacred knowledge, divine feminine, subconscious mind",
          reversed = "secrets, disconnected from intuition, withdrawal",
          emoji = "\U0001F52E"
     ),

     the_empress = list(
          number = 3,
          name = "The Empress",
          upright = "femininity, beauty, nature, nurturing, abundance",
          reversed = "creative block, dependence on others",
          emoji = "\U0001F930"
     ),

     the_emperor = list(
          number = 4,
          name = "The Emperor",
          upright = "authority, establishment, structure, father figure",
          reversed = "tyrant, domineering, rigidity, coldness",
          emoji = "\U0001F451"
     ),

     the_hierophant = list(
          number = 5,
          name = "The Hierophant",
          upright = "spiritual wisdom, religious beliefs, conformity, tradition",
          reversed = "personal beliefs, freedom, challenging the status quo",
          emoji = "\U0001F64F"
     ),

     the_lovers = list(
          number = 6,
          name = "The Lovers",
          upright = "love, harmony, relationships, values alignment",
          reversed = "self-love, disharmony, imbalance, misalignment",
          emoji = "\U0001F49E"
     ),

     the_chariot = list(
          number = 7,
          name = "The Chariot",
          upright = "control, willpower, success, determination",
          reversed = "self-discipline, opposition, lack of direction",
          emoji = "\U0001F697"
     ),

     strength = list(
          number = 8,
          name = "Strength",
          upright = "strength, courage, persuasion, influence, compassion",
          reversed = "self doubt, low energy, raw emotion",
          emoji = "\U0001F4AA"
     ),

     the_hermit = list(
          number = 9,
          name = "The Hermit",
          upright = "soul searching, introspection, inner guidance, solitude",
          reversed = "isolation, loneliness, withdrawal",
          emoji = "\U0001f4a1"
     ),

     wheel_of_fortune = list(
          number = 10,
          name = "Wheel of Fortune",
          upright = "good luck, karma, life cycles, destiny, turning point",
          reversed = "negative cycles, lack of control, clinging to control",
          emoji = "\U0001F3A1"
     ),

     justice = list(
          number = 11,
          name = "Justice",
          upright = "justice, fairness, truth, cause and effect, law",
          reversed = "unfairness, lack of responsibility, dishonesty",
          emoji = "\U00002696"
     ),

     the_hanged_man = list(
          number = 12,
          name = "The Hanged Man",
          upright = "suspension, restriction, letting go, sacrifice",
          reversed = "delays, resistance, stalling, indecision",
          emoji = "\U0001F938"
     ),

     death = list(
          number = 13,
          name = "Death",
          upright = "endings, beginnings, change, transformation, transition",
          reversed = "resistance to change, personal transformation, inner purging",
          emoji = "\U0001F480"
     ),

     temperance = list(
          number = 14,
          name = "Temperance",
          upright = "balance, moderation, patience, purpose, meaning",
          reversed = "imbalance, excess, self-healing, re-alignment",
          emoji = "\U0001F9D8"
     ),

     the_devil = list(
          number = 15,
          name = "The Devil",
          upright = "bondage, addiction, sexuality, materialism",
          reversed = "releasing limiting beliefs, exploring dark thoughts, detachment",
          emoji = "\U0001F608"
     ),

     the_tower = list(
          number = 16,
          name = "The Tower",
          upright = "sudden change, upheaval, chaos, revelation, awakening",
          reversed = "personal transformation, fear of change, averting disaster",
          emoji = "\U0001F4A5"
     ),

     the_star = list(
          number = 17,
          name = "The Star",
          upright = "hope, faith, purpose, renewal, spirituality",
          reversed = "lack of faith, despair, self-trust, disconnection",
          emoji = "\U00002B50"
     ),

     the_moon = list(
          number = 18,
          name = "The Moon",
          upright = "illusion, fear, anxiety, subconscious, intuition",
          reversed = "releasing fear, repressed emotion, inner confusion",
          emoji = "\U0001F315"
     ),

     the_sun = list(
          number = 19,
          name = "The Sun",
          upright = "positivity, fun, warmth, success, vitality",
          reversed = "inner child, feeling down, overly optimistic",
          emoji = "\U00002600"
     ),

     judgement = list(
          number = 20,
          name = "Judgement",
          upright = "judgement, rebirth, inner calling, absolution",
          reversed = "self-doubt, inner critic, ignoring the call",
          emoji = "\U0001F4EF"
     ),

     the_world = list(
          number = 21,
          name = "The World",
          upright = "completion, integration, accomplishment, travel",
          reversed = "personal closure, incomplete, stagnation",
          emoji = "\U0001F30E"
     )
)

major_arcana_data <- major_arcana_list |>
     purrr::map(
          ~ tibble::tibble(
               number = as.integer(.x$number),
               name = .x$name,
               upright_keywords = list(
                    stringr::str_split(.x$upright, ",\\s*")[[
                         1
                    ]]
               ),
               reversed_keywords = list(
                    stringr::str_split(
                         .x$reversed,
                         ",\\s*"
                    )[[1]]
               ),
               emoji = .x$emoji
          )
     ) |>
     purrr::list_rbind()

# 3. Create Internal S3 Objects
# =============================
# Helper function to create objects for one card
create_arcana_pair <- function(card) {
     upright_obj <- new_arcana(
          name = card$name,
          orientation = "upright",
          keywords = stringr::str_split(card$upright, ",\\s*")[[1]],
          number = card$number,
          emoji = card$emoji
     )

     reversed_obj <- new_arcana(
          name = card$name,
          orientation = "reversed",
          keywords = stringr::str_split(card$reversed, ",\\s*")[[1]],
          number = card$number,
          emoji = card$emoji
     )

     list(upright = upright_obj, reversed = reversed_obj)
}

major_arcana_objects <- purrr::map(major_arcana_list, create_arcana_pair)

create_major_arcana_objects <- function() {
     all_cards <- list()

     for (card_data in major_arcana_list) {
          # Create upright version
          upright_card <- new_arcana(
               name = card_data$name,
               emoji = card_data$emoji,
               orientation = "upright",
               keywords = card_data$upright,
               number = card_data$number
          )

          # Create reversed version
          reversed_card <- new_arcana(
               name = card_data$name,
               emoji = card_data$emoji,
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

.major_arcana_objects <- create_major_arcana_objects()

usethis::use_data(
     major_arcana_list,
     major_arcana_data,
     .major_arcana_objects,
     overwrite = TRUE
)
