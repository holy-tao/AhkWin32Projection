#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_CRED_CLASS.ahk" { SECPKG_CRED_CLASS }

/**
 * Specifies the type of credentials used to create a client context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_credinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_CredInfo {
    #StructPack 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ne-sspi-secpkg_cred_class">SECPKG_CRED_CLASS</a> enumeration that indicates the type of credentials.
     */
    CredClass : SECPKG_CRED_CLASS

    /**
     * A nonzero value indicates that the application must prompt the user for credentials. All other values indicate that the application does not need to prompt the user.
     */
    IsPromptingNeeded : UInt32

}
