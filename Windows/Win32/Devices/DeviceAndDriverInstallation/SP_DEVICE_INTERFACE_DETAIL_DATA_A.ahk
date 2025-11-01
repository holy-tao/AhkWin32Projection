#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_device_interface_detail_data_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DEVICE_INTERFACE_DETAIL_DATA_A extends Win32Struct
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
        get => StrGet(this.ptr + 4, 0, "UTF-8")
        set => StrPut(value, this.ptr + 4, 0, "UTF-8")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
