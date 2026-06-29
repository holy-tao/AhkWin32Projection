#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the error status of the last attempt to create a client context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_negostatus
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_NegoStatus {
    #StructPack 4

    /**
     * The error status of the last attempt to create a client context.
     */
    LastStatus : UInt32

}
