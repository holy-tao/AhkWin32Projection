#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RUNTIME_REPORT_HEADER.ahk
#Include .\DRIVER_INFO_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class DRIVER_RUNTIME_REPORT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Flags_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - ReportOverflowed
         * - PartialReport
         * - IncludeBootDrivers
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ReportOverflowed {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        PartialReport {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        IncludeBootDrivers {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        AsUInt16 {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

    /**
     * @type {RUNTIME_REPORT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := RUNTIME_REPORT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    NumberOfDrivers {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {_Flags_e__Union}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags_e__Union(10, this)
            return this.__Flags
        }
    }

    /**
     * @type {Array<DRIVER_INFO_ENTRY>}
     */
    DriverEntries{
        get {
            if(!this.HasProp("__DriverEntriesProxyArray"))
                this.__DriverEntriesProxyArray := Win32FixedArray(this.ptr + 16, 1, DRIVER_INFO_ENTRY, "")
            return this.__DriverEntriesProxyArray
        }
    }
}
