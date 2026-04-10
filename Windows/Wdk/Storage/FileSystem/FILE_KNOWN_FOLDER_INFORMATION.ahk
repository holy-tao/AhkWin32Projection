#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_KNOWN_FOLDER_TYPE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_KNOWN_FOLDER_INFORMATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {FILE_KNOWN_FOLDER_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
