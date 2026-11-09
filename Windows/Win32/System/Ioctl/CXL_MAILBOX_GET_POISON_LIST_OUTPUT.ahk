#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_MAILBOX_MEDIA_ERROR_RECORD.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_POISON_LIST_OUTPUT extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    class _PoisonListFlags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - MoreMediaErrorRecords
         * - PoisonListOverflow
         * - ScanMediaInProgress
         * - RestartAck
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
        MoreMediaErrorRecords {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PoisonListOverflow {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        ScanMediaInProgress {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        RestartAck {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    }

    /**
     * @type {_PoisonListFlags}
     */
    PoisonListFlags {
        get {
            if(!this.HasProp("__PoisonListFlags"))
                this.__PoisonListFlags := CXL_MAILBOX_GET_POISON_LIST_OUTPUT._PoisonListFlags(0, this)
            return this.__PoisonListFlags
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    OverflowTimestamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MediaErrorRecordCount {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 18, 20, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {CXL_MAILBOX_MEDIA_ERROR_RECORD}
     */
    MediaErrorRecords {
        get {
            if(!this.HasProp("__MediaErrorRecordsProxyArray"))
                this.__MediaErrorRecordsProxyArray := Win32FixedArray(this.ptr + 40, 1, CXL_MAILBOX_MEDIA_ERROR_RECORD, "")
            return this.__MediaErrorRecordsProxyArray
        }
    }
}
