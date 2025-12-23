#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
         * - SublinkSpeedAttrCount
         * - SublinkSpeedIDCount
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
        SublinkSpeedAttrCount {
            get => (this._bitfield >> 0) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
        }
    
        /**
         * @type {Integer}
         */
        SublinkSpeedIDCount {
            get => (this._bitfield >> 5) & 0xF
            set => this._bitfield := ((value & 0xF) << 5) | (this._bitfield & ~(0xF << 5))
        }
    
    }

    class _wFunctionalitySupport_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {Integer}
         */
        AsUshort {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - SublinkSpeedAttrID
         * - Reserved
         * - MinRxLaneCount
         * - MinTxLaneCount
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SublinkSpeedAttrID {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        MinRxLaneCount {
            get => (this._bitfield >> 8) & 0xF
            set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
        }
    
        /**
         * @type {Integer}
         */
        MinTxLaneCount {
            get => (this._bitfield >> 12) & 0xF
            set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
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
    bReserved {
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

    /**
     * @type {_wFunctionalitySupport_e__Union}
     */
    wFunctionalitySupport{
        get {
            if(!this.HasProp("__wFunctionalitySupport"))
                this.__wFunctionalitySupport := %this.__Class%._wFunctionalitySupport_e__Union(8, this)
            return this.__wFunctionalitySupport
        }
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Array<USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED>}
     */
    bmSublinkSpeedAttr{
        get {
            if(!this.HasProp("__bmSublinkSpeedAttrProxyArray"))
                this.__bmSublinkSpeedAttrProxyArray := Win32FixedArray(this.ptr + 16, 1, USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED, "")
            return this.__bmSublinkSpeedAttrProxyArray
        }
    }
}
