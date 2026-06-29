#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds the user flags.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_userflags
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_UserFlags {
    #StructPack 4

    /**
     * A set of flags that indicate the user's capabilities.
     */
    UserFlags : UInt32

}
