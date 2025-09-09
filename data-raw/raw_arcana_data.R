#' Create Major Arcana Datasets
#'
#' This script generates three package data objects:
#' 1. `major_arcana_list`: A user-facing nested list containing the raw data
#'     for the 22 Major Arcana cards.
#' 2. `major_arcana_data`: A user-facing tibble version of the the raw data
#'    for the 22 Major Arcana cards. Keywords are stored in list-columns.
#' 2. `.major_arcana_objects`: An internal list of `arcana` class objects,
#'    one for each card in both upright and reversed orientations.
#'
major_arcana_list <- list(
     the_fool = list(
          number = 0L,
          number = 0L,
          name = "The Fool",
          upright = c(
               "new beginnings",
               "innocence",
               "spontaneity",
               "free spirit"
          ),
          reversed = c("holding back", "recklessness", "risk-taking"),
          upright = c(
               "new beginnings",
               "innocence",
               "spontaneity",
               "free spirit"
          ),
          reversed = c("holding back", "recklessness", "risk-taking"),
          emoji = "\U0001F0CF"
     ),
     the_magician = list(
          number = 1L,
          number = 1L,
          name = "The Magician",
          upright = c(
               "manifestation",
               "resourcefulness",
               "power",
               "inspired action"
          ),
          reversed = c("manipulation", "poor planning", "untapped talents"),
          upright = c(
               "manifestation",
               "resourcefulness",
               "power",
               "inspired action"
          ),
          reversed = c("manipulation", "poor planning", "untapped talents"),
          emoji = "\U0001FA84"
     ),
     the_high_priestess = list(
          number = 2L,
          number = 2L,
          name = "The High Priestess",
          upright = c(
               "intuition",
               "sacred knowledge",
               "divine feminine",
               "subconscious mind"
          ),
          reversed = c("secrets", "disconnected from intuition", "withdrawal"),
          upright = c(
               "intuition",
               "sacred knowledge",
               "divine feminine",
               "subconscious mind"
          ),
          reversed = c("secrets", "disconnected from intuition", "withdrawal"),
          emoji = "\U0001F52E"
     ),
     the_empress = list(
          number = 3L,
          number = 3L,
          name = "The Empress",
          upright = c(
               "femininity",
               "beauty",
               "nature",
               "nurturing",
               "abundance"
          ),
          reversed = c("creative block", "dependence on others"),
          upright = c(
               "femininity",
               "beauty",
               "nature",
               "nurturing",
               "abundance"
          ),
          reversed = c("creative block", "dependence on others"),
          emoji = "\U0001F930"
     ),
     the_emperor = list(
          number = 4L,
          number = 4L,
          name = "The Emperor",
          upright = c(
               "authority",
               "establishment",
               "structure",
               "father figure"
          ),
          reversed = c("tyrant", "domineering", "rigidity", "coldness"),
          upright = c(
               "authority",
               "establishment",
               "structure",
               "father figure"
          ),
          reversed = c("tyrant", "domineering", "rigidity", "coldness"),
          emoji = "\U0001F451"
     ),
     the_hierophant = list(
          number = 5L,
          number = 5L,
          name = "The Hierophant",
          upright = c(
               "spiritual wisdom",
               "religious beliefs",
               "conformity",
               "tradition"
          ),
          reversed = c(
               "personal beliefs",
               "freedom",
               "challenging the status quo"
          ),
          upright = c(
               "spiritual wisdom",
               "religious beliefs",
               "conformity",
               "tradition"
          ),
          reversed = c(
               "personal beliefs",
               "freedom",
               "challenging the status quo"
          ),
          emoji = "\U0001F64F"
     ),
     the_lovers = list(
          number = 6L,
          number = 6L,
          name = "The Lovers",
          upright = c("love", "harmony", "relationships", "values alignment"),
          reversed = c("self-love", "disharmony", "imbalance", "misalignment"),
          upright = c("love", "harmony", "relationships", "values alignment"),
          reversed = c("self-love", "disharmony", "imbalance", "misalignment"),
          emoji = "\U0001F49E"
     ),
     the_chariot = list(
          number = 7L,
          number = 7L,
          name = "The Chariot",
          upright = c("control", "willpower", "success", "determination"),
          reversed = c("self-discipline", "opposition", "lack of direction"),
          upright = c("control", "willpower", "success", "determination"),
          reversed = c("self-discipline", "opposition", "lack of direction"),
          emoji = "\U0001F697"
     ),
     strength = list(
          number = 8L,
          number = 8L,
          name = "Strength",
          upright = c(
               "strength",
               "courage",
               "persuasion",
               "influence",
               "compassion"
          ),
          reversed = c("self doubt", "low energy", "raw emotion"),
          upright = c(
               "strength",
               "courage",
               "persuasion",
               "influence",
               "compassion"
          ),
          reversed = c("self doubt", "low energy", "raw emotion"),
          emoji = "\U0001F4AA"
     ),
     the_hermit = list(
          number = 9L,
          number = 9L,
          name = "The Hermit",
          upright = c(
               "soul searching",
               "introspection",
               "inner guidance",
               "solitude"
          ),
          reversed = c("isolation", "loneliness", "withdrawal"),
          upright = c(
               "soul searching",
               "introspection",
               "inner guidance",
               "solitude"
          ),
          reversed = c("isolation", "loneliness", "withdrawal"),
          emoji = "\U0001f4a1"
     ),
     wheel_of_fortune = list(
          number = 10L,
          number = 10L,
          name = "Wheel of Fortune",
          upright = c(
               "good luck",
               "karma",
               "life cycles",
               "destiny",
               "turning point"
          ),
          reversed = c(
               "negative cycles",
               "lack of control",
               "clinging to control"
          ),
          upright = c(
               "good luck",
               "karma",
               "life cycles",
               "destiny",
               "turning point"
          ),
          reversed = c(
               "negative cycles",
               "lack of control",
               "clinging to control"
          ),
          emoji = "\U0001F3A1"
     ),
     justice = list(
          number = 11L,
          number = 11L,
          name = "Justice",
          upright = c(
               "justice",
               "fairness",
               "truth",
               "cause and effect",
               "law"
          ),
          reversed = c("unfairness", "lack of responsibility", "dishonesty"),
          upright = c(
               "justice",
               "fairness",
               "truth",
               "cause and effect",
               "law"
          ),
          reversed = c("unfairness", "lack of responsibility", "dishonesty"),
          emoji = "\U00002696"
     ),
     the_hanged_man = list(
          number = 12L,
          number = 12L,
          name = "The Hanged Man",
          upright = c("suspension", "restriction", "letting go", "sacrifice"),
          reversed = c("delays", "resistance", "stalling", "indecision"),
          upright = c("suspension", "restriction", "letting go", "sacrifice"),
          reversed = c("delays", "resistance", "stalling", "indecision"),
          emoji = "\U0001F938"
     ),
     death = list(
          number = 13L,
          number = 13L,
          name = "Death",
          upright = c(
               "endings",
               "beginnings",
               "change",
               "transformation",
               "transition"
          ),
          reversed = c(
               "resistance to change",
               "personal transformation",
               "inner purging"
          ),
          upright = c(
               "endings",
               "beginnings",
               "change",
               "transformation",
               "transition"
          ),
          reversed = c(
               "resistance to change",
               "personal transformation",
               "inner purging"
          ),
          emoji = "\U0001F480"
     ),
     temperance = list(
          number = 14L,
          number = 14L,
          name = "Temperance",
          upright = c(
               "balance",
               "moderation",
               "patience",
               "purpose",
               "meaning"
          ),
          reversed = c("imbalance", "excess", "self-healing", "re-alignment"),
          upright = c(
               "balance",
               "moderation",
               "patience",
               "purpose",
               "meaning"
          ),
          reversed = c("imbalance", "excess", "self-healing", "re-alignment"),
          emoji = "\U0001F9D8"
     ),
     the_devil = list(
          number = 15L,
          number = 15L,
          name = "The Devil",
          upright = c("bondage", "addiction", "sexuality", "materialism"),
          reversed = c(
               "releasing limiting beliefs",
               "exploring dark thoughts",
               "detachment"
          ),
          upright = c("bondage", "addiction", "sexuality", "materialism"),
          reversed = c(
               "releasing limiting beliefs",
               "exploring dark thoughts",
               "detachment"
          ),
          emoji = "\U0001F608"
     ),
     the_tower = list(
          number = 16L,
          number = 16L,
          name = "The Tower",
          upright = c(
               "sudden change",
               "upheaval",
               "chaos",
               "revelation",
               "awakening"
          ),
          reversed = c(
               "personal transformation",
               "fear of change",
               "averting disaster"
          ),
          upright = c(
               "sudden change",
               "upheaval",
               "chaos",
               "revelation",
               "awakening"
          ),
          reversed = c(
               "personal transformation",
               "fear of change",
               "averting disaster"
          ),
          emoji = "\U0001F4A5"
     ),
     the_star = list(
          number = 17L,
          number = 17L,
          name = "The Star",
          upright = c("hope", "faith", "purpose", "renewal", "spirituality"),
          reversed = c(
               "lack of faith",
               "despair",
               "self-trust",
               "disconnection"
          ),
          upright = c("hope", "faith", "purpose", "renewal", "spirituality"),
          reversed = c(
               "lack of faith",
               "despair",
               "self-trust",
               "disconnection"
          ),
          emoji = "\U00002B50"
     ),
     the_moon = list(
          number = 18L,
          number = 18L,
          name = "The Moon",
          upright = c(
               "illusion",
               "fear",
               "anxiety",
               "subconscious",
               "intuition"
          ),
          reversed = c(
               "releasing fear",
               "repressed emotion",
               "inner confusion"
          ),
          upright = c(
               "illusion",
               "fear",
               "anxiety",
               "subconscious",
               "intuition"
          ),
          reversed = c(
               "releasing fear",
               "repressed emotion",
               "inner confusion"
          ),
          emoji = "\U0001F315"
     ),
     the_sun = list(
          number = 19L,
          number = 19L,
          name = "The Sun",
          upright = c("positivity", "fun", "warmth", "success", "vitality"),
          reversed = c("inner child", "feeling down", "overly optimistic"),
          upright = c("positivity", "fun", "warmth", "success", "vitality"),
          reversed = c("inner child", "feeling down", "overly optimistic"),
          emoji = "\U00002600"
     ),
     judgement = list(
          number = 20L,
          number = 20L,
          name = "Judgement",
          upright = c("judgement", "rebirth", "inner calling", "absolution"),
          reversed = c("self-doubt", "inner critic", "ignoring the call"),
          upright = c("judgement", "rebirth", "inner calling", "absolution"),
          reversed = c("self-doubt", "inner critic", "ignoring the call"),
          emoji = "\U0001F4EF"
     ),
     the_world = list(
          number = 21L,
          number = 21L,
          name = "The World",
          upright = c("completion", "integration", "accomplishment", "travel"),
          reversed = c("personal closure", "incomplete", "stagnation"),
          upright = c("completion", "integration", "accomplishment", "travel"),
          reversed = c("personal closure", "incomplete", "stagnation"),
          emoji = "\U0001F30E"
     )
)

# Crate arcana as a dataframe
# Crate arcana as a dataframe
major_arcana_data <- major_arcana_list |>
     purrr::map(
          ~ tibble::tibble(
               number = .x$number,
               number = .x$number,
               name = .x$name,
               upright_keywords = list(.x$upright),
               reversed_keywords = list(.x$reversed),
               upright_keywords = list(.x$upright),
               reversed_keywords = list(.x$reversed),
               emoji = .x$emoji
          )
     ) |>
     purrr::list_rbind()

# Create arcana as S7 class objects
create_major_arcana_objects <- function() {
     major_arcana <- purrr::map(major_arcana_list, function(card) {
          arcana(
               name = card$name,
               number = card$number,
               emoji = card$emoji,
               keywords = list(
                    upright = card$upright,
                    reversed = card$reversed
               )
          )
     })

     names(major_arcana) <- names(major_arcana_list)

     return(major_arcana)
}

.major_arcana_objects <- create_major_arcana_objects()
class(.major_arcana_objects)
usethis::use_data(
     major_arcana_list,
     major_arcana_data,
     .major_arcana_objects,
     overwrite = TRUE
)
