#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class COPYFILE2_CREATE_OPLOCK_KEYS extends Win32Struct {
    static sizeof => 32

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
}
