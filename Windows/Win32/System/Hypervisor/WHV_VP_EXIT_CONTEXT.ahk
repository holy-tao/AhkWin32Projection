#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_VP_EXECUTION_STATE.ahk" { WHV_X64_VP_EXECUTION_STATE }
#Import ".\WHV_X64_SEGMENT_REGISTER.ahk" { WHV_X64_SEGMENT_REGISTER }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VP_EXIT_CONTEXT {
    #StructPack 8

    ExecutionState : WHV_X64_VP_EXECUTION_STATE

    /**
     * This bitfield backs the following members:
     * - InstructionLength
     * - Cr8
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    InstructionLength {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Cr8 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    Reserved : Int8

    Reserved2 : UInt32

    Cs : WHV_X64_SEGMENT_REGISTER

    Rip : Int64

    Rflags : Int64

}
