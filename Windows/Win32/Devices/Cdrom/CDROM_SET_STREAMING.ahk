#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_SET_STREAMING extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    RequestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ReadSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ReadTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    WriteSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    WriteTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StartLba {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    EndLba {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RotationControl {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {BOOLEAN}
     */
    RestoreDefaults{
        get {
            if(!this.HasProp("__RestoreDefaults"))
                this.__RestoreDefaults := BOOLEAN(this.ptr + 32)
            return this.__RestoreDefaults
        }
    }

    /**
     * @type {BOOLEAN}
     */
    SetExact{
        get {
            if(!this.HasProp("__SetExact"))
                this.__SetExact := BOOLEAN(this.ptr + 33)
            return this.__SetExact
        }
    }

    /**
     * @type {BOOLEAN}
     */
    RandomAccess{
        get {
            if(!this.HasProp("__RandomAccess"))
                this.__RandomAccess := BOOLEAN(this.ptr + 34)
            return this.__RandomAccess
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Persistent{
        get {
            if(!this.HasProp("__Persistent"))
                this.__Persistent := BOOLEAN(this.ptr + 35)
            return this.__Persistent
        }
    }
}
