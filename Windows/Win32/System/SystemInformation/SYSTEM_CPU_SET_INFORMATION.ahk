#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CPU_SET_INFORMATION_TYPE.ahk" { CPU_SET_INFORMATION_TYPE }

/**
 * This structure is returned by GetSystemCpuSetInformation. It is used to enumerate the CPU Sets on the system and determine their current state.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_cpu_set_information
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct SYSTEM_CPU_SET_INFORMATION {
    #StructPack 8


    struct _CpuSet {
        Id : UInt32

        Group : UInt16

        LogicalProcessorIndex : Int8

        CoreIndex : Int8

        LastLevelCacheIndex : Int8

        NumaNodeIndex : Int8

        EfficiencyClass : Int8

        AllFlags : Int8


        /**
         * @type {Integer}
         */
        Parked {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Allocated {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        AllocatedToTargetProcess {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        RealTime {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        ReservedFlags {
            get => (this._bitfield >> 4) & 0xF
            set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
        }
        Reserved : UInt32

        AllocationTag : Int64

        static __New() {
            DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 11 })
            DefineProp(this.Prototype, 'SchedulingClass', { type: Int8, offset: 12 })
            this.DeleteProp("__New")
        }
    }

    /**
     * This is the size, in bytes, of this information structure.
     */
    Size : UInt32

    /**
     * This is the type of information in the structure. Applications should skip any structures with unrecognized types.
     */
    Type : CPU_SET_INFORMATION_TYPE

    CpuSet : SYSTEM_CPU_SET_INFORMATION._CpuSet

}
