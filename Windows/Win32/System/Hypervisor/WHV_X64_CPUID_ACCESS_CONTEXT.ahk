#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_CPUID_ACCESS_CONTEXT {
    #StructPack 8

    Rax : Int64

    Rcx : Int64

    Rdx : Int64

    Rbx : Int64

    DefaultResultRax : Int64

    DefaultResultRcx : Int64

    DefaultResultRdx : Int64

    DefaultResultRbx : Int64

}
