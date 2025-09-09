#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_TOPOLOGY_ADDRESS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PciBusNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PciDeviceNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PciFunctionNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    RootHubPortNumber {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Array<UInt16>}
     */
    HubPortNumber{
        get {
            if(!this.HasProp("__HubPortNumberProxyArray"))
                this.__HubPortNumberProxyArray := Win32FixedArray(this.ptr + 18, 5, Primitive, "ushort")
            return this.__HubPortNumberProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }
}
