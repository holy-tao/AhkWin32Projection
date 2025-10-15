#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_SIMPLE_OPC_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    RequestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    Exclude0{
        get {
            if(!this.HasProp("__Exclude0"))
                this.__Exclude0 := BOOLEAN(this.ptr + 4)
            return this.__Exclude0
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Exclude1{
        get {
            if(!this.HasProp("__Exclude1"))
                this.__Exclude1 := BOOLEAN(this.ptr + 5)
            return this.__Exclude1
        }
    }
}
