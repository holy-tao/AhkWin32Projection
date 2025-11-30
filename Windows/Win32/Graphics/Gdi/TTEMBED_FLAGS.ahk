#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TTEMBED_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_EMBEDEUDC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_RAW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_SUBSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTEMBED_TTCOMPRESSED => 4
}
