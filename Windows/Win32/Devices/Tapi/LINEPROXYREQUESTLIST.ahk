#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEPROXYREQUESTLIST structure describes a list of proxy requests. The lineGetProxyStatus function returns the LINEPROXYREQUESTLIST structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproxyrequestlist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEPROXYREQUESTLIST {
    #StructPack 4

    /**
     * Total size allocated to this structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed to hold all the information requested, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Number of <b>DWORD</b> elements that appear in the list array.
     */
    dwNumEntries : UInt32

    /**
     * Size of the proxy request type list, in bytes.
     */
    dwListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of <b>DWORD</b> elements indicating the currently supported proxy request types. Each element is one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ constants</a>. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(DWORD). The size of the field is specified by <b>dwListSize</b>.
     */
    dwListOffset : UInt32

}
