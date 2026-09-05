#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_DIGITAL_CP extends Win32Enum {

    /**
     * Native name: AM_DIGITAL_CP_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: AM_DIGITAL_CP_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * Native name: AM_DIGITAL_CP_DVD_COMPLIANT
     * @type {Integer (Int32)}
     */
    static DVD_COMPLIANT => 2
}
