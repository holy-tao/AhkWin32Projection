#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQPRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_MIN_PRIORITY => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_MAX_PRIORITY => 7
}
