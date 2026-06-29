#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a list of supported country or region strings.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_country_or_region_string_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_COUNTRY_OR_REGION_STRING_LIST {
    #StructPack 4

    /**
     * Indicates the number of supported country or region strings.
     */
    dwNumberOfItems : UInt32

    /**
     * A list of supported country or region strings. In Windows, a <b>DOT11_COUNTRY_OR_REGION_STRING</b> is of type <b>char[3]</b>.
     */
    pCountryOrRegionStringList : Int8[3]

}
