#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class CH_DESCRIPTION_TYPE extends Win32Enum {

    /**
     * Native name: ch_description_type_logical
     * @type {Integer (Int32)}
     */
    static logical => 1

    /**
     * Native name: ch_description_type_center_frequency
     * @type {Integer (Int32)}
     */
    static center_frequency => 2

    /**
     * Native name: ch_description_type_phy_specific
     * @type {Integer (Int32)}
     */
    static phy_specific => 3
}
