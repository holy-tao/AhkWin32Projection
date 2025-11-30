#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQTRANSACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_NO_TRANSACTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQ_MTS_TRANSACTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_XA_TRANSACTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQ_SINGLE_MESSAGE => 3
}
