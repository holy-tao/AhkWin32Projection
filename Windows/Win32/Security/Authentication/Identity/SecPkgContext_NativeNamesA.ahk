#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the client and server principal names.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-_secpkgcontext_nativenamesa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct SecPkgContext_NativeNamesA {
    #StructPack 8

    /**
     * The client principal name (CNAME).
     */
    sClientName : IntPtr

    /**
     * The server principal name (CNAME).
     */
    sServerName : IntPtr

}
