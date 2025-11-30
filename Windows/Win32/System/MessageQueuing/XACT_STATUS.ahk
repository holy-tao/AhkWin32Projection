#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class XACT_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_XACT_STATUS_XACT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_XACT_STATUS_NOT_XACT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_XACT_STATUS_UNKNOWN => 2
}
