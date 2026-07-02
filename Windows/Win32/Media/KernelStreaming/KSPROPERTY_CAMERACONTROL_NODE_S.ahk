#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSP_NODE.ahk" { KSP_NODE }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_CAMERACONTROL_NODE_S {
    #StructPack 8

    NodeProperty : KSP_NODE

    Value : Int32

    Flags : UInt32

    Capabilities : UInt32

}
