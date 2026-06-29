#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINECOUNTRYLIST structure describes a list of countries/regions. This structure can contain an array of LINECOUNTRYENTRY structures. LINECOUNTRYLIST is returned by the lineGetCountry function.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecountrylist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINECOUNTRYLIST {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountryentry">LINECOUNTRYENTRY</a> structures present in the array defined by <b>dwCountryListSize</b> and <b>dwCountryListOffset</b>.
     */
    dwNumCountries : UInt32

    /**
     * Size of the array of country/region information, in bytes.
     */
    dwCountryListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecountryentry">LINECOUNTRYENTRY</a> structures that provides the information for each country/region. The size of the field is specified by <b>dwCountryListSize</b>.
     */
    dwCountryListOffset : UInt32

}
