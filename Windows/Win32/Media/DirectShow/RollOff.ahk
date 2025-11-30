#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class RollOff extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_ROLL_OFF_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_ROLL_OFF_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_ROLL_OFF_20 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_ROLL_OFF_25 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_ROLL_OFF_35 => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_ROLL_OFF_MAX => 4
}
