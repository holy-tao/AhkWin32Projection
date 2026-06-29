#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_HWREGISTER_PROPERTY32 {
    #StructPack 8

    Property : KSIDENTIFIER

    BaseAddress : UInt32

}
