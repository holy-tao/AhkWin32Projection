#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_CHANNEL_BINDINGS.ahk" { SEC_CHANNEL_BINDINGS }

/**
 * Specifies a structure that contains channel binding information for a security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_bindings
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_Bindings {
    #StructPack 8

    /**
     * The size, in bytes, of the structure specified by the <b>Bindings</b> member
     */
    BindingsLength : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_channel_bindings">SEC_CHANNEL_BINDINGS</a> structure that specifies channel binding information.
     */
    Bindings : SEC_CHANNEL_BINDINGS.Ptr

}
