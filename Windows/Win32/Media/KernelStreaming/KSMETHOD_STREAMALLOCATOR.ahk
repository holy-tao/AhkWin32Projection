#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMETHOD_STREAMALLOCATOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_STREAMALLOCATOR_ALLOC => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_STREAMALLOCATOR_FREE => 1
}
