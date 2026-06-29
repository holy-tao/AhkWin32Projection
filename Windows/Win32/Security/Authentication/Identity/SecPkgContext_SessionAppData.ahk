#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores application data for a session context.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_sessionappdata
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_SessionAppData {
    #StructPack 8

    /**
     * Reserved for future use.
     */
    dwFlags : UInt32

    /**
     * Count of bytes used by <b>pbAppData</b>.
     */
    cbAppData : UInt32

    /**
     * Pointer to a <b>BYTE</b> that represents the session application data.
     */
    pbAppData : IntPtr

}
