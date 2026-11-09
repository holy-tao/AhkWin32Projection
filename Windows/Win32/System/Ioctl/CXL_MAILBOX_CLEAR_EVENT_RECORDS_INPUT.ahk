#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_CLEAR_EVENT_RECORDS_INPUT extends Win32Struct {
    static sizeof => 8

    static packingSize => 2

    class _ClearEventFlags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - ClearAllEvents
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
        ClearAllEvents {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    /**
     * @type {Integer}
     */
    EventLog {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {_ClearEventFlags}
     */
    ClearEventFlags {
        get {
            if(!this.HasProp("__ClearEventFlags"))
                this.__ClearEventFlags := CXL_MAILBOX_CLEAR_EVENT_RECORDS_INPUT._ClearEventFlags(1, this)
            return this.__ClearEventFlags
        }
    }

    /**
     * @type {Integer}
     */
    NumberOfEventRecordHandles {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 3, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    EventRecordHandles {
        get {
            if(!this.HasProp("__EventRecordHandlesProxyArray"))
                this.__EventRecordHandlesProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "ushort")
            return this.__EventRecordHandlesProxyArray
        }
    }
}
