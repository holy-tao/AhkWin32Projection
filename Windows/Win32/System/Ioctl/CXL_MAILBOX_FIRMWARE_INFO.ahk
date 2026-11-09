#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_FIRMWARE_INFO extends Win32Struct {
    static sizeof => 80

    static packingSize => 2

    class _FWSlotInfo extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - ActiveFWSlotNumber
         * - StagedFWSlotNumber
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        ActiveFWSlotNumber {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }

        /**
         * @type {Integer}
         */
        StagedFWSlotNumber {
            get => (this._bitfield >> 3) & 0x7
            set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
        }
    }

    class _FWActivationCapabilities extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - OnlineFWActivation
         * - Reserved2
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        OnlineFWActivation {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Reserved2 {
            get => (this._bitfield >> 1) & 0x7F
            set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
        }
    }

    /**
     * @type {Integer}
     */
    FWSlotsSupported {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {_FWSlotInfo}
     */
    FWSlotInfo {
        get {
            if(!this.HasProp("__FWSlotInfo"))
                this.__FWSlotInfo := CXL_MAILBOX_FIRMWARE_INFO._FWSlotInfo(1, this)
            return this.__FWSlotInfo
        }
    }

    /**
     * @type {_FWActivationCapabilities}
     */
    FWActivationCapabilities {
        get {
            if(!this.HasProp("__FWActivationCapabilities"))
                this.__FWActivationCapabilities := CXL_MAILBOX_FIRMWARE_INFO._FWActivationCapabilities(2, this)
            return this.__FWActivationCapabilities
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved3 {
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 3, 13, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {String}
     */
    SlotFWRevisions {
        get => StrGet(this.ptr + 16, 63, "UTF-8")
        set => StrPut(value, this.ptr + 16, 63, "UTF-8")
    }
}
