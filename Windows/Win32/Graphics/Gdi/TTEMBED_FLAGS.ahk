#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class TTEMBED_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: TTEMBED_EMBEDEUDC
     * @type {Integer (UInt32)}
     */
    static EMBEDEUDC => 32

    /**
     * Native name: TTEMBED_RAW
     * @type {Integer (UInt32)}
     */
    static RAW => 0

    /**
     * Native name: TTEMBED_SUBSET
     * @type {Integer (UInt32)}
     */
    static SUBSET => 1

    /**
     * Native name: TTEMBED_TTCOMPRESSED
     * @type {Integer (UInt32)}
     */
    static TTCOMPRESSED => 4
}
