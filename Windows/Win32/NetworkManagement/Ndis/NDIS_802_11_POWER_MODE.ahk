#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_POWER_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeCAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeMAX_PSP => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeFast_PSP => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11PowerModeMax => 3
}
