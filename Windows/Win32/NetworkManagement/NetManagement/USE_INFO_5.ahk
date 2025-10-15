#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\USE_INFO_2.ahk
#Include .\USE_INFO_3.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USE_INFO_5 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {USE_INFO_3}
     */
    ui4_ui3{
        get {
            if(!this.HasProp("__ui4_ui3"))
                this.__ui4_ui3 := USE_INFO_3(this.ptr + 0)
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

    /**
     * @type {Integer}
     */
    ui5_security_descriptor_length {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Byte>}
     */
    ui5_security_descriptor {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ui5_use_options_length {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Pointer<Byte>}
     */
    ui5_use_options {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
