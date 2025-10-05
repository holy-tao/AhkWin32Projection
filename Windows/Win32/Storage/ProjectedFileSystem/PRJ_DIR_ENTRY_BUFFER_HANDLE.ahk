#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_DIR_ENTRY_BUFFER_HANDLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
