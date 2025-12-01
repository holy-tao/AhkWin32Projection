#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the data for a single country/region entry.
 * @remarks
 * This structure cannot be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecountryentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECOUNTRYENTRY extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Country/region identifier of the entry. The country/region identifier is an internal identifier that allows multiple entries to exist in the country/region list with the same country/region code, for example, all countries or regions in North America and the Caribbean share the country/region code 1, but require separate entries in the list.
     * @type {Integer}
     */
    dwCountryID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Country/region code of the country/region represented by the entry; that is, the digits dialed in an international call. Only this value should be displayed to users. Country/region identifiers should never be displayed.
     * @type {Integer}
     */
    dwCountryCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Country/region identifier of the next entry in the country/region list. Because country/region codes and identifiers are not assigned in any regular numeric sequence, the country/region list is a single linked list, with each entry pointing to the next. The last country/region in the list has a <b>dwNextCountryID</b> value of zero. When the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure is used to obtain the entire list, the entries in the list are in sequence as linked by their <b>dwNextCountryID</b> members.
     * @type {Integer}
     */
    dwNextCountryID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size, in bytes, of the name of the country/region including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwCountryNameSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the name of the country/region. The size of the field is specified by <b>dwCountryNameSize</b>.
     * @type {Integer}
     */
    dwCountryNameOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size, in bytes, of the direct-dialed dialing rule including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwSameAreaRuleSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that contains the dialing rule for direct-dialed calls to the same area code. The size of the field is specified by <b>dwSameAreaRuleSize</b>.
     * @type {Integer}
     */
    dwSameAreaRuleOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size, in bytes, of the long-distance dialing rule including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwLongDistanceRuleSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that contains the dialing rule for direct-dialed calls to other areas in the same country/region. The size of the field is specified by <b>dwLongDistanceRuleSize</b>.
     * @type {Integer}
     */
    dwLongDistanceRuleOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Size, in bytes, of the international dialing rule including the <b>null</b> terminator.
     * @type {Integer}
     */
    dwInternationalRuleSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure to a <b>null</b>-terminated string that contains the dialing rule for direct-dialed calls to other countries/regions. The size of the field is specified by <b>dwInternationalRuleSize</b>.
     * @type {Integer}
     */
    dwInternationalRuleOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
