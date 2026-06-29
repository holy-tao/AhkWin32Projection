#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The logoff time of the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_logofftime
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_LogoffTime {
    #StructPack 8

    /**
     * The logoff time for the user.
     */
    tsLogoffTime : Int64

}
