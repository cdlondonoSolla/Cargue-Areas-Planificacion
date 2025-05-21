**Instructivo para cargue Areas Planificación de granjas en SAP**

Este proceso permite registrar automáticamente las áreas de planificación en SAP, una vez que los materiales ya han sido cargados. A continuación, te explicamos cómo hacerlo correctamente.

1. Verifica que los materiales ya estén cargados en SAP
   Antes de comenzar, asegúrate de que los materiales correspondientes ya se encuentren registrados en SAP. Este paso es indispensable para que el proceso funcione correctamente.

2. Prepara el archivo de cargue
   2.1. Abre el archivo de plantilla llamado "Plantilla Áreas de Planificación.xlsx".
   2.2.Llena la información requerida en cada fila, según corresponda.
   2.3.En la columna J, escribe la palabra "Pendiente" para cada fila que deseas que el sistema procese.
   (Si esta palabra no está presente, el programa saltará esa fila y no la cargará.)

3. Ejecuta el script de carga
   3.1. Abre SAP.
   3.2.Ejecuta el archivo llamado "Cargue_Planif.vbs".
   Este script se encargará de cargar automáticamente las áreas de planificación en SAP usando la información de la plantilla.

4. Revisa los resultados
   - El script actualizará la columna J con el mensaje que SAP devuelve para cada fila.
   - Si el proceso fue exitoso, verás un mensaje como este: "Área planificación necesidades XXXXXX creada con datos"
   - Si aparece un mensaje diferente, significa que hubo un error en esa línea. Revisa el mensaje para identificar el problema.

**Información adicional**

   Es común que los usuarios incluyan áreas de planificación que ya existen en SAP.
   En esos casos, el sistema mostrará un mensaje indicando que el área de planificación ya fue asignada.
   Esto no es un error crítico, simplemente significa que esa área ya estaba registrada.

**Archivos necesarios**
   - Plantilla de datos: "Plantilla Areas de Planificacion.xlsx"
   - Script que ejecuta el cambio: "Cargue_Planif.vbs"
