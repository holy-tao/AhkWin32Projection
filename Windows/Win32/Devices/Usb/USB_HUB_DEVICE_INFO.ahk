#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk
#Include .\USB_HUB_PORT_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_DEVICE_INFO extends Win32Struct
{
    static sizeof => 95

    static packingSize => 1

    /**
     * @type {USB_HUB_DESCRIPTOR}
     */
    HubDescriptor{
        get {
            if(!this.HasProp("__HubDescriptor"))
                this.__HubDescriptor := USB_HUB_DESCRIPTOR(this.ptr + 0)
            return this.__HubDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    HubNumber {
        get => NumGet(this, 71, "uint")
        set => NumPut("uint", value, this, 71)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 75, "ushort")
        set => NumPut("ushort", value, this, 75)
    }

    /**
     * @type {Integer}
     */
    HubIsSelfPowered {
        get => NumGet(this, 77, "char")
        set => NumPut("char", value, this, 77)
    }

    /**
     * @type {Integer}
     */
    HubIsRootHub {
        get => NumGet(this, 78, "char")
        set => NumPut("char", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    HubCapabilities {
        get => NumGet(this, 79, "uint")
        set => NumPut("uint", value, this, 79)
    }

    /**
     * @type {Integer}
     */
    NumberOfHubPorts {
        get => NumGet(this, 83, "uint")
        set => NumPut("uint", value, this, 83)
    }

    /**
     * @type {Array<USB_HUB_PORT_INFORMATION>}
     */
    PortInfo{
        get {
            if(!this.HasProp("__PortInfoProxyArray"))
                this.__PortInfoProxyArray := Win32FixedArray(this.ptr + 87, 8, USB_HUB_PORT_INFORMATION, "")
            return this.__PortInfoProxyArray
        }
    }
}
