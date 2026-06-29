#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class OPLOCK_KEY_CONTEXT extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Guid}
     */
    ParentOplockKey {
        get {
            if(!this.HasProp("__ParentOplockKey"))
                this.__ParentOplockKey := Guid(4, this)
            return this.__ParentOplockKey
        }
    }

    /**
     * @type {Guid}
     */
    TargetOplockKey {
        get {
            if(!this.HasProp("__TargetOplockKey"))
                this.__TargetOplockKey := Guid(20, this)
            return this.__TargetOplockKey
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
