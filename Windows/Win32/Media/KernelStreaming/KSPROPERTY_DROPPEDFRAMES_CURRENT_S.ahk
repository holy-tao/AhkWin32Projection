#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_DROPPEDFRAMES_CURRENT_S {
    #StructPack 8

    Property : KSIDENTIFIER

    PictureNumber : Int64

    DropCount : Int64

    AverageFrameSize : UInt32

}
