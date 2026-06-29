#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used with the ADSVALUE structure to contain a distinguished name attribute value that also contains binary data.
 * @remarks
 * When extending the active directory schema to add <b>ADS_DN_WITH_BINARY</b>, you must also specify the otherWellKnownGuid attribute definition. Add the following to the ldf file attribute definition: omObjectClass:: KoZIhvcUAQEBCw==
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_binary
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_DN_WITH_BINARY {
    #StructPack 8

    /**
     * Contains the length, in bytes, of the binary data in <b>lpBinaryValue</b>.
     */
    dwLength : UInt32

    /**
     * Pointer to an array of bytes that contains the binary data for the attribute. The <b>dwLength</b> member contains the number of bytes in this array.
     */
    lpBinaryValue : IntPtr

    /**
     * Pointer to a null-terminated Unicode string that contains the distinguished name.
     */
    pszDNString : PWSTR

}
