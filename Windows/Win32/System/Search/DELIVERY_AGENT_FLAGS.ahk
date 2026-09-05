#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DELIVERY_AGENT_FLAGS extends Win32Enum {

    /**
     * Native name: DELIVERY_AGENT_FLAG_NO_BROADCAST
     * @type {Integer (Int32)}
     */
    static FLAG_NO_BROADCAST => 4

    /**
     * Native name: DELIVERY_AGENT_FLAG_NO_RESTRICTIONS
     * @type {Integer (Int32)}
     */
    static FLAG_NO_RESTRICTIONS => 8

    /**
     * Native name: DELIVERY_AGENT_FLAG_SILENT_DIAL
     * @type {Integer (Int32)}
     */
    static FLAG_SILENT_DIAL => 16
}
