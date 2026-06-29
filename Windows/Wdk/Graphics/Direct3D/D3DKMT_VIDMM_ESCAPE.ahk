#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\NTSTATUS.ahk
#Include .\D3DKMT_VIDMMESCAPETYPE.ahk
#Include .\D3DKMT_VAD_ESCAPE_COMMAND.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk
#Include .\D3DKMT_DEFRAG_ESCAPE_OPERATION.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VIDMM_ESCAPE extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {D3DKMT_VIDMMESCAPETYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _SetFault extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

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
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

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

        /**
         * @type {Integer}
         */
        Value {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    class _Evict extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ResourceHandle {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        AllocationHandle {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }

        /**
         * @type {HANDLE}
         */
        hProcess {
            get {
                if(!this.HasProp("__hProcess"))
                    this.__hProcess := HANDLE(8, this)
                return this.__hProcess
            }
        }
    }

    class _EvictByNtHandle extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        NtHandle {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    class _GetVads extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        class _GetNumVads extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            NumVads {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        /**
         * @type {_GetNumVads}
         */
        GetNumVads {
            get {
                if(!this.HasProp("__GetNumVads"))
                    this.__GetNumVads := D3DKMT_VIDMM_ESCAPE._GetVads._GetNumVads(0, this)
                return this.__GetNumVads
            }
        }

        /**
         * @type {Pointer}
         */
        GetVad {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        GetVadRange {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        GetGpuMmuCaps {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        GetPte {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        GetSegmentCaps {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {D3DKMT_VAD_ESCAPE_COMMAND}
         */
        Command {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }

        /**
         * @type {NTSTATUS}
         */
        Status {
            get => NumGet(this, 12, "int")
            set => NumPut("int", value, this, 12)
        }
    }

    class _SetBudget extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        LocalMemoryBudget {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SystemMemoryBudget {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    }

    class _SuspendProcess extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        hProcess {
            get {
                if(!this.HasProp("__hProcess"))
                    this.__hProcess := HANDLE(0, this)
                return this.__hProcess
            }
        }

        /**
         * @type {BOOL}
         */
        bAllowWakeOnSubmission {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    }

    class _ResumeProcess extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        hProcess {
            get {
                if(!this.HasProp("__hProcess"))
                    this.__hProcess := HANDLE(0, this)
                return this.__hProcess
            }
        }
    }

    class _GetBudget extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        NumBytesToTrim {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    class _SetTrimIntervals extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        MinTrimInterval {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        MaxTrimInterval {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }

        /**
         * @type {Integer}
         */
        IdleTrimInterval {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    }

    class _Wake extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {BOOL}
         */
        bFlush {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    }

    class _Defrag extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {D3DKMT_DEFRAG_ESCAPE_OPERATION}
         */
        Operation {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SegmentId {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }

        /**
         * @type {Integer}
         */
        TotalCommitted {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        TotalFree {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }

        /**
         * @type {Integer}
         */
        LargestGapBefore {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }

        /**
         * @type {Integer}
         */
        LargestGapAfter {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    }

    class _DelayExecution extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        hPagingQueue {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        PhysicalAdapterIndex {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }

        /**
         * @type {Integer}
         */
        Milliseconds {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        PagingFenceValue {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    }

    class _VerifyIntegrity extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        SegmentId {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    class _DelayedEvictionConfig extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        TimerValue {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    }

    /**
     * @type {_SetFault}
     */
    SetFault {
        get {
            if(!this.HasProp("__SetFault"))
                this.__SetFault := D3DKMT_VIDMM_ESCAPE._SetFault(8, this)
            return this.__SetFault
        }
    }

    /**
     * @type {_Evict}
     */
    Evict {
        get {
            if(!this.HasProp("__Evict"))
                this.__Evict := D3DKMT_VIDMM_ESCAPE._Evict(8, this)
            return this.__Evict
        }
    }

    /**
     * @type {_EvictByNtHandle}
     */
    EvictByNtHandle {
        get {
            if(!this.HasProp("__EvictByNtHandle"))
                this.__EvictByNtHandle := D3DKMT_VIDMM_ESCAPE._EvictByNtHandle(8, this)
            return this.__EvictByNtHandle
        }
    }

    /**
     * @type {_GetVads}
     */
    GetVads {
        get {
            if(!this.HasProp("__GetVads"))
                this.__GetVads := D3DKMT_VIDMM_ESCAPE._GetVads(8, this)
            return this.__GetVads
        }
    }

    /**
     * @type {_SetBudget}
     */
    SetBudget {
        get {
            if(!this.HasProp("__SetBudget"))
                this.__SetBudget := D3DKMT_VIDMM_ESCAPE._SetBudget(8, this)
            return this.__SetBudget
        }
    }

    /**
     * @type {_SuspendProcess}
     */
    SuspendProcess {
        get {
            if(!this.HasProp("__SuspendProcess"))
                this.__SuspendProcess := D3DKMT_VIDMM_ESCAPE._SuspendProcess(8, this)
            return this.__SuspendProcess
        }
    }

    /**
     * @type {_ResumeProcess}
     */
    ResumeProcess {
        get {
            if(!this.HasProp("__ResumeProcess"))
                this.__ResumeProcess := D3DKMT_VIDMM_ESCAPE._ResumeProcess(8, this)
            return this.__ResumeProcess
        }
    }

    /**
     * @type {_GetBudget}
     */
    GetBudget {
        get {
            if(!this.HasProp("__GetBudget"))
                this.__GetBudget := D3DKMT_VIDMM_ESCAPE._GetBudget(8, this)
            return this.__GetBudget
        }
    }

    /**
     * @type {_SetTrimIntervals}
     */
    SetTrimIntervals {
        get {
            if(!this.HasProp("__SetTrimIntervals"))
                this.__SetTrimIntervals := D3DKMT_VIDMM_ESCAPE._SetTrimIntervals(8, this)
            return this.__SetTrimIntervals
        }
    }

    /**
     * @type {Pointer}
     */
    EvictByCriteria {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_Wake}
     */
    Wake {
        get {
            if(!this.HasProp("__Wake"))
                this.__Wake := D3DKMT_VIDMM_ESCAPE._Wake(8, this)
            return this.__Wake
        }
    }

    /**
     * @type {_Defrag}
     */
    Defrag {
        get {
            if(!this.HasProp("__Defrag"))
                this.__Defrag := D3DKMT_VIDMM_ESCAPE._Defrag(8, this)
            return this.__Defrag
        }
    }

    /**
     * @type {_DelayExecution}
     */
    DelayExecution {
        get {
            if(!this.HasProp("__DelayExecution"))
                this.__DelayExecution := D3DKMT_VIDMM_ESCAPE._DelayExecution(8, this)
            return this.__DelayExecution
        }
    }

    /**
     * @type {_VerifyIntegrity}
     */
    VerifyIntegrity {
        get {
            if(!this.HasProp("__VerifyIntegrity"))
                this.__VerifyIntegrity := D3DKMT_VIDMM_ESCAPE._VerifyIntegrity(8, this)
            return this.__VerifyIntegrity
        }
    }

    /**
     * @type {_DelayedEvictionConfig}
     */
    DelayedEvictionConfig {
        get {
            if(!this.HasProp("__DelayedEvictionConfig"))
                this.__DelayedEvictionConfig := D3DKMT_VIDMM_ESCAPE._DelayedEvictionConfig(8, this)
            return this.__DelayedEvictionConfig
        }
    }
}
