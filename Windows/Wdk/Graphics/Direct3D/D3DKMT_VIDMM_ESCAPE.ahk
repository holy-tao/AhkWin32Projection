#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_VAD_ESCAPE_COMMAND.ahk" { D3DKMT_VAD_ESCAPE_COMMAND }
#Import ".\D3DKMT_DEFRAG_ESCAPE_OPERATION.ahk" { D3DKMT_DEFRAG_ESCAPE_OPERATION }
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DKMT_VIDMMESCAPETYPE.ahk" { D3DKMT_VIDMMESCAPETYPE }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VIDMM_ESCAPE {
    #StructPack 8


    struct _SetFault {
        /**
         * This bitfield backs the following members:
         * - ProbeAndLock
         * - SplitPoint
         * - NoDemotion
         * - SwizzlingAperture
         * - PagingPathLockSubRange
         * - PagingPathLockMinRange
         * - ComplexLock
         * - FailVARotation
         * - NoWriteCombined
         * - NoPrePatching
         * - AlwaysRepatch
         * - ExpectPreparationFailure
         * - FailUserModeVAMapping
         * - NeverDiscardOfferedAllocation
         * - AlwaysDiscardOfferedAllocation
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        ProbeAndLock {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        SplitPoint {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        NoDemotion {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        SwizzlingAperture {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        PagingPathLockSubRange {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        PagingPathLockMinRange {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }

        /**
         * @type {Integer}
         */
        ComplexLock {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }

        /**
         * @type {Integer}
         */
        FailVARotation {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }

        /**
         * @type {Integer}
         */
        NoWriteCombined {
            get => (this._bitfield >> 8) & 0x1
            set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
        }

        /**
         * @type {Integer}
         */
        NoPrePatching {
            get => (this._bitfield >> 9) & 0x1
            set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
        }

        /**
         * @type {Integer}
         */
        AlwaysRepatch {
            get => (this._bitfield >> 10) & 0x1
            set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
        }

        /**
         * @type {Integer}
         */
        ExpectPreparationFailure {
            get => (this._bitfield >> 11) & 0x1
            set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
        }

        /**
         * @type {Integer}
         */
        FailUserModeVAMapping {
            get => (this._bitfield >> 12) & 0x1
            set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
        }

        /**
         * @type {Integer}
         */
        NeverDiscardOfferedAllocation {
            get => (this._bitfield >> 13) & 0x1
            set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
        }

        /**
         * @type {Integer}
         */
        AlwaysDiscardOfferedAllocation {
            get => (this._bitfield >> 14) & 0x1
            set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
        }
        static __New() {
            DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Evict {
        ResourceHandle : UInt32

        AllocationHandle : UInt32

        hProcess : HANDLE

    }

    struct _EvictByNtHandle {
        NtHandle : Int64

    }

    struct _GetVads {

        struct _GetNumVads {
            NumVads : UInt32

        }

        GetNumVads : D3DKMT_VIDMM_ESCAPE._GetVads._GetNumVads

        Command : D3DKMT_VAD_ESCAPE_COMMAND

        Status : NTSTATUS

        static __New() {
            DefineProp(this.Prototype, 'GetVad', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'GetVadRange', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'GetGpuMmuCaps', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'GetPte', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'GetSegmentCaps', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _SetBudget {
        LocalMemoryBudget : Int64

        SystemMemoryBudget : Int64

    }

    struct _SuspendProcess {
        hProcess : HANDLE

        bAllowWakeOnSubmission : BOOL

    }

    struct _ResumeProcess {
        hProcess : HANDLE

    }

    struct _GetBudget {
        NumBytesToTrim : Int64

    }

    struct _SetTrimIntervals {
        MinTrimInterval : UInt32

        MaxTrimInterval : UInt32

        IdleTrimInterval : UInt32

    }

    struct _Wake {
        bFlush : BOOL

    }

    struct _Defrag {
        Operation : D3DKMT_DEFRAG_ESCAPE_OPERATION

        SegmentId : UInt32

        TotalCommitted : Int64

        TotalFree : Int64

        LargestGapBefore : Int64

        LargestGapAfter : Int64

    }

    struct _DelayExecution {
        hPagingQueue : UInt32

        PhysicalAdapterIndex : UInt32

        Milliseconds : UInt32

        PagingFenceValue : Int64

    }

    struct _VerifyIntegrity {
        SegmentId : UInt32

    }

    struct _DelayedEvictionConfig {
        TimerValue : Int64

    }

    Type : D3DKMT_VIDMMESCAPETYPE

    SetFault : D3DKMT_VIDMM_ESCAPE._SetFault

    static __New() {
        DefineProp(this.Prototype, 'Evict', { type: D3DKMT_VIDMM_ESCAPE._Evict, offset: 8 })
        DefineProp(this.Prototype, 'EvictByNtHandle', { type: D3DKMT_VIDMM_ESCAPE._EvictByNtHandle, offset: 8 })
        DefineProp(this.Prototype, 'GetVads', { type: D3DKMT_VIDMM_ESCAPE._GetVads, offset: 8 })
        DefineProp(this.Prototype, 'SetBudget', { type: D3DKMT_VIDMM_ESCAPE._SetBudget, offset: 8 })
        DefineProp(this.Prototype, 'SuspendProcess', { type: D3DKMT_VIDMM_ESCAPE._SuspendProcess, offset: 8 })
        DefineProp(this.Prototype, 'ResumeProcess', { type: D3DKMT_VIDMM_ESCAPE._ResumeProcess, offset: 8 })
        DefineProp(this.Prototype, 'GetBudget', { type: D3DKMT_VIDMM_ESCAPE._GetBudget, offset: 8 })
        DefineProp(this.Prototype, 'SetTrimIntervals', { type: D3DKMT_VIDMM_ESCAPE._SetTrimIntervals, offset: 8 })
        DefineProp(this.Prototype, 'EvictByCriteria', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'Wake', { type: D3DKMT_VIDMM_ESCAPE._Wake, offset: 8 })
        DefineProp(this.Prototype, 'Defrag', { type: D3DKMT_VIDMM_ESCAPE._Defrag, offset: 8 })
        DefineProp(this.Prototype, 'DelayExecution', { type: D3DKMT_VIDMM_ESCAPE._DelayExecution, offset: 8 })
        DefineProp(this.Prototype, 'VerifyIntegrity', { type: D3DKMT_VIDMM_ESCAPE._VerifyIntegrity, offset: 8 })
        DefineProp(this.Prototype, 'DelayedEvictionConfig', { type: D3DKMT_VIDMM_ESCAPE._DelayedEvictionConfig, offset: 8 })
        this.DeleteProp("__New")
    }
}
