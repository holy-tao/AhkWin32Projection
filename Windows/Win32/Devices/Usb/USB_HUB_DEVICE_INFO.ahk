#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\USB_HUB_CAPABILITIES.ahk
#Include .\USB_DEVICE_STATE.ahk
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
     * @type {BOOLEAN}
     */
    HubIsSelfPowered{
        get {
            if(!this.HasProp("__HubIsSelfPowered"))
                this.__HubIsSelfPowered := BOOLEAN(this.ptr + 78)
            return this.__HubIsSelfPowered
        }
    }

    /**
     * @type {BOOLEAN}
     */
    HubIsRootHub{
        get {
            if(!this.HasProp("__HubIsRootHub"))
                this.__HubIsRootHub := BOOLEAN(this.ptr + 79)
            return this.__HubIsRootHub
        }
    }

    /**
     * @type {USB_HUB_CAPABILITIES}
     */
    HubCapabilities{
        get {
            if(!this.HasProp("__HubCapabilities"))
                this.__HubCapabilities := USB_HUB_CAPABILITIES(this.ptr + 80)
            return this.__HubCapabilities
        }
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
