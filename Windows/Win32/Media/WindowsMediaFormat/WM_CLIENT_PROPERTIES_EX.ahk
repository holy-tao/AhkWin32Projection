#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    pwszIPAddress{
        get {
            if(!this.HasProp("__pwszIPAddress"))
                this.__pwszIPAddress := PWSTR(this.ptr + 8)
            return this.__pwszIPAddress
        }
    }

    /**
     * String containing the client's port number.
     * @type {PWSTR}
     */
    pwszPort{
        get {
            if(!this.HasProp("__pwszPort"))
                this.__pwszPort := PWSTR(this.ptr + 16)
            return this.__pwszPort
        }
    }

    /**
     * String containing the client's name on the domain name server (DNS), if known.
     * @type {PWSTR}
     */
    pwszDNSName{
        get {
            if(!this.HasProp("__pwszDNSName"))
                this.__pwszDNSName := PWSTR(this.ptr + 24)
            return this.__pwszDNSName
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
