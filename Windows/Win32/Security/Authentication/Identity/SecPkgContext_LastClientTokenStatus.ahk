#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_ATTR_LCT_STATUS.ahk" { SECPKG_ATTR_LCT_STATUS }

/**
 * Specifies whether the token from the most recent call to the InitializeSecurityContext function is the last token from the client.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_lastclienttokenstatus
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_LastClientTokenStatus {
    #StructPack 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ne-sspi-secpkg_attr_lct_status">SECPKG_ATTR_LCT_STATUS</a> enumeration that indicates the status of the token returned by the most recent  call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext</a>.
     */
    LastClientTokenStatus : SECPKG_ATTR_LCT_STATUS

}
