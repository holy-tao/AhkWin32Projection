#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_STANDARD_LINK_INFORMATION extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfAccessibleLinks {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TotalNumberOfLinks {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    DeletePending {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    Directory {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
