#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_STREAMALLOCATOR extends Win32Enum {

    /**
     * Native name: KSEVENT_STREAMALLOCATOR_INTERNAL_FREEFRAME
     * @type {Integer (Int32)}
     */
    static INTERNAL_FREEFRAME => 0

    /**
     * Native name: KSEVENT_STREAMALLOCATOR_FREEFRAME
     * @type {Integer (Int32)}
     */
    static FREEFRAME => 1
}
