#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class OPEN_REPARSE_LIST_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    OpenReparseListEntry{
        get {
            if(!this.HasProp("__OpenReparseListEntry"))
                this.__OpenReparseListEntry := LIST_ENTRY(0, this)
            return this.__OpenReparseListEntry
        }
    }

    /**
     * @type {Integer}
     */
    ReparseTag {
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
     * @type {Pointer<Guid>}
     */
    ReparseGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
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
