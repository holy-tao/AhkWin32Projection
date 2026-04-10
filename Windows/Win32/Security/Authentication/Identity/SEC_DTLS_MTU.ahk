#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Stores the DTLS MTU.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_dtls_mtu
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SEC_DTLS_MTU extends Win32Struct {
    static sizeof => 2

    static packingSize => 2

    /**
     * The path MTU for the connection.
     * @type {Integer}
     */
    PathMTU {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
