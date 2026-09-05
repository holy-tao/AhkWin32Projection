#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class FRAMING_CACHE_OPS extends Win32Enum {

    /**
     * Native name: Framing_Cache_Update
     * @type {Integer (Int32)}
     */
    static Update => 0

    /**
     * Native name: Framing_Cache_ReadLast
     * @type {Integer (Int32)}
     */
    static ReadLast => 1

    /**
     * Native name: Framing_Cache_ReadOrig
     * @type {Integer (Int32)}
     */
    static ReadOrig => 2

    /**
     * Native name: Framing_Cache_Write
     * @type {Integer (Int32)}
     */
    static Write => 3
}
