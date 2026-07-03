#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONTEXT_FLAGS.ahk" { CONTEXT_FLAGS }
#Import ".\M128A.ahk" { M128A }
#Import ".\XSAVE_FORMAT.ahk" { XSAVE_FORMAT }

/**
 * Contains processor-specific register data. The system uses CONTEXT structures to perform various internal operations. (CONTEXT)
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-context
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64
 */
export default struct CONTEXT {
    #StructPack 8

    P1Home : Int64

    P2Home : Int64

    P3Home : Int64

    P4Home : Int64

    P5Home : Int64

    P6Home : Int64

    ContextFlags : CONTEXT_FLAGS

    MxCsr : UInt32

    SegCs : UInt16

    SegDs : UInt16

    SegEs : UInt16

    SegFs : UInt16

    SegGs : UInt16

    SegSs : UInt16

    EFlags : UInt32

    Dr0 : Int64

    Dr1 : Int64

    Dr2 : Int64

    Dr3 : Int64

    Dr6 : Int64

    Dr7 : Int64

    Rax : Int64

    Rcx : Int64

    Rdx : Int64

    Rbx : Int64

    Rsp : Int64

    Rbp : Int64

    Rsi : Int64

    Rdi : Int64

    R8 : Int64

    R9 : Int64

    R10 : Int64

    R11 : Int64

    R12 : Int64

    R13 : Int64

    R14 : Int64

    R15 : Int64

    Rip : Int64

    FltSave : XSAVE_FORMAT

    VectorRegister : M128A[26]

    VectorControl : Int64

    DebugControl : Int64

    LastBranchToRip : Int64

    LastBranchFromRip : Int64

    LastExceptionToRip : Int64

    LastExceptionFromRip : Int64

    static __New() {
        DefineProp(this.Prototype, 'Header', { type: M128A[2], offset: 256 })
        DefineProp(this.Prototype, 'Legacy', { type: M128A[8], offset: 288 })
        DefineProp(this.Prototype, 'Xmm0', { type: M128A, offset: 416 })
        DefineProp(this.Prototype, 'Xmm1', { type: M128A, offset: 432 })
        DefineProp(this.Prototype, 'Xmm2', { type: M128A, offset: 448 })
        DefineProp(this.Prototype, 'Xmm3', { type: M128A, offset: 464 })
        DefineProp(this.Prototype, 'Xmm4', { type: M128A, offset: 480 })
        DefineProp(this.Prototype, 'Xmm5', { type: M128A, offset: 496 })
        DefineProp(this.Prototype, 'Xmm6', { type: M128A, offset: 512 })
        DefineProp(this.Prototype, 'Xmm7', { type: M128A, offset: 528 })
        DefineProp(this.Prototype, 'Xmm8', { type: M128A, offset: 544 })
        DefineProp(this.Prototype, 'Xmm9', { type: M128A, offset: 560 })
        DefineProp(this.Prototype, 'Xmm10', { type: M128A, offset: 576 })
        DefineProp(this.Prototype, 'Xmm11', { type: M128A, offset: 592 })
        DefineProp(this.Prototype, 'Xmm12', { type: M128A, offset: 608 })
        DefineProp(this.Prototype, 'Xmm13', { type: M128A, offset: 624 })
        DefineProp(this.Prototype, 'Xmm14', { type: M128A, offset: 640 })
        DefineProp(this.Prototype, 'Xmm15', { type: M128A, offset: 656 })
        this.DeleteProp("__New")
    }
}
