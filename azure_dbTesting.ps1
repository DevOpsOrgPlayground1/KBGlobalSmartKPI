$User = $args[0]
$PW = $args[1]
$server = $args[2]
$DB = $args[3]
$File = $args[4]

echo '********************************************************'
echo 'User:'
echo $User
echo 'Server:'
echo $server
echo 'DB:'
echo $DB
echo '********************************************************'

echo 'start'
sqlcmd -S $server -U $User -P $PW -d $DB -Q "select getdate()"
sqlcmd -S $server -U $User -P $PW -d $DB -i $File
sqlcmd -S $server -U $User -P $PW -d $DB -Q "select getdate()"
echo 'end'
echo '********************************************************'
