#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVICE_OBJECT.ahk
#Include ..\..\Foundation\FILE_OBJECT.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FS_FILTER_CALLBACK_DATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfFsFilterCallbackData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    DeviceObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    FileObject {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    Parameters {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
