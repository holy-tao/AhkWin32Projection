#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EXECUTION_STATE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static ES_AWAYMODE_REQUIRED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ES_CONTINUOUS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ES_DISPLAY_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ES_SYSTEM_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ES_USER_PRESENT => 4
}
