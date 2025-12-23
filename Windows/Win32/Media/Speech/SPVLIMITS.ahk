#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVLIMITS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPMIN_VOLUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPMAX_VOLUME => 100

    /**
     * @type {Integer (Int32)}
     */
    static SPMIN_RATE => -10

    /**
     * @type {Integer (Int32)}
     */
    static SPMAX_RATE => 10
}
