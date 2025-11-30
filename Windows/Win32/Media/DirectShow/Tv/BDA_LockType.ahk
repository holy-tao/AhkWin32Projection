#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class BDA_LockType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_PLL => 1

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_DecoderDemod => 2

    /**
     * @type {Integer (Int32)}
     */
    static Bda_LockType_Complete => 128
}
