#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

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
    bMaxBurst {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    class _Bulk extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - MaxStreams
         * - Reserved1
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaxStreams {
            get => (this._bitfield >> 0) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 5) & 0x7
            set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
        }
    
    }

    class _Isochronous extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Mult
         * - Reserved2
         * - SspCompanion
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Mult {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved2 {
            get => (this._bitfield >> 2) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 2) | (this._bitfield & ~(0x1F << 2))
        }
    
        /**
         * @type {Integer}
         */
        SspCompanion {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {_Bulk}
     */
    Bulk{
        get {
            if(!this.HasProp("__Bulk"))
                this.__Bulk := %this.__Class%._Bulk(this.ptr + 3)
            return this.__Bulk
        }
    }

    /**
     * @type {_Isochronous}
     */
    Isochronous{
        get {
            if(!this.HasProp("__Isochronous"))
                this.__Isochronous := %this.__Class%._Isochronous(this.ptr + 3)
            return this.__Isochronous
        }
    }

    /**
     * @type {Integer}
     */
    wBytesPerInterval {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
