#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class CH_DESCRIPTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ch_description_type_logical => 1

    /**
     * @type {Integer (Int32)}
     */
    static ch_description_type_center_frequency => 2

    /**
     * @type {Integer (Int32)}
     */
    static ch_description_type_phy_specific => 3
}
