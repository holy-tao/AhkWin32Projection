#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class FOREIGN_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_STATUS_FOREIGN => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_STATUS_NOT_FOREIGN => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_STATUS_UNKNOWN => 2
}
