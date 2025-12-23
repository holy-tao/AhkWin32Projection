#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_CONNECTION_PHASE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static connection_phase_any => 0

    /**
     * @type {Integer (Int32)}
     */
    static connection_phase_initial_connection => 1

    /**
     * @type {Integer (Int32)}
     */
    static connection_phase_post_l3_connection => 2
}
