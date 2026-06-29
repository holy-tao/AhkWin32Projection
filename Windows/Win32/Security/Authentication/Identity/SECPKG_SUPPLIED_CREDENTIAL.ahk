#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_SHORT_VECTOR.ahk" { SECPKG_SHORT_VECTOR }
#Import ".\SECPKG_BYTE_VECTOR.ahk" { SECPKG_BYTE_VECTOR }

/**
 * Specifies the supplied credentials.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_supplied_credential
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SUPPLIED_CREDENTIAL {
    #StructPack 4

    /**
     * The length of the header.
     */
    cbHeaderLength : UInt16

    /**
     * Pay load length, including the header.
     */
    cbStructureLength : UInt16

    /**
     * The user name for Unicode only.
     */
    UserName : SECPKG_SHORT_VECTOR

    /**
     * The domain name for Unicode only.
     */
    DomainName : SECPKG_SHORT_VECTOR

    /**
     * The credentials in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_packed_credentials">SEC_WINNT_AUTH_PACKED_CREDENTIALS</a> structure.
     */
    PackedCredentials : SECPKG_BYTE_VECTOR

    /**
     * The authentication identity flags.
     */
    CredFlags : UInt32

}
