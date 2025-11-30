#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MMSSF_GET_INFORMATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static MMSSF_HASCLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MMSSF_SUPPORTSEEK => 2

    /**
     * @type {Integer (Int32)}
     */
    static MMSSF_ASYNCHRONOUS => 4
}
