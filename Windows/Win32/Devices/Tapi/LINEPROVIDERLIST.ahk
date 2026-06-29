#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEPROVIDERLIST structure describes a list of service providers. A structure of this type is returned by the lineGetProviderList function. The LINEPROVIDERLIST structure can contain an array of LINEPROVIDERENTRY structures.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproviderlist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEPROVIDERLIST {
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderentry">LINEPROVIDERENTRY</a> structures present in the array denominated by <b>dwProviderListSize</b> and <b>dwProviderListOffset</b>.
     */
    dwNumProviders : UInt32

    /**
     * Size of the provider list array, in bytes.
     */
    dwProviderListSize : UInt32

    /**
     * Offset from the beginning of this structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderentry">LINEPROVIDERENTRY</a> elements, which provide the information on each service provider. The size of the array is specified by <b>dwProviderListSize</b>.
     */
    dwProviderListOffset : UInt32

}
