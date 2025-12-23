#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DELIVERY_AGENT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DELIVERY_AGENT_FLAG_NO_BROADCAST => 4

    /**
     * @type {Integer (Int32)}
     */
    static DELIVERY_AGENT_FLAG_NO_RESTRICTIONS => 8

    /**
     * @type {Integer (Int32)}
     */
    static DELIVERY_AGENT_FLAG_SILENT_DIAL => 16
}
