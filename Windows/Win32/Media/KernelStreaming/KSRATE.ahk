#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRATE {
    #StructPack 8

    PresentationStart : Int64

    Duration : Int64

    Interface : KSIDENTIFIER

    Rate : Int32

    Flags : UInt32

}
