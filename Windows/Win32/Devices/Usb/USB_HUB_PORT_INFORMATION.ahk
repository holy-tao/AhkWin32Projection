#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_STATE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_PORT_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {USB_DEVICE_STATE}
     */
    DeviceState{
        get {
            if(!this.HasProp("__DeviceState"))
                this.__DeviceState := USB_DEVICE_STATE(0, this)
            return this.__DeviceState
        }
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ConnectionStatus {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
