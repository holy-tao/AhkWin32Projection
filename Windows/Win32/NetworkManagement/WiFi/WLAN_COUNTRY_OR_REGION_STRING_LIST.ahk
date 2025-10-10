#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of supported country or region strings.
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_country_or_region_string_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_COUNTRY_OR_REGION_STRING_LIST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Indicates the number of supported country or region strings.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A list of supported country or region strings. In Windows, a <b>DOT11_COUNTRY_OR_REGION_STRING</b> is of type <b>char[3]</b>.
     * @type {Array<Byte>}
     */
    pCountryOrRegionStringList{
        get {
            if(!this.HasProp("__pCountryOrRegionStringListProxyArray"))
                this.__pCountryOrRegionStringListProxyArray := Win32FixedArray(this.ptr + 4, 3, Primitive, "char")
            return this.__pCountryOrRegionStringListProxyArray
        }
    }
}
