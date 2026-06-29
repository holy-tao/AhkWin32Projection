#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINETRANSLATECAPS structure describes the address translation capabilities.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linetranslatecaps
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINETRANSLATECAPS {
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
     * Number of entries in the <b>LocationList</b>. It includes all locations defined, including zero (default).
     */
    dwNumLocations : UInt32

    /**
     * Size of the list of locations known to the address translation, in bytes.
     */
    dwLocationListSize : UInt32

    /**
     * Offset from the beginning of this structure to the list of locations known to the address translation. The list consists of a sequence of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structures. The <b>dwLocationListOffset</b> member points to the first byte of the first structure, and the <b>dwLocationListSize</b> member indicates the total number of bytes in the list.
     */
    dwLocationListOffset : UInt32

    /**
     * Permanent identifier for the <b>CurrentLocation</b> entry in the [Locations] section of the registry. See the <b>dwPermanentLocationID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     */
    dwCurrentLocationID : UInt32

    /**
     * Number of entries in the <b>CardList</b>.
     */
    dwNumCards : UInt32

    /**
     * Size of the list of calling cards known to the address translation, in bytes.
     */
    dwCardListSize : UInt32

    /**
     * Offset from the beginning of this structure to the list of calling cards known to the address translation. It includes only non-hidden card entries and always includes card 0 (direct dial). The list consists of a sequence of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecardentry">LINECARDENTRY</a> structures. The <b>dwCardListOffset</b> member points to the first byte of the first structure, and the <b>dwCardListSize</b> member indicates the total number of bytes in the list.
     */
    dwCardListOffset : UInt32

    /**
     * Preferred calling card for the <b>CurrentLocation</b> entry in the [Locations] section of the registry. See the <b>dwPreferredCardID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     */
    dwCurrentPreferredCardID : UInt32

}
