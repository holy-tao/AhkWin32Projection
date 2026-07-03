#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\KernelStreaming\KSP_NODE.ahk" { KSP_NODE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_RF_TUNER_STANDARD_MODE_S {
    #StructPack 8

    Property : KSP_NODE

    AutoDetect : BOOL

}
