#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_X64_REGISTER_STATE {
    #StructPack 8

    Rax : Int64

    Rbx : Int64

    Rcx : Int64

    Rdx : Int64

    Rsi : Int64

    Rdi : Int64

    Rbp : Int64

    Rsp : Int64

    R8 : Int64

    R9 : Int64

    R10 : Int64

    R11 : Int64

    R12 : Int64

    R13 : Int64

    R14 : Int64

    R15 : Int64

    Cs : UInt16

    Ds : UInt16

    Ss : UInt16

    Es : UInt16

    Fs : UInt16

    Gs : UInt16

    Reserved : UInt32

    Rflags : Int64

    Eip : Int64

    Cr0 : Int64

    Cr1 : Int64

    Cr2 : Int64

    Cr3 : Int64

    Cr4 : Int64

    Cr8 : Int64

    Gdtr : IntPtr

    Idtr : IntPtr

    Ldtr : UInt16

    Tr : UInt16

}
