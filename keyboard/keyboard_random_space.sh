#!/usr/bin/fish

# 1. Генерируем случайное значение от 00 до ff для промежуточного канала
# shuf выдаст число в десятичной системе (0-255), а math переведет в шестнадцатеричную (hex)
set rand_hex (printf "%02x" (shuf -i 0-255 -n 1))

# 2. Создаем 6 шаблонов супер-ярких цветов, где:
# один канал строго 'ff' (максимум), один '00' (минимум для сочности), а один случайный.
set templates \
    "ff""00""$rand_hex" \
    "ff""$rand_hex""00" \
    "00""ff""$rand_hex" \
    "$rand_hex""ff""00" \
    "00""$rand_hex""ff" \
    "$rand_hex""00""ff"

# 3. Случайно выбираем один из этих шести шаблонов
set final_color (shuf -n 1 -e $templates)

echo "all steady 000000" >> keyboard
echo "65 steady $final_color" >> keyboard

# 4. Применяем цвет к клавиатуре
msi-perkeyrgb -m GS65 -c keyboard
rm -rf keyboard

# Выводим красивый лог в терминал
echo "#$final_color"
