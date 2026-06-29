#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_SessionKey structure contains information about the session key used for the security context. This structure is returned by the QueryContextAttributes (General) function.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_sessionkey
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_SessionKey {
    #StructPack 8

    /**
     * Size, in bytes, of the session key.
     */
    SessionKeyLength : UInt32

    /**
     * The session key for the security context.
     */
    SessionKey : IntPtr

}
