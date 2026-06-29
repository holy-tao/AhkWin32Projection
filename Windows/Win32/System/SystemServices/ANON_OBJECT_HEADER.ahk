#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ANON_OBJECT_HEADER extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Sig1 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Sig2 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Machine {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    ClassID {
        get {
            if(!this.HasProp("__ClassID"))
                this.__ClassID := Guid(12, this)
            return this.__ClassID
        }
    }

    /**
     * @type {Integer}
     */
    SizeOfData {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
