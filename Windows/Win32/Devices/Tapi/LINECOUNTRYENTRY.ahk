#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides the data for a single country/region entry.
 * @remarks
 * This structure cannot be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecountryentry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINECOUNTRYENTRY {
    #StructPack 4

    /**
     * Country/region identifier of the entry. The country/region identifier is an internal identifier that allows multiple entries to exist in the country/region list with the same country/region code, for example, all countries or regions in North America and the Caribbean share the country/region code 1, but require separate entries in the list.
     */
    dwCountryID : UInt32

    /**
     * Country/region code of the country/region represented by the entry; that is, the digits dialed in an international call. Only this value should be displayed to users. Country/region identifiers should never be displayed.
     */
    dwCountryCode : UInt32

    /**
     * Country/region identifier of the next entry in the country/region list. Because country/region codes and identifiers are not assigned in any regular numeric sequence, the country/region list is a single linked list, with each entry pointing to the next. The last country/region in the list has a <b>dwNextCountryID</b> value of zero. When the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure is used to obtain the entire list, the entries in the list are in sequence as linked by their <b>dwNextCountryID</b> members.
     */
    dwNextCountryID : UInt32

    /**
     * Size, in bytes, of the name of the country/region including the <b>null</b> terminator.
     */
    dwCountryNameSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the name of the country/region. The size of the field is specified by <b>dwCountryNameSize</b>.
     */
    dwCountryNameOffset : UInt32

    /**
     * Size, in bytes, of the direct-dialed dialing rule including the <b>null</b> terminator.
     */
    dwSameAreaRuleSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that contains the dialing rule for direct-dialed calls to the same area code. The size of the field is specified by <b>dwSameAreaRuleSize</b>.
     */
    dwSameAreaRuleOffset : UInt32

    /**
     * Size, in bytes, of the long-distance dialing rule including the <b>null</b> terminator.
     */
    dwLongDistanceRuleSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that contains the dialing rule for direct-dialed calls to other areas in the same country/region. The size of the field is specified by <b>dwLongDistanceRuleSize</b>.
     */
    dwLongDistanceRuleOffset : UInt32

    /**
     * Size, in bytes, of the international dialing rule including the <b>null</b> terminator.
     */
    dwInternationalRuleSize : UInt32

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountrylist">LINECOUNTRYLIST</a> structure to a <b>null</b>-terminated string that contains the dialing rule for direct-dialed calls to other countries/regions. The size of the field is specified by <b>dwInternationalRuleSize</b>.
     */
    dwInternationalRuleOffset : UInt32

}
