LoremIpsum <- function(length) {
  # Create a vector of Lorem Ipsum words
  words <- c("Lorem", "ipsum", "dolor", "sit", "amet,", "consectetur", "adipiscing", "elit,", "sed", "do", "eiusmod", "tempor", "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua.")
  
  # Create an empty vector to store the output
  output <- c()
  
  # Loop through the vector of words and add them to the output vector
  for (i in 1:length) {
    output <- c(output, words[i])
  }
  
  # Return the output vector
  return(output)
}
LoremIpsum(99)

LoremIpsum2 <- function(length) {
  # Create a vector of Lorem Ipsum words
  words <- c("Lorem", "ipsum", "dolor", "sit", "amet,", "consectetur", 
             "adipiscing", "elit,", "sed", "do", "eiusmod", "tempor", 
             "incididunt", "ut", "labore", "et", "dolore", "magna", "aliqua.")
  
  # Return the words in single string
  paste(words[1:min(length, length(words))], collapse = " ")
}
LoremIpsum2(99)


LoremIpsum3 <- function(nchar=100) {
  # Create a vector of Lorem Ipsum words
  lipsum <- "Lorem ipsum dolor sit amet. Est porro corrupti rem consequatur nemo ea reprehenderit corrupti aut esse quibusdam. Est corporis voluptates qui unde expedita id provident dolores id animi praesentium et eaque modi.
Sed architecto accusantium est rerum error ab reiciendis quos nam magni magni ea error doloribus. In galisum omnis aut minima inventore id dolorem omnis ut ipsam minus qui dicta incidunt quo sunt quas. Qui autem eius ut magnam exercitationem ut voluptatem dolor. Sed omnis minus At minus quisquam est quidem officiis et rerum itaque eos consequatur numquam.
Et iure galisum aut omnis architecto qui fuga incidunt qui ducimus veniam in omnis molestias est maxime beatae. Ut quibusdam fugit et quod deserunt qui laborum veritatis. Id dolor incidunt et repudiandae voluptas id culpa numquam cum nobis fugiat."
  
  # Return the words in single string
  substr(lipsum, 1, nchar)
}
LoremIpsum3(99)


LoremIpsum4 <- function(
    nwords = 50 ## 1 paragraph
) {
  # A string of 20 paragraphs of lorem ipsum
  lipsum <- "Lorem ipsum dolor sit amet. Ad velit natus rem similique quibusdam qui dolorem atque qui assumenda eaque. Qui dolorum inventore a eveniet dolorem aut quia quia cum voluptas quisquam et dolor consequuntur et voluptate cumque. Ab deleniti sunt est doloribus dolorem et dolore fugit est quae dolores.

Sit error iste qui perferendis quisquam et blanditiis mollitia! Sit voluptas repudiandae qui dolorem voluptatem qui nemo inventore.

Ut cumque nulla eum nulla cumque et animi quia. Ea sunt distinctio aut iste facilis hic reprehenderit voluptatem vel architecto debitis At fugit reiciendis eum praesentium suscipit.

Aut perferendis voluptate eum sint officia est officiis Quis sit voluptatum tenetur non consequatur distinctio est omnis adipisci ab molestiae dolorem. Et accusantium voluptatibus non nobis culpa qui corrupti rerum eos consequatur ipsa qui nesciunt culpa. Ut possimus minima aut fugiat explicabo est consectetur sint eos voluptas quae aut autem porro sed deserunt sint et omnis aliquam.

Et eaque alias et sunt libero qui quia maxime. Eum quod odit et possimus accusamus et debitis exercitationem ab optio debitis 33 aliquid cupiditate. Eos deleniti quibusdam et quibusdam illum est dignissimos blanditiis aut laudantium quasi.

Ut incidunt autem et itaque quidem et vitae libero et incidunt iusto. Ut eius velit ut dolorem consequatur ut nulla totam ut ullam accusamus ex tempora tempore. Eos quaerat atque et nihil repellendus in aliquid voluptatum.

Ut provident quia qui vero alias et nisi ipsam. Et magni quisquam non voluptas internos et dolor pariatur.

Hic placeat consequatur hic perspiciatis consequatur qui ullam galisum et quia molestiae ut enim rerum et provident repellendus. Et officia sapiente est praesentium accusamus et culpa eaque non aperiam voluptas et exercitationem voluptatem? Eum porro inventore sit natus animi ad aspernatur libero. At dolores quibusdam aut pariatur dolorem et perferendis deleniti et nemo necessitatibus qui internos repudiandae est debitis doloremque?

Est modi impedit in consequatur sunt sit minima eligendi ea reiciendis fugiat quo modi nihil non quia iste? Aut praesentium exercitationem quo itaque ipsam qui asperiores vero aut omnis vero. Et voluptatibus dolorum aut molestiae pariatur qui consequuntur assumenda in nostrum repellendus et rerum corporis. Ut tempore veritatis ut vitae dolor non totam debitis est sint maiores et laboriosam facilis ea sint tempore.

Qui provident delectus et voluptatem natus qui fuga aliquam est dignissimos voluptatibus eos eligendi possimus? Aut corrupti quae ex repellendus tempora non odit blanditiis sit possimus eligendi qui dignissimos mollitia qui blanditiis fuga.

Quo voluptas voluptatem non dolorem assumenda a minus debitis ea delectus accusamus aut voluptas quibusdam At dolorem voluptatem. Et harum nihil ea libero vero cum quam consectetur et natus tempora qui sint voluptatem. Vel recusandae dolores rem deserunt optio ut soluta enim sed nemo similique.

Ut voluptas ipsam et tenetur praesentium qui odit dolorem et ullam doloribus sed magni repellat. Qui doloremque nihil ut omnis iusto sit neque labore At nostrum praesentium sit distinctio fugiat sed mollitia fuga At repellat minus. Eum voluptatum voluptatibus sed tempora aspernatur qui voluptas dolores qui laboriosam omnis ut exercitationem mollitia quo sunt fuga est sint voluptas.

Qui sapiente dolore ut sunt natus sed quidem consequuntur ex dolores asperiores ut laudantium distinctio et temporibus excepturi et optio magnam. Et enim beatae aut nesciunt assumenda aut tempora libero ex tenetur galisum est soluta voluptatibus qui dolor numquam ut dolores voluptas. Et praesentium omnis eos modi veritatis ab alias reprehenderit ab obcaecati atque! Est nihil nemo ut accusantium quia At impedit voluptatibus eos quod consequatur sed temporibus consequatur!

Eum ipsum dolores ut necessitatibus adipisci cum molestiae nulla ut officiis temporibus. Sit perspiciatis doloremque sed perferendis amet eos minima voluptate in quia ducimus ut cupiditate consequatur. Qui repudiandae nulla et harum alias aut enim eius ut eligendi vero et quas excepturi eos impedit voluptatibus et veritatis dolore!

Sit Quis ullam aut minus quia in tempora aliquam in dignissimos deserunt ut dignissimos alias ut suscipit error! Eos exercitationem molestiae ut error harum non Quis eveniet. At rerum libero et illum quia ex rerum molestias. Cum officia asperiores ut numquam sunt non similique corrupti et vero esse in nobis veritatis id corporis sapiente!

Est Quis magnam est totam tempora aut nisi necessitatibus aut perferendis dolore vel sunt enim ad necessitatibus iure. In maiores omnis ut debitis rerum et enim eius hic incidunt cupiditate et delectus autem et quaerat quidem et rerum totam. Sed commodi molestiae eum consequuntur accusantium eos magni molestiae eos quam obcaecati! Qui nisi iure est voluptatem accusamus non voluptatibus neque non perferendis quas ut consequatur voluptatum ut deleniti enim id molestias eveniet?

Et veniam nostrum qui explicabo eaque quo laborum quia id voluptas velit. Est rerum accusantium rem beatae porro qui maiores galisum ea quam magni eos eligendi commodi est pariatur quasi sit dolore optio.

Et quasi molestiae eos minima omnis aut temporibus maxime qui quam vitae ut similique ipsam! Quo doloremque aliquid ut dolorem magni non libero tempora ea eveniet asperiores. Quo consequatur deserunt ut repellat deleniti cum tenetur repellat id veniam amet ut corporis rerum eum voluptas natus! Nam voluptas neque hic facilis inventore qui culpa placeat est velit illo et quos animi?

Qui voluptas ipsam ab optio autem vel totam galisum est velit iusto ab tempora perferendis. Eos delectus voluptas in magnam dolores sed vero quasi est enim error.

Nam corrupti veritatis est maiores deserunt et asperiores dolores est inventore reprehenderit aut nesciunt alias sit iusto perferendis qui quam provident. Et ipsam omnis id perspiciatis distinctio et consectetur consequatur ut quia consequuntur qui laboriosam quod qui cumque rerum. Et culpa maiores et quia dolores sed voluptatibus exercitationem quo quos quae At quisquam velit? Qui porro sapiente ut doloribus quam aut numquam officiis."
  # A vector of spaces in the string
  spaces <- unlist(gregexpr(' ', lipsum))
  
  # Return the cat() of a single string of words
  cat(substr(lipsum, 1, spaces[min(nwords - 1, length(spaces))]))
}
LoremIpsum4(999)



microbenchmark::microbenchmark(
  times = 1000,
  list = list(
    ai = LoremIpsum(19),
    ns1 = LoremIpsum2(19),
    ns2 = LoremIpsum3(99),
    ns3 = LoremIpsum4(999)
  )
)
