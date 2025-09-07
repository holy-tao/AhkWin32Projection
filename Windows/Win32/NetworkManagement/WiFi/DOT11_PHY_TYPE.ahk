#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines an 802.11 PHY and media type.
 * @remarks
 * An IHV can assign a value for its proprietary PHY types from **dot11\_phy\_type\_IHV\_start** through **dot11\_phy\_type\_IHV\_end**. The IHV must assign a unique number from this range for each of its proprietary PHY types.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-phy-type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PHY_TYPE{

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
