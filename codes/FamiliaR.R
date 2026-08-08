# Install useful packages
install.packages("pacman") 
pacman::p_load(tidyverse,
               patchwork)

# Add packages to environment
library(ggplot2)
library(dplyr)
library(patchwork)
data() # see the built in datasets
data(mpg) ; mpg # add dataset to environment

# Assign object
df <- mpg

# Print object
df
print(df)
print(df, n = 20)
print(mpg)

# First plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))


# Second plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


# Third plot  
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Fourth plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Bad plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Set specific aesthetic
ggplot(data = mpg) +
  geom_point(
    mapping = aes(
      x = displ, 
      y = hwy
    ), 
    color = "blue"
  )

# OMG Error works
ggplot(data = mpg) +
  geom_point(
    mapping = aes(
      x = displ, 
      y = hwy, 
      color = "blue"
    )
  )

# Error! Help!
ggplot(data = mpg)
+ geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)+ 
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl), color = "maroon")

# Next line, next layer, next variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(facet = ~ class, nrow = 3)

# MORE variable in my plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(cyl ~ drv)


# Object can be anything__just assign it!
point <- ggplot(data = mpg)+ 
  geom_point(mapping = aes(x = displ, y = hwy))

line <- ggplot(data = mpg)+ 
  geom_smooth(mapping = aes(x = displ, y = hwy))


# Wanna see your object? Print it!
print(point)
print(line)

# Object can be used as you wish!
point + line #package: patchwork package is required


# Magic of ggplot2
ggplot(data = mpg)+ 
  geom_point(mapping = aes(x = displ, y = hwy))+ 
  geom_smooth(mapping = aes(x = displ, y = hwy), method = "loess")+
  labs(x = "Engine size", y = "Miles per gallon for highway")+
  theme_classic()

ggplot(data = mpg,
       mapping = aes(x = displ, y = hwy))+ 
  geom_point()+ 
  geom_smooth()


# Watch out! Functions and arguments could be unmatched like you and your crush!
ggplot(data = mpg,
       mapping = aes(x = displ, y = hwy, colour = drv))+ 
  geom_point()+ 
  geom_smooth()

ggplot(data = mpg,
       mapping = aes(x = displ, y = hwy, colour = drv, linetype = drv))+ 
  geom_point()+ 
  geom_smooth()

ggplot(data = mpg)+ 
  geom_point(mapping = aes(x = displ, y = hwy, linetype = drv))+ 
  geom_smooth(mapping = aes(x = displ, y = hwy, colour = drv))

ggplot(data = mpg)+ 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))+ 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv))

# New year, new boyfriend! Oops sorry! New layer new data
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(
    #data = filter(mpg, class == "subcompact"),
    se = FALSE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )

# Diamonds are forever

## There are default values for some arguments
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut), stat = "count")
# the same is
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut)) # stat = "count" is default for geom_bar()

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut), geom = "bar")
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut)) # geom = "bar" is default for stat_count

## Sometimes you need to get out of comfort zone and change the value of argument
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = mean(price)), stat = "identity")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))

## Functions can be given as values to some arguments
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

# Position
ggplot(
  data = diamonds,
  mapping = aes(x = cut, fill = clarity)
) +
  geom_bar(alpha = 1/5, position = "identity")


ggplot(
  data = diamonds,
  mapping = aes(x = cut, color = clarity)
) +
  geom_bar(fill = NA, position = "identity")

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )

# Coordinate system
bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)
bar + coord_flip()


# Summary

# install.packages("package name")
# library(package name)

# ggplot(data = <DATA>) +
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>,
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>
#   
# function_name(arg1 = val1, arg2 = 2, arg3 = FALSE, arg4 = "a",...)  

x <- 3 * 4
# object_name <- value
this_is_a_really_long_name <- 2.5
this_is_a_really_long_name
# i_use_snake_case
# otherPeopleUseCamelCase
# some.people.use.periods
# And_aFew.People_RENOUNCEconvention