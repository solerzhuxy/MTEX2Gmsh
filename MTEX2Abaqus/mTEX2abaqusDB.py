# Do not edit this file or it may not load correctly
# if you try to open it with the RSG Dialog Builder.

# Note: thisDir is defined by the Activator class when
#       this file gets exec'd

from rsg.rsgGui import *
from abaqusConstants import INTEGER, FLOAT
dialogBox = RsgDialog(title='Import EBSD data', kernelModule='AbaqusImport', kernelFunction='importEBSD', includeApplyBtn=False, includeSeparator=True, okBtnText='OK', applyBtnText='Apply', execDir=thisDir)
RsgHorizontalFrame(name='HFrame_1', p='DialogBox', layout='0', pl=0, pr=0, pt=0, pb=0)
RsgIcon(p='HFrame_1', fileName=r'Image.png')
RsgVerticalFrame(name='VFrame_3', p='HFrame_1', layout='0', pl=0, pr=0, pt=0, pb=0)
RsgLabel(p='VFrame_3', text='Select the INP file you want to import', useBoldFont=True)
RsgVerticalAligner(name='VAligner_1', p='VFrame_3', pl=0, pr=0, pt=0, pb=0)
RsgFileTextField(p='VAligner_1', ncols=43, labelText='Mesh file:', keyword='inpFileName', default='', patterns='*.inp')
RsgFileTextField(p='VAligner_1', ncols=43, labelText='Grain properties:', keyword='CSVfileName', default='<leave empty if the CSV file is in the same folder>', patterns='*.csv')
RsgCheckButton(p='VFrame_3', text='Cohesive elements at grain boundaries (experimental!)', keyword='cohesive', default=False)
dialogBox.show()