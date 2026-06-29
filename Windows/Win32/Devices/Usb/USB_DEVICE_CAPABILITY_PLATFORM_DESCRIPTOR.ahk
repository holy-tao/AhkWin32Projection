#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_DEVICE_CAPABILITY_PLATFORM_DESCRIPTOR extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    bLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bDescriptorType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bDevCapabilityType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Guid}
     */
    PlatformCapabilityUuid {
        get {
            if(!this.HasProp("__PlatformCapabilityUuid"))
                this.__PlatformCapabilityUuid := Guid(4, this)
            return this.__PlatformCapabilityUuid
        }
    }

    /**
     * @type {Array<Integer>}
     */
    CapabililityData {
        get {
            if(!this.HasProp("__CapabililityDataProxyArray"))
                this.__CapabililityDataProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__CapabililityDataProxyArray
        }
    }
}
