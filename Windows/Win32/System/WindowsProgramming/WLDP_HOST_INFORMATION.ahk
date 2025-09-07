#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * A structure identifying the host and source file to be evaluated.
 * @remarks
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
     * Must be **WLDP\_HOST\_INFORMATION\_REVISION**.
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Enumeration value from [**WLDP\_HOST\_ID**](ne-wldp-wldp_host_id.md) that describes the host ID.
     * @type {Integer}
     */
    dwHostId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Full path and script name with the extension. NULL for **WLDP\_HOST\_ID\_GLOBAL**, or manual script execution.
     * @type {PWSTR}
     */
    szSource{
        get {
            if(!this.HasProp("__szSource"))
                this.__szSource := PWSTR(this.ptr + 8)
            return this.__szSource
        }
    }

    /**
     * In addition to the name, the caller can specify a handle to the file used for validation.
     * @type {HANDLE}
     */
    hSource{
        get {
            if(!this.HasProp("__hSource"))
                this.__hSource := HANDLE(this.ptr + 16)
            return this.__hSource
        }
    }
}
