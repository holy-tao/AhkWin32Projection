#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMAX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_MAX_Q_NAME_LEN => 124

    /**
     * @type {Integer (Int32)}
     */
    static MQ_MAX_Q_LABEL_LEN => 124
}
