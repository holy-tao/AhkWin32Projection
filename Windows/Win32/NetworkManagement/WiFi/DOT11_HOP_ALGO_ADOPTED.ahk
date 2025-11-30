#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_HOP_ALGO_ADOPTED extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_hop_algo_current => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_hop_algo_hop_index => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_hop_algo_hcc => 2
}
