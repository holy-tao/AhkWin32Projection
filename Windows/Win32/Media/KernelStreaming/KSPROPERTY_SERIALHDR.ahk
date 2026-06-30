#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_SERIALHDR extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    PropertySet {
        get {
            if(!this.HasProp("__PropertySet"))
                this.__PropertySet := Guid(0, this)
            return this.__PropertySet
        }
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
