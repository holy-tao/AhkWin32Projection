#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_RADIO_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusOn => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusHardwareOff => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusSoftwareOff => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusHardwareSoftwareOff => 3

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11RadioStatusMax => 4
}
