#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_HYPERCALL_CONTEXT {
    #StructPack 8

    Rax : Int64

    Rbx : Int64

    Rcx : Int64

    Rdx : Int64

    R8 : Int64

    Rsi : Int64

    Rdi : Int64

    Reserved0 : Int64

    XmmRegisters : WHV_UINT128[6]

    Reserved1 : Int64[2]

}
