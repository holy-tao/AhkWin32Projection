#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_HOST_CONNECTION_GROUP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszHost{
        get {
            if(!this.HasProp("__pwszHost"))
                this.__pwszHost := PWSTR(this.ptr + 0)
            return this.__pwszHost
        }
    }

    /**
     * @type {Integer}
     */
    cConnectionGroups {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<WINHTTP_CONNECTION_GROUP>}
     */
    pConnectionGroups {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
