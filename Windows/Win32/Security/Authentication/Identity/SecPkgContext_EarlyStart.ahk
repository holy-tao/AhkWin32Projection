#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_EarlyStart structure contains information about whether to attempt to use the False Start feature in a security context.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_earlystart
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_EarlyStart {
    #StructPack 4

    /**
     * Determines whether to attempt client-side False Start. Set the value to <b>ENABLE_TLS_CLIENT_EARLY_START</b> (1) to use False Start.
     */
    dwEarlyStartFlags : UInt32

}
