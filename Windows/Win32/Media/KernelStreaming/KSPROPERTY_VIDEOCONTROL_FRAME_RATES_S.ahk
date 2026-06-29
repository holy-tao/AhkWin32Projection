#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

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
