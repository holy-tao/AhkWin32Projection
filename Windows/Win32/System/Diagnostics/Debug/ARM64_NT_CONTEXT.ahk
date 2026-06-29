#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ARM64_NT_NEON128.ahk" { ARM64_NT_NEON128 }

/**
 * Contains processor-specific register data. The system uses CONTEXT structures to perform various internal operations.C
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-arm64_nt_context
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X86, X64
 */
export default struct ARM64_NT_CONTEXT {
    #StructPack 8

    ContextFlags : UInt32

    Cpsr : UInt32

    X0 : Int64

    X1 : Int64

    X2 : Int64

    X3 : Int64

    X4 : Int64

    X5 : Int64

    X6 : Int64

    X7 : Int64

    X8 : Int64

    X9 : Int64

    X10 : Int64

    X11 : Int64

    X12 : Int64

    X13 : Int64

    X14 : Int64

    X15 : Int64

    X16 : Int64

    X17 : Int64

    X18 : Int64

    X19 : Int64

    X20 : Int64

    X21 : Int64

    X22 : Int64

    X23 : Int64

    X24 : Int64

    X25 : Int64

    X26 : Int64

    X27 : Int64

    X28 : Int64

    Fp : Int64

    Lr : Int64

    Sp : Int64

    Pc : Int64

    V : ARM64_NT_NEON128[32]

    Fpcr : UInt32

    Fpsr : UInt32

    Bcr : UInt32[8]

    Bvr : Int64[8]

    Wcr : UInt32[2]

    Wvr : Int64[2]

    static __New() {
        DefineProp(this.Prototype, 'X', { type: Int64[31], offset: 8 })
        this.DeleteProp("__New")
    }
}
