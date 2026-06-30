#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSIDENTIFIER extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Guid}
     */
    Set {
        get {
            if(!this.HasProp("__Set"))
                this.__Set := Guid(0, this)
            return this.__Set
        }
    }

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
