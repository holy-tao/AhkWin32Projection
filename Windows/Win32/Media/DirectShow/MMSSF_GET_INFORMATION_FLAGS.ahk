#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class MMSSF_GET_INFORMATION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: MMSSF_HASCLOCK
     * @type {Integer (Int32)}
     */
    static HASCLOCK => 1

    /**
     * Native name: MMSSF_SUPPORTSEEK
     * @type {Integer (Int32)}
     */
    static SUPPORTSEEK => 2

    /**
     * Native name: MMSSF_ASYNCHRONOUS
     * @type {Integer (Int32)}
     */
    static ASYNCHRONOUS => 4
}
