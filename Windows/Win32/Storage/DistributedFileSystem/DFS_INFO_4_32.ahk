#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @architecture X64, Arm64
 */
class DFS_INFO_4_32 extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    EntryPath {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Comment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(16, this)
            return this.__Guid
        }
    }

    /**
     * @type {Integer}
     */
    NumberOfStorages {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Storage {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
