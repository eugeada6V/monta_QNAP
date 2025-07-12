#!/bin/bash

# Nome dello script: Monta cartella QNAP
# Percorso remoto e locale
REMOTE_PATH="eugenio@192.168.1.101:"
LOCAL_PATH="/home/eugenio/QNAP"

# Colori
GREEN='\033[1;32m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # Reset colore

# Funzione per montare la cartella
monta_cartella() {
    echo -e "${CYAN}Montando la cartella QNAP...${NC}"
    if sshfs "$REMOTE_PATH" "$LOCAL_PATH"; then
        echo -e "${GREEN}Cartella montata con successo su $LOCAL_PATH.${NC}"
    else
        echo -e "${WHITE}Errore durante il montaggio della cartella.${NC}"
    fi
}

# Funzione per smontare la cartella
smonta_cartella() {
    echo -e "${CYAN}Smontando la cartella QNAP...${NC}"
    if fusermount -u "$LOCAL_PATH"; then
        echo -e "${GREEN}Cartella smontata con successo.${NC}"
    else
        echo -e "${WHITE}Errore durante lo smontaggio della cartella.${NC}"
    fi
}

# Menu per l'utente
while true; do
    echo ""
    echo -e "${GREEN}Seleziona un'opzione:${NC}"
    echo -e "${WHITE}1) Monta la cartella QNAP${NC}"
    echo -e "${WHITE}2) Smonta la cartella QNAP${NC}"
    echo -e "${WHITE}3) Esci${NC}"
    read -p "$(echo -e "${CYAN}Inserisci la tua scelta (1/2/3): ${NC}")" scelta

    case $scelta in
        1)
            monta_cartella
            ;;
        2)
            smonta_cartella
            ;;
        3)
            echo -e "${GREEN}Uscita dallo script. Arrivederci!${NC}"
            exit 0
            ;;
        *)
            echo -e "${WHITE}Scelta non valida. Riprova.${NC}"
            ;;
    esac
done

