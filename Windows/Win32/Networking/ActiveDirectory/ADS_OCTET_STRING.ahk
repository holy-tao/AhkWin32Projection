#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_OCTET_STRING structure is an ADSI representation of the Octet String attribute syntax used in Active Directory.
 * @remarks
 * Memory for the byte array must be allocated separately.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_octet_string
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_OCTET_STRING {
    #StructPack 8

    /**
     * The size, in bytes, of the character array.
     */
    dwLength : UInt32

    /**
     * Pointer to an array of single byte characters 
     * not interpreted by the underlying directory.
     */
    lpValue : IntPtr

}
