#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_NETWORK_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11FH => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11DS => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11OFDM5 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11OFDM24 => 3

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Automode => 4

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11NetworkTypeMax => 5
}
