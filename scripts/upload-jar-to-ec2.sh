# Brisanje kompajliranih fajlova i "pakovanje" Spring aplikacije u jar executable
# Pozicionirati se u folder gde se nalazi pom.xml i pozvati sledecu komandu
# (moguce i kroz IDE)
mvn clean package

KLJUC_FAJl="$1"
JAVNA_IPv4="$2"

chmod 400 $KLJUC_FAJl

# Kopiranje jar fajla u EC2 instancu
scp -i "$KLJUC_FAJl" ./target/docker-film-server-0.1.jar "ec2-user@${JAVNA_IPv4}:/home/ec2-user"

# Povezivanje na EC2 instancu
ssh -i "$KLJUC_FAJl" "ec2-user@$JAVNA_IPv4"

