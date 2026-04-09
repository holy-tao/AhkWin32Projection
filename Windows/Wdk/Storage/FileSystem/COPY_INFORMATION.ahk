#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILE_OBJECT.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class COPY_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    SourceFileObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SourceFileOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
