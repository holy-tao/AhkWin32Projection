#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The native names of the client and server in the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_nativenamesw
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct SecPkgContext_NativeNamesW {
    #StructPack 8

    /**
     * The client name.
     */
    sClientName : IntPtr

    /**
     * The server name.
     */
    sServerName : IntPtr

}
