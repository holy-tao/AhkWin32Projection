#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSMETHOD_STREAMALLOCATOR extends Win32Enum {

    /**
     * Native name: KSMETHOD_STREAMALLOCATOR_ALLOC
     * @type {Integer (Int32)}
     */
    static ALLOC => 0

    /**
     * Native name: KSMETHOD_STREAMALLOCATOR_FREE
     * @type {Integer (Int32)}
     */
    static FREE => 1
}
