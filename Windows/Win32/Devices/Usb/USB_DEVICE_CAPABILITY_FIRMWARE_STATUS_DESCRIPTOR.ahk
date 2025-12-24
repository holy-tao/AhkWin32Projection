#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_CAPABILITY_FIRMWARE_STATUS_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    class _bmAttributes_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 1

        /**
         * @type {Integer}
         */
        AsUlong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - GetFirmwareImageHashSupport
         * - DisallowFirmwareUpdateSupport
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        GetFirmwareImageHashSupport {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        DisallowFirmwareUpdateSupport {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
    }

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
    bcdDescriptorVersion {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {_bmAttributes_e__Union}
     */
    bmAttributes{
        get {
            if(!this.HasProp("__bmAttributes"))
                this.__bmAttributes := %this.__Class%._bmAttributes_e__Union(4, this)
            return this.__bmAttributes
        }
    }
}
