#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CXL_COMMON_EVENT_RECORD.ahk
#Include .\CXL_COMMON_EVENT_RECORD_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_EVENT_RECORDS_OUTPUT extends Win32Struct {
    static sizeof => 168

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Overflow
         * - MoreEventRecords
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
        Overflow {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        MoreEventRecords {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := CXL_MAILBOX_GET_EVENT_RECORDS_OUTPUT._Flags(0, this)
            return this.__Flags
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
    OverflowErrorCount {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    FirstOverflowEventTimestamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LastOverflowEventTimestamp {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    EventRecordCount {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 26, 10, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {CXL_COMMON_EVENT_RECORD}
     */
    EventRecords {
        get {
            if(!this.HasProp("__EventRecordsProxyArray"))
                this.__EventRecordsProxyArray := Win32FixedArray(this.ptr + 40, 1, CXL_COMMON_EVENT_RECORD, "")
            return this.__EventRecordsProxyArray
        }
    }
}
