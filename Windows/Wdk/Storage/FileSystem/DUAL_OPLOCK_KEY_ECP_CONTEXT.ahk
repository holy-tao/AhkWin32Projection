#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class DUAL_OPLOCK_KEY_ECP_CONTEXT extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ParentOplockKey {
        get {
            if(!this.HasProp("__ParentOplockKey"))
                this.__ParentOplockKey := Guid(0, this)
            return this.__ParentOplockKey
        }
    }

    /**
     * @type {Guid}
     */
    TargetOplockKey {
        get {
            if(!this.HasProp("__TargetOplockKey"))
                this.__TargetOplockKey := Guid(16, this)
            return this.__TargetOplockKey
        }
    }

    /**
     * @type {BOOLEAN}
     */
    ParentOplockKeySet {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {BOOLEAN}
     */
    TargetOplockKeySet {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }
}
