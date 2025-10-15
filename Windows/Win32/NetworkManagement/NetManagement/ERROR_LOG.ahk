#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class ERROR_LOG extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    el_len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    el_reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    el_time {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    el_error {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {PWSTR}
     */
    el_name{
        get {
            if(!this.HasProp("__el_name"))
                this.__el_name := PWSTR(this.ptr + 16)
            return this.__el_name
        }
    }

    /**
     * @type {PWSTR}
     */
    el_text{
        get {
            if(!this.HasProp("__el_text"))
                this.__el_text := PWSTR(this.ptr + 24)
            return this.__el_text
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    el_data {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    el_data_size {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    el_nstrings {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
