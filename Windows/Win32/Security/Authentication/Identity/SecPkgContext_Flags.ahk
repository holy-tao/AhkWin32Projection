#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_Flags structure contains information about the flags in the current security context. This structure is returned by QueryContextAttributes (General).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_flags
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_Flags {
    #StructPack 4

    /**
     * Flag values for the current security context. These values correspond to the flags negotiated by the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> functions.
     */
    Flags : UInt32

}
