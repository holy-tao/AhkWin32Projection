#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class OPEN_REPARSE_LIST extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    OpenReparseList {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
