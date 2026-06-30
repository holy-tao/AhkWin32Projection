#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class OPEN_REPARSE_LIST_ENTRY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    OpenReparseListEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ReparseTag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    ReparseGuid {
        get {
            if(!this.HasProp("__ReparseGuid"))
                this.__ReparseGuid := Guid(16, this)
            return this.__ReparseGuid
        }
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    RemainingLength {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }
}
