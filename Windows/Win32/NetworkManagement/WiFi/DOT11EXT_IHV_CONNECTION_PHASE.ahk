#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11EXT_IHV_CONNECTION_PHASE extends Win32Enum {

    /**
     * Native name: connection_phase_any
     * @type {Integer (Int32)}
     */
    static any => 0

    /**
     * Native name: connection_phase_initial_connection
     * @type {Integer (Int32)}
     */
    static initial_connection => 1

    /**
     * Native name: connection_phase_post_l3_connection
     * @type {Integer (Int32)}
     */
    static post_l3_connection => 2
}
