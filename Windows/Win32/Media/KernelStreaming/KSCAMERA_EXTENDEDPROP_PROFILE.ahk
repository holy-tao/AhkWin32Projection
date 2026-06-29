#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSCAMERA_EXTENDEDPROP_PROFILE extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ProfileId {
        get {
            if(!this.HasProp("__ProfileId"))
                this.__ProfileId := Guid(0, this)
            return this.__ProfileId
        }
    }

    /**
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
