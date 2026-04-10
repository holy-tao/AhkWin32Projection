#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class Pilot extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_ON => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_PILOT_MAX => 3
}
