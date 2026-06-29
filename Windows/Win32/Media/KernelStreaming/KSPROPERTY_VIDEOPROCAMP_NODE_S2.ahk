#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSP_NODE.ahk" { KSP_NODE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDEOPROCAMP_NODE_S2 {
    #StructPack 8

    NodeProperty : KSP_NODE

    Value1 : Int32

    Flags : UInt32

    Capabilities : UInt32

    Value2 : Int32

}
