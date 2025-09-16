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
    static sizeof => 96

    static packingSize => 8

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
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    HubIsSelfPowered {
        get => NumGet(this, 78, "char")
        set => NumPut("char", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    HubIsRootHub {
        get => NumGet(this, 79, "char")
        set => NumPut("char", value, this, 79)
    }

    /**
     * @type {Integer}
     */
    HubCapabilities {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    NumberOfHubPorts {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Array<USB_HUB_PORT_INFORMATION>}
     */
    PortInfo{
        get {
            if(!this.HasProp("__PortInfoProxyArray"))
                this.__PortInfoProxyArray := Win32FixedArray(this.ptr + 88, 1, USB_HUB_PORT_INFORMATION, "")
            return this.__PortInfoProxyArray
        }
    }
}
