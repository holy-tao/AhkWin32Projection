#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RUNTIME_REPORT_HEADER.ahk" { RUNTIME_REPORT_HEADER }
#Import ".\DRIVER_INFO_ENTRY.ahk" { DRIVER_INFO_ENTRY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct DRIVER_RUNTIME_REPORT {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - ReportOverflowed
         * - PartialReport
         * - IncludeBootDrivers
         * - Reserved
         */
        _bitfield : Int16


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
        static __New() {
            DefineProp(this.Prototype, 'AsUInt16', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Header : RUNTIME_REPORT_HEADER

    NumberOfDrivers : UInt16

    Flags : DRIVER_RUNTIME_REPORT._Flags

    DriverEntries : DRIVER_INFO_ENTRY[1]

}
