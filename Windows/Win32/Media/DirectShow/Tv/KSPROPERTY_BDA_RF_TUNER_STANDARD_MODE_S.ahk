#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSP_NODE.ahk" { KSP_NODE }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_RF_TUNER_STANDARD_MODE_S {
    #StructPack 8

    Property : KSP_NODE

    AutoDetect : BOOL

}
