#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USE_INFO_2.ahk
#Include .\USE_INFO_3.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USE_INFO_4 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {USE_INFO_3}
     */
    ui4_ui3{
        get {
            if(!this.HasProp("__ui4_ui3"))
                this.__ui4_ui3 := USE_INFO_3(0, this)
            return this.__ui4_ui3
        }
    }

    /**
     * @type {Integer}
     */
    ui4_auth_identity_length {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<Byte>}
     */
    ui4_auth_identity {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
