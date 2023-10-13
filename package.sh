#!/bin/bash

# Aller dans le répertoire contenant vos charts
cd charts

# Boucle pour empaqueter chaque chart
for dir in */ ; do
    chart_name=${dir%/}  # Enlever le slash final
    echo "Empaquetage du chart $chart_name ..."
    
    # Empaqueter le chart
    helm package $chart_name
done

# Créer ou mettre à jour le fichier index.yaml
echo "Génération du fichier index.yaml ..."
helm repo index . --url https://github.com/cloud-pi-native/helm-charts/charts

echo "Terminé."

