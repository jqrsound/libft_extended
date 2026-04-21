# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_libft.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aielo <aielo@student.42berlin.de>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/15 19:53:27 by aielo             #+#    #+#              #
#    Updated: 2026/04/21 14:42:58 by aielo            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

LIB=libft_extended.a
FUNC_LIST=libft_extended_functions.txt

FOUND=0
NOT_FOUND=0

echo "Checking functions in $LIB..."
echo

while read -r FUNC || [ -n "$FUNC" ]; do
    if nm -g --defined-only "$LIB" | awk '{print $3}' | grep -xq "$FUNC"; then
        echo "✅  $FUNC found"
        FOUND=$((FOUND + 1))
    else
        echo "❌  $FUNC NOT found"
        NOT_FOUND=$((NOT_FOUND + 1))
    fi
done < "$FUNC_LIST"

echo
echo "Summary:"
echo "---------"
echo "Functions found:     $FOUND"
echo "Functions NOT found: $NOT_FOUND"
echo "Total checked:       $((FOUND + NOT_FOUND))"


