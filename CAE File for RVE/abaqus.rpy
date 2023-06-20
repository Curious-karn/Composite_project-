# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2022 replay file
# Internal Version: 2021_09_15-23.27.30 176069
# Run by Karan Tiwari on Thu Apr 20 03:42:08 2023
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=202.723281860352, 
    height=124.281242370605)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
openMdb('Karanproject-2017.cae')
#: A new model database has been created.
#: The model "Model-1" has been created.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
#* MdbError: incompatible release number, expected 2022, got 2017
upgradeMdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/Karanproject-2017-2017.cae", 
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/Karanproject-2017.cae", 
    )
#: The model database "D:\Mtech\Composits\Project\Project_report_code_22101028\CAE File for RVE\Karanproject-2017_TEMP.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
#: The model database has been saved to "D:\Mtech\Composits\Project\Project_report_code_22101028\CAE File for RVE\Karanproject-2017.cae".
#: The model database "D:\Mtech\Composits\Project\Project_report_code_22101028\CAE File for RVE\Karanproject-2017-2017.cae" has been converted.
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
p = mdb.models['Model-1'].parts['Part-1']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    optimizationTasks=OFF, geometricRestrictions=OFF, stopConditions=OFF)
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXX.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXX.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXX1681942454.938.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXX1681942454.938.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXX1681942454.938.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=34.6181, 
    farPlane=75.2683, width=44.3554, height=18.385, viewOffsetX=-0.135119, 
    viewOffsetY=-0.142668)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FXX1681942454.938.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXY.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXY.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXY1681942835.961.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXY1681942835.961.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXY1681942835.961.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].view.setValues(session.views['Back'])
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FXY1681942835.961.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYY.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYY.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FYY1681942873.162.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FYY1681942873.162.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FYY1681942873.162.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Max. Principal'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].animationController.setValues(
    animationType=TIME_HISTORY)
session.viewports['Viewport: 1'].animationController.play(duration=UNLIMITED)
session.viewports['Viewport: 1'].animationController.setValues(
    animationType=NONE)
p = mdb.models['Model-1'].parts['Part-1']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].enableMultipleColors()
session.viewports['Viewport: 1'].setColor(initialColor='#BDBDBD')
cmap=session.viewports['Viewport: 1'].colorMappings['Material']
session.viewports['Viewport: 1'].setColor(colorMapping=cmap)
session.viewports['Viewport: 1'].disableMultipleColors()
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
mdb.models['Model-1'].loads['SXZ_xzn'].suppress()
mdb.models['Model-1'].loads['SXZ_xzp'].suppress()
mdb.models['Model-1'].loads['SXZ_zxn'].suppress()
mdb.models['Model-1'].loads['SXZ_zxp'].suppress()
mdb.models['Model-1'].loads['SYN'].resume()
mdb.models['Model-1'].loads['SYP'].resume()
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
session.viewports['Viewport: 1'].view.setValues(nearPlane=37.7134, 
    farPlane=71.9354, width=42.6967, height=17.6975, cameraPosition=(-45.3047, 
    -3.57784, 38.1756), cameraUpVector=(-0.246922, 0.105151, -0.963314), 
    cameraTarget=(0.314692, -0.62937, 7.81468))
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FYY1681942873.162.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXX.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXX.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXX1681943459.31.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXX1681943459.31.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXX1681943459.31.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FXX1681943459.31.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYY.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYY.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FYY1681943614.992.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FYY1681943614.992.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FYY1681943614.992.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FYY1681943614.992.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FZZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FZZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943763.57.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943763.57.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943763.57.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EVOL', outputPosition=WHOLE_ELEMENT, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
p = mdb.models['Model-1'].parts['Part-1']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943763.57.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FZZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FZZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943812.409.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943812.409.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943812.409.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681943812.409.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXY.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXY.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXY1681943892.296.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXY1681943892.296.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXY1681943892.296.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FXY1681943892.296.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681943943.975.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681943943.975.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681943943.975.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681943943.975.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681943982.055.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681943982.055.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681943982.055.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681943982.055.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYY.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYY.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FYY1681944119.935.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FYY1681944119.935.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FYY1681944119.935.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FYY1681944119.935.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FZZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FZZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681944174.018.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681944174.018.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681944174.018.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FZZ1681944174.018.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXY.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXY.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXY1681944215.345.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXY1681944215.345.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXY1681944215.345.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FXY1681944215.345.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FYZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681944272.404.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681944272.404.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681944272.404.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/Users/KARANT~1/AppData/Local/Temp/FYZ1681944272.404.odb'])
o3 = session.openOdb(
    name='D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXZ.odb')
#* OdbError: The database is from a previous release of Abaqus. 
#* Run abaqus -upgrade -job <newFileName> -odb <oldOdbFileName> to upgrade it.
from  abaqus import session
session.upgradeOdb(
    "D:/Mtech/Composits/Project/Project_report_code_22101028/CAE File for RVE/FXZ.odb", 
    "C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681944313.963.odb", )
from  abaqus import session
o7 = session.openOdb(
    'C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681944313.963.odb')
#: Model: C:/Users/KARANT~1/AppData/Local/Temp/FXZ1681944313.963.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       3
#: Number of Node Sets:          3
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
a = mdb.models['Model-1'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)

---------- RUNTIME EXCEPTION HAS OCCURRED ----------
*** ERROR: ABAQUS/ABQcaeK rank 0 received the ABORT signal

---------- RUNTIME EXCEPTION HAS OCCURRED ----------
*** ERROR: ABAQUS/ABQcaeK rank 0 received the ABORT signal
