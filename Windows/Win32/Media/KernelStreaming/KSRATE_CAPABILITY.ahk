#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSRATE.ahk" { KSRATE }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRATE_CAPABILITY {
    #StructPack 8

    Property : KSIDENTIFIER

    Rate : KSRATE

}
