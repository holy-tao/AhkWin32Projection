#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides the payload information of the certificate hash.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_certificate_hashinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CERTIFICATE_HASHINFO {
    #StructPack 2

    /**
     * Length, in bytes, of the WCHAR string specifying the certificate store name. If <b>StoreNameLength</b> is zero, the "MY" certificate store is implied; otherwise the WCHAR string must immediately follow the <b>KERB_CERTIFICATE_HASHINFO</b> structure in contiguous memory and must include a terminating null character.
     */
    StoreNameLength : UInt16

    /**
     * Length, in bytes, of the certificate hash. The certificate hash data must follow the <b>KERB_CERTIFICATE_HASHINFO</b> structure and certificate store name (if present) in contiguous memory.
     */
    HashLength : UInt16

}
