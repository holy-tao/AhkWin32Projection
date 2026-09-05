#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BDA_LockType extends Win32Enum {

    /**
     * Native name: Bda_LockType_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: Bda_LockType_PLL
     * @type {Integer (Int32)}
     */
    static PLL => 1

    /**
     * Native name: Bda_LockType_DecoderDemod
     * @type {Integer (Int32)}
     */
    static DecoderDemod => 2

    /**
     * Native name: Bda_LockType_Complete
     * @type {Integer (Int32)}
     */
    static Complete => 128
}
