#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECPKG_ATTR_LCT_STATUS.ahk

/**
 * Specifies whether the token from the most recent call to the InitializeSecurityContext function is the last token from the client.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_lastclienttokenstatus
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgContext_LastClientTokenStatus extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ne-sspi-secpkg_attr_lct_status">SECPKG_ATTR_LCT_STATUS</a> enumeration that indicates the status of the token returned by the most recent  call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext</a>.
     * @type {SECPKG_ATTR_LCT_STATUS}
     */
    LastClientTokenStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
