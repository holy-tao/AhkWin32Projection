#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE.ahk
#Include .\DEVICE_INTERNAL_STATUS_DATA_SET.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class GET_DEVICE_INTERNAL_STATUS_DATA_REQUEST extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE}
     */
    RequestDataType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {DEVICE_INTERNAL_STATUS_DATA_SET}
     */
    RequestDataSet {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
