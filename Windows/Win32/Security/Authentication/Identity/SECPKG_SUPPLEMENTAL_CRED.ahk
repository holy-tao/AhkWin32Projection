#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The SECPKG_SUPPLEMENTAL_CRED structure contains supplemental credentials recognized by the security package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_supplemental_cred
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SUPPLEMENTAL_CRED {
    #StructPack 8

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a> that authenticated the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
     */
    PackageName : LSA_UNICODE_STRING

    /**
     * The size of the <b>Credentials</b> member, in bytes.
     */
    CredentialSize : UInt32

    /**
     * Pointer to a set of package-specific supplemental credentials.
     */
    Credentials : IntPtr

}
