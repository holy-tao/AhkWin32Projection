#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_DEVICE_INTERFACE_DETAIL_DATA_W extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    DevicePath {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
