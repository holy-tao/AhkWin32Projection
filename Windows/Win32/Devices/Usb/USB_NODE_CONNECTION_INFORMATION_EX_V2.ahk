#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_PROTOCOLS.ahk
#Include .\USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_CONNECTION_INFORMATION_EX_V2 extends Win32Struct
{
    static sizeof => 24

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
     * @type {USB_PROTOCOLS}
     */
    SupportedUsbProtocols{
        get {
            if(!this.HasProp("__SupportedUsbProtocols"))
                this.__SupportedUsbProtocols := USB_PROTOCOLS(8, this)
            return this.__SupportedUsbProtocols
        }
    }

    /**
     * @type {USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := USB_NODE_CONNECTION_INFORMATION_EX_V2_FLAGS(16, this)
            return this.__Flags
        }
    }
}
