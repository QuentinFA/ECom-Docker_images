service mysql restart

# If a file db.sql exists, use it to initialize the database
[ -f /mnt/db.sql ] && echo "Initialisation file detected" && mysql -uroot -proot < /mnt/db.sql

mysql -uroot -proot
