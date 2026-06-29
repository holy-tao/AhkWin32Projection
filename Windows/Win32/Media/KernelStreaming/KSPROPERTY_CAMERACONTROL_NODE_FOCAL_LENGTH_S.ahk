#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import ".\KSNODEPROPERTY.ahk" { KSNODEPROPERTY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CAMERACONTROL_NODE_FOCAL_LENGTH_S {
    #StructPack 8

    NodeProperty : KSNODEPROPERTY

    lOcularFocalLength : Int32

    lObjectiveFocalLengthMin : Int32

    lObjectiveFocalLengthMax : Int32

}
