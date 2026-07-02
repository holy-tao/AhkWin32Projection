#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDEOCONTROL_FRAME_RATES_S {
    #StructPack 8

    Property : KSIDENTIFIER

    StreamIndex : UInt32

    RangeIndex : UInt32

    Dimensions : SIZE

}
