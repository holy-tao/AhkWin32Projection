#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_CONNECTION_SUPERSPEEDPLUS_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED}
     */
    RxSuperSpeedPlus{
        get {
            if(!this.HasProp("__RxSuperSpeedPlus"))
                this.__RxSuperSpeedPlus := USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED(8, this)
            return this.__RxSuperSpeedPlus
        }
    }

    /**
     * @type {Integer}
     */
    RxLaneCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED}
     */
    TxSuperSpeedPlus{
        get {
            if(!this.HasProp("__TxSuperSpeedPlus"))
                this.__TxSuperSpeedPlus := USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED(20, this)
            return this.__TxSuperSpeedPlus
        }
    }

    /**
     * @type {Integer}
     */
    TxLaneCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
