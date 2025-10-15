#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information needed for preshared key authentication.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_kerberos_authentication1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_KERBEROS_AUTHENTICATION1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>UINT32</b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>wchar_t*</b>
     * 
     * The Kerberos proxy server.
     * @type {PWSTR}
     */
    proxyServer{
        get {
            if(!this.HasProp("__proxyServer"))
                this.__proxyServer := PWSTR(this.ptr + 8)
            return this.__proxyServer
        }
    }
}
