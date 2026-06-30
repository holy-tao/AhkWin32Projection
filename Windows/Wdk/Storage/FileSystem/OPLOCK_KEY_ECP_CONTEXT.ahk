#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class OPLOCK_KEY_ECP_CONTEXT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    OplockKey {
        get {
            if(!this.HasProp("__OplockKey"))
                this.__OplockKey := Guid(0, this)
            return this.__OplockKey
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
