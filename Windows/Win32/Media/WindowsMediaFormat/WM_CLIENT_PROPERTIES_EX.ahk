#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_CLIENT_PROPERTIES_EX structure holds extended client information.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wm_client_properties_ex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_CLIENT_PROPERTIES_EX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <b>DWORD</b> containing the size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * String containing the client's IP address in dot notation (for example, "192.168.10.2").
     * @type {PWSTR}
     */
    pwszIPAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * String containing the client's port number.
     * @type {PWSTR}
     */
    pwszPort {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * String containing the client's name on the domain name server (DNS), if known.
     * @type {PWSTR}
     */
    pwszDNSName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
