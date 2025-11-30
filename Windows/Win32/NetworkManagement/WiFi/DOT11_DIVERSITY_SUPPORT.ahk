#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DIVERSITY_SUPPORT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_fixedlist => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_notsupported => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_dynamic => 3
}
