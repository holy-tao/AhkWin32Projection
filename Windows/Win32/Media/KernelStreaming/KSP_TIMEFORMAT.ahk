#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSP_TIMEFORMAT {
    #StructPack 8

    Property : KSIDENTIFIER

    SourceFormat : Guid

    TargetFormat : Guid

    Time : Int64

}
