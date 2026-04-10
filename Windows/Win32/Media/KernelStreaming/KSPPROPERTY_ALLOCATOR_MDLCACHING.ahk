#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPPROPERTY_ALLOCATOR_MDLCACHING extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_ALLOCATOR_CLEANUP_CACHEDMDLPAGES => 1
}
