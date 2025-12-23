#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class FRAMING_CACHE_OPS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_Update => 0

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_ReadLast => 1

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_ReadOrig => 2

    /**
     * @type {Integer (Int32)}
     */
    static Framing_Cache_Write => 3
}
