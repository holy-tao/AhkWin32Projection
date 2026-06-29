#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_DceInfo structure contains authorization data used by DCE services. The QueryContextAttributes (General) function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_dceinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_DceInfo {
    #StructPack 8

    /**
     * Specifies the authorization service used. For DCE use only.
     */
    AuthzSvc : UInt32

    /**
     * Pointer to package-specific authorization data.
     */
    pPac : IntPtr

}
