subproceso pausa()
	Escribir "";
	Escribir "";
	Escribir "**** presione enter****";
	esperar tecla;
FinSubProceso

SubProceso MostrarDisponibles ( asiento )
    Escribir "**************************";
	Escribir "         ESCENARIO        ";
	Escribir "**************************";
    Escribir "   Asientos Disponibles";
    Escribir "**************************";
	
    Definir c Como Entero;
    Para c<-0 Hasta 99 Con Paso 1 Hacer
        Escribir Sin Saltar asiento[c], " - ";
    FinPara
    Escribir "";
FinSubProceso

SubProceso venderEntradas ( asiento,rut,num_asiento )
    Definir cant_entradas,i Como Entero;
	Definir n como caracter;
	Definir asientoVacio Como Logico;
	Escribir '';
	Escribir 'Los precios de las entradas son los siguientes:';
	Escribir '';
	Escribir 'Platinum, Desde la entrada 1 a la 20 el precio es $120.000 pesos';
	Escribir 'Gold, Desde la entrada 21 a la 50 el precio es $80.000 pesos';
	Escribir 'Silver, desde la 51 a la 100 el valor es $50.000 pesos';
	Escribir '';
	Escribir "Cuantas entradas desea comprar?";
	Leer cant_entradas;
	
    
    Para i<-0 Hasta cant_entradas-1 Con Paso 1 Hacer
        asientoVacio = falso;
	Repetir
		Escribir 'Ingrese su rut: ';
		Leer rut[i];
	Hasta Que rut[i]>=3000000 && rut[i]<=300000000
		
        Repetir
            Escribir "ingrese el numero de asiento";
            leer num_asiento[i];
			
            Si asiento[num_asiento[i]-1] == "X" Entonces
                Escribir "Este asiento se encuentra ocupado, intente nuevamente";
            SiNo
                asientoVacio = Verdadero;
                asiento[num_asiento[i]-1] = "X";
                Escribir "Asiento ", num_asiento[i], " asignado exitosamente.";
            FinSi
        Hasta Que asientoVacio = Verdadero
		
		
    FinPara

FinSubProceso

SubProceso listadoasistentes (rut)
    Definir cant_entradas,i,j,temp,min Como Entero;
    definir num_asiento,c Como Entero;
	Definir asientoVacio Como Logico;
    
	Escribir 'Rut que han realizado compra';
    
	Para i<-0 Hasta 99 Con Paso 1 Hacer
		min=i;
        Para j<-i+1 hasta 99 con paso 1 hacer 
			
			si rut[min]>rut[j] entonces
			   min=j;
			FinSi
		FinPara
		temp=rut[min];
		rut[min]=rut[i];
		rut[i]=temp;
    FinPara
	Escribir 'El menor a mayore es:';
	Para i<-0 hasta 99 hacer 
		Escribir 'rut ',i,': ',rut[i];
	FinPara
	
FinSubProceso

Subproceso buscarnumero(asiento,rut,num_asiento)
	definir i,num,contador como entero;
	Repetir
		Escribir 'Ingrese el rut de Busqueda: ';
		Leer num;
	Hasta Que num > 0 
	
	contador <- 0;
	Para i<-0 hasta 99 hacer 
		Si rut[i]=num Entonces
			contador <- contador + 1;
		FinSi
	FinPara
	Si contador > 0 Entonces
		Escribir 'Numero = ', num, ' aparece: ', contador, ' veces';
	SiNo
		Escribir 'El rut ingresado no ha comprado...';
	FinSi
FinSubProceso

SubProceso Reasignar(rut,asiento,num_asiento)
	definir i,num,contador como entero;
	Repetir
		Escribir 'Ingrese el numero de asiento de Busqueda: ';
		Leer num;
	Hasta Que num > 0 
	
	contador <- 0;
	Para i<-0 hasta 99 hacer 
		Si num_asiento[i]=num Entonces
			contador <- contador + 1;
		FinSi
	FinPara
	
	Si contador > 0 Entonces
		Escribir 'Numero = ', num, ' aparece: ', contador, ' veces, se encuentra ocupado';
		Escribir 'Escriba el nuevo numero de asiento';
		Leer num;
	SiNo
		Escribir 'El asiento ingresado no ha sido comprado...';
	FinSi
	Para i<-0 hasta 99 hacer 
		si num=num_asiento[i]Entonces
			
		FinSi
	FinPara
FinSubProceso

SubProceso mostrargananciastotal(asiento,rut,num_asiento)
	Definir i,cantidadpl,cantidadgo,cantidads,totalpl,totalgo,totals,finaltotal,finalcantidad Como Entero;
	cantidadpl<-0;
	cantidadgo<-0;
	cantidads<-0;
	totalpl<-0;
	totalgo<-0;
	totals<-0;
	Para i=0 hasta 99 hacer
	si num_asiento[i]>=1 && num_asiento[i]<=20 Entonces
		
		cantidadpl<-cantidadpl+1;
		totalpl<-totalpl+120000*cantidadpl;
	FinSi
	
	si num_asiento[i]>=21 && num_asiento[i]<=50 Entonces
		
		cantidadgo<-cantidadgo+1;
		totalgo<-totalgo+80000*cantidadgo;
	FinSi
	si num_asiento[i]>=51 && num_asiento[i]<=100 Entonces
		
		cantidads<-cantidads+1;
		totals<-totals+50000*cantidads;
	FinSi

	FinPara
	finalcantidad<-cantidadpl+cantidadgo+cantidads;
	finaltotal<-totalpl+totalgo+totals;
	
	Escribir 'Tipo de entrada              ';
	Escribir 'Entrada platinium $120.000' ,' cantidad: ',cantidadpl     ,' total $: ',totalpl;
	Escribir 'Entrada gold $80.000'       ,' cantidad: ',cantidadgo     ,' total $: ',totalgo;
	Escribir 'Entrada silver $50.000'     ,' cantidad: ',cantidads      ,' total $: ',totals;
	Escribir 'Total'                      ,' cantidad final: ',finalcantidad  ,' total $: ',finaltotal;
	
FinSubProceso

Proceso sin_titulo
    /// Hay que vender 100 entradas para un evento
    /// Los numeros de asiento no se pueden repetir
    /// Se deben mostrar los asientos disponibles
	
    definir asiento Como Caracter;
	definir op como entero;
    Dimension asiento[100],rut[100],num_asiento[100];
    definir c Como Entero;
	
    Para c<-0 Hasta 99 Con Paso 1 Hacer
        asiento[c] = ConvertirATexto(c+1);
    FinPara
	
    
	Repetir
		Limpiar Pantalla;
		Escribir '*****************Productora Punto Master*****************';
		Escribir '---venta de entradas al concierto VIP de [Lucho Marte]---';
		Escribir '*********************************************************';
		Escribir '1.Comprar entradas';
		Escribir '2.Mostrar ubicaciones disponibles';
		Escribir '3.Ver listado de asistentes';
		Escribir '4.Buscar asistente';
		Escribir '5.Reasignar asiento:';
		Escribir '6.Mostrar ganancias totales';
		Escribir '7.Salir';
		Escribir '';
		Escribir 'elige opcion (1-3)';
		Leer op;
		si (op==1) entonces
			venderEntradas(asiento,rut,num_asiento);
			pausa();
		FinSi
		si (op==2) entonces
			MostrarDisponibles(asiento);
			pausa();
		FinSi
		si (op==3) entonces
			listadoasistentes(rut);
			pausa();
		FinSi
		si (op==4) entonces
			buscarnumero(asiento,rut,num_asiento);
			pausa();
		FinSi
		si (op==5) entonces
			Reasignar(rut,asiento,num_asiento);
			pausa();
		FinSi
		si (op==6) entonces
			mostrargananciastotal(asiento,rut,num_asiento);
			pausa();
		FinSi
		si (op==7) entonces
			Escribir '';
			Escribir '***gracias por comprar boletos***';
			Escribir '';
			Escribir '**********vuelva pronto**********';
		FinSi
	Hasta Que op==7
        
FinProceso
