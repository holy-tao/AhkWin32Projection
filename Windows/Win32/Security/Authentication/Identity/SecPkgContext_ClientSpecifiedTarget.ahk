#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the service principal name (SPN) of the initial target when calling the QueryContextAttributes (Digest) function.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_clientspecifiedtarget
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_ClientSpecifiedTarget {
    #StructPack 8

    /**
     * The SPN of the initial target.
     */
    sTargetName : IntPtr

}
