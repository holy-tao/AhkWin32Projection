#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ns-wldp-wldp_host_information
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_HOST_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwHostId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    szSource {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    hSource{
        get {
            if(!this.HasProp("__hSource"))
                this.__hSource := HANDLE(16, this)
            return this.__hSource
        }
    }
}
