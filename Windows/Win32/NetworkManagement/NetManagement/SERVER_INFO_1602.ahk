#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1602 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    sv_1598_disablestrictnamechecking{
        get {
            if(!this.HasProp("__sv_1598_disablestrictnamechecking"))
                this.__sv_1598_disablestrictnamechecking := BOOL(this.ptr + 0)
            return this.__sv_1598_disablestrictnamechecking
        }
    }
}
