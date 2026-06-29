#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSPIN_MDL_CACHING_EVENT.ahk" { KSPIN_MDL_CACHING_EVENT }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPIN_MDL_CACHING_NOTIFICATION32 {
    #StructPack 4

    Event : KSPIN_MDL_CACHING_EVENT

    Buffer : UInt32

}
