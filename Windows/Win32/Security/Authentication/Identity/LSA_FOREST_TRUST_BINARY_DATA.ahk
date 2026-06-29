#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains binary data used in Local Security Authority forest trust operations.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_binary_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_BINARY_DATA {
    #StructPack 8

    Length : UInt32

    /**
     * Pointer to an array of type <b>UCHAR</b> that contains the binary data. The buffer can contain at most 128 KB of data.
     */
    Buffer : IntPtr

}
