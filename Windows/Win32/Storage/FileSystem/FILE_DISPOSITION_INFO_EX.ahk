#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_DISPOSITION_INFO_EX_FLAGS.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_DISPOSITION_INFO_EX extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {FILE_DISPOSITION_INFO_EX_FLAGS}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
