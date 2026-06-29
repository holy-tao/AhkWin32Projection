#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEPROVIDERENTRY structure provides the information for a single service provider entry. An array of these structures is returned as part of the LINEPROVIDERLIST structure returned by the function lineGetProviderList.
 * @remarks
 * Not extensible.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproviderentry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEPROVIDERENTRY {
    #StructPack 4

    /**
     * Permanent provider identifier of the entry.
     */
    dwPermanentProviderID : UInt32

    /**
     * Size of the provider file name string, including the <b>null</b> terminator, in bytes.
     */
    dwProviderFilenameSize : UInt32

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderlist">LINEPROVIDERLIST</a> structure to a <b>null</b>-terminated string containing the file name (path) of the service provider DLL (.TSP) file. The size of the string is specified by <b>dwProviderFilenameSize</b>.
     */
    dwProviderFilenameOffset : UInt32

}
