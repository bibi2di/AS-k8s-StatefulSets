#!/bin/bash
#
#

echo "*********************"
echo " * * Bienvenide * *  "
echo "*********************"

echo "Selecciona una opción"
echo "1) Desplegar como Deployment"
echo "2) Desplegar como StatefulSet"
echo "3) Finalizar Deployment"
echo "4) Finalizar StatefulSet"
echo "5) Salir"
read -p "Opción: " OPTION

case $OPTION in
	1) 
		echo "Deployment..."
		kubectl apply -f "postgres-pvc.yaml"
		kubectl apply -f "postgres-deployment.yaml"
		kubectl apply -f "postgres-service.yaml"
		echo "Despliegue completado. Ejecuta kubectl get pods para verificar. Muchas gracias, agur!"
		;;
	2)
		echo "StatefulSet..."
		kubectl apply -f "postgres-statefulset.yaml"
		kubectl apply -f "postgres-service.yaml"
		echo "Despliegue completado. Ejecuta kubectl get pods para verificar. Muchas gracias, agur!"
		;;
	3)
		echo "Eliminando Deployment..."
		kubectl delete -f "postgres-service.yaml"
		kubectl delete -f "postgres-deployment.yaml"
		kubectl delete -f "postgres-pvc.yaml"
		echo "Eliminado!"
		;;

	4)	echo "Eliminando StatefulSet..."
		kubectl delete -f "postgres-service.yaml"
		kubectl delete -f "postgres-statefulset.yaml"
		echo "Eliminado!"
		;;
	5) 	echo "saliendo..."
		exit 0
		;;
	*)	echo "Opcion no válida"
		exit 1
		;;
esac

