#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MULTI_BYTE_TO_WIDE_CHAR_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MB_COMPOSITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ERR_INVALID_CHARS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MB_PRECOMPOSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MB_USEGLYPHCHARS => 4
}
