# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aielo <aielo@student.42berlin.de>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/09 13:19:32 by aielo             #+#    #+#              #
#    Updated: 2026/04/21 14:43:17 by aielo            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 		= libft_extended.a

# Directories
LIBFT_DIR 		= libft
PRINTF_DIR		= ft_printf
PRINTF_SRCS 	= $(PRINTF_DIR)/srcs
PRINTF_UTILS 	= $(PRINTF_DIR)/utils
INCLUDES_DIR	= includes
OBJ_DIR 		= obj

# Sources
LIBFT 		= $(LIBFT_DIR)/ft_atoi_long.c \
				$(LIBFT_DIR)/ft_atoi.c \
				$(LIBFT_DIR)/ft_bzero.c \
				$(LIBFT_DIR)/ft_calloc.c \
				$(LIBFT_DIR)/ft_isalnum.c \
				$(LIBFT_DIR)/ft_isalpha.c \
				$(LIBFT_DIR)/ft_isascii.c \
				$(LIBFT_DIR)/ft_isdigit.c \
				$(LIBFT_DIR)/ft_isprint.c \
				$(LIBFT_DIR)/ft_itoa.c \
				$(LIBFT_DIR)/ft_lstadd_back.c \
				$(LIBFT_DIR)/ft_lstadd_front.c \
				$(LIBFT_DIR)/ft_lstclear.c \
				$(LIBFT_DIR)/ft_lstdelone.c \
				$(LIBFT_DIR)/ft_lstiter.c \
				$(LIBFT_DIR)/ft_lstlast.c \
				$(LIBFT_DIR)/ft_lstmap.c \
				$(LIBFT_DIR)/ft_lstnew.c \
				$(LIBFT_DIR)/ft_lstsize.c \
				$(LIBFT_DIR)/ft_memchr.c \
				$(LIBFT_DIR)/ft_memcmp.c \
				$(LIBFT_DIR)/ft_memcpy.c \
				$(LIBFT_DIR)/ft_memmove.c \
				$(LIBFT_DIR)/ft_memset.c \
				$(LIBFT_DIR)/ft_putchar_fd.c \
				$(LIBFT_DIR)/ft_putendl_fd.c \
				$(LIBFT_DIR)/ft_putnbr_fd.c \
				$(LIBFT_DIR)/ft_putstr_fd.c \
				$(LIBFT_DIR)/ft_split.c \
				$(LIBFT_DIR)/ft_strchr.c \
				$(LIBFT_DIR)/ft_strcmp.c \
				$(LIBFT_DIR)/ft_strdup.c \
				$(LIBFT_DIR)/ft_striteri.c \
				$(LIBFT_DIR)/ft_strjoin.c \
				$(LIBFT_DIR)/ft_strlcat.c \
				$(LIBFT_DIR)/ft_strlcpy.c \
				$(LIBFT_DIR)/ft_strlen.c \
				$(LIBFT_DIR)/ft_strmapi.c \
				$(LIBFT_DIR)/ft_strncmp.c \
				$(LIBFT_DIR)/ft_strnstr.c \
				$(LIBFT_DIR)/ft_strrchr.c \
				$(LIBFT_DIR)/ft_strtrim.c \
				$(LIBFT_DIR)/ft_substr.c \
				$(LIBFT_DIR)/ft_tolower.c \
				$(LIBFT_DIR)/ft_toupper.c \
				$(LIBFT_DIR)/get_next_line_delimiter.c \
				$(LIBFT_DIR)/get_next_line.c 

PRINTF		= $(PRINTF_DIR)/ft_printf.c \
				$(PRINTF_SRCS)/ft_printf_c.c \
				$(PRINTF_SRCS)/ft_printf_di.c \
				$(PRINTF_SRCS)/ft_printf_s.c \
				$(PRINTF_SRCS)/ft_printf_u.c \
				$(PRINTF_SRCS)/ft_printf_x.c \
				$(PRINTF_SRCS)/ft_printf_p.c \
				$(PRINTF_SRCS)/ft_printf_per.c \
				$(PRINTF_SRCS)/ft_flags.c \
				$(PRINTF_SRCS)/ft_flag_width.c \
				$(PRINTF_SRCS)/ft_flag_precision.c \
				$(PRINTF_UTILS)/ft_itoa_unsign.c \
				$(PRINTF_UTILS)/ft_itoa_u.c \
				$(PRINTF_UTILS)/ft_itoa_x.c \
				$(PRINTF_UTILS)/ft_itoa_p.c \
				$(PRINTF_UTILS)/ft_putchar_fd.c \
				$(PRINTF_UTILS)/ft_putstr_fd.c \
				$(PRINTF_UTILS)/ft_strlen.c \
				$(PRINTF_UTILS)/ft_substr.c \
				$(PRINTF_UTILS)/ft_isdigit.c \
				$(PRINTF_UTILS)/ft_atoi.c

SOURCES 	= $(LIBFT) \
				$(PRINTF)

# Objects
OBJECTS 	= $(SOURCES:%.c=$(OBJ_DIR)/%.o)

# Compiler
CC 			= cc
CFLAGS 		= -Wall -Wextra -Werror
CEXTRA_INC 	= -I$(INCLUDES_DIR)

# Dependency
DEPENDS 	= $(OBJECTS:.o=.d)

# Rules
all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(NAME): $(OBJECTS)
	ar rcs $@ $^

$(OBJ_DIR)/%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CEXTRA_INC) -MMD -MP -c $< -o $@

-include $(DEPENDS)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

# Validate the library
validate: re
	./check_libft.sh

.PHONY: all clean fclean re validate
