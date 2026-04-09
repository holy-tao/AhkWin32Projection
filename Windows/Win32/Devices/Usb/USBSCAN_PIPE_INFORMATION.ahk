#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RAW_PIPE_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBSCAN_PIPE_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MaximumPacketSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EndpointAddress {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Interval {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {RAW_PIPE_TYPE}
     */
    PipeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
