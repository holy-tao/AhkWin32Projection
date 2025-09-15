#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BM_REQUEST_TYPE.ahk
#Include .\USB_DEFAULT_PIPE_SETUP_PACKET.ahk
#Include .\ALTERNATE_INTERFACE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_NOTIFICATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 6

    /**
     * @type {Integer}
     */
    Event {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BusSpeed {
        get => NumGet(this, 6, "int")
        set => NumPut("int", value, this, 6)
    }

    /**
     * @type {USB_DEFAULT_PIPE_SETUP_PACKET}
     */
    SetupPacket{
        get {
            if(!this.HasProp("__SetupPacket"))
                this.__SetupPacket := USB_DEFAULT_PIPE_SETUP_PACKET(this.ptr + 6)
            return this.__SetupPacket
        }
    }

    /**
     * @type {Integer}
     */
    ConfigurationValue {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    PortType {
        get => NumGet(this, 6, "int")
        set => NumPut("int", value, this, 6)
    }

    /**
     * @type {ALTERNATE_INTERFACE}
     */
    AlternateInterface{
        get {
            if(!this.HasProp("__AlternateInterface"))
                this.__AlternateInterface := ALTERNATE_INTERFACE(this.ptr + 6)
            return this.__AlternateInterface
        }
    }
}
