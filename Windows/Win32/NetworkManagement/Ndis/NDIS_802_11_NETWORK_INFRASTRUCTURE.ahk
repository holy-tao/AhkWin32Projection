#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_NETWORK_INFRASTRUCTURE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11IBSS => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Infrastructure => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11AutoUnknown => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11InfrastructureMax => 3
}
