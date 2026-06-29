#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A SECPKG_GSS_INFO structure contains information used for GSS-compatible negotiations.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_gss_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_GSS_INFO {
    #StructPack 4

    /**
     * The encoded GSS OID length.
     */
    EncodedIdLength : UInt32

    /**
     * The encoded GSS OID.
     */
    EncodedId : Int8[4]

}
