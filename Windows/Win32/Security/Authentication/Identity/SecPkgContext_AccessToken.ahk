#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returns a handle to the access token for the current security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_accesstoken
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_AccessToken {
    #StructPack 8

    /**
     * Pointer to a <b>void</b> that receives the handle to the access token that represents the authenticated user.
     * 
     * The returned  handle is not duplicated, so the calling process must not call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> on the returned handle.
     * 
     * If the security context is for a server or is incomplete, the returned  handle may be <b>NULL</b>. Depending on the security package, <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> may return SEC_E_NO_IMPERSONATION for these cases.
     */
    AccessToken : IntPtr

}
