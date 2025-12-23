#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDINOTIFICATIONTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static fdintCABINET_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static fdintPARTIAL_FILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static fdintCOPY_FILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static fdintCLOSE_FILE_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static fdintNEXT_CABINET => 4

    /**
     * @type {Integer (Int32)}
     */
    static fdintENUMERATE => 5
}
