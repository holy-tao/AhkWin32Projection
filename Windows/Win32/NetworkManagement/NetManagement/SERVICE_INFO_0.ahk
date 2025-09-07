#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVICE_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    svci0_name{
        get {
            if(!this.HasProp("__svci0_name"))
                this.__svci0_name := PWSTR(this.ptr + 0)
            return this.__svci0_name
        }
    }
}
