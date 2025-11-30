#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-phy-type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PHY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_any => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_fhss => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_dsss => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_irbaseband => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_ofdm => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_hrdsss => 5

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_erp => 6

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_ht => 7

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_vht => 8

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_dmg => 9

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_he => 10

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_eht => 11

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_IHV_start => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static dot11_phy_type_IHV_end => -1
}
