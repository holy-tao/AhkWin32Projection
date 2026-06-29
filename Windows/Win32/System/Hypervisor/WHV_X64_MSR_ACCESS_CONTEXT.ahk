#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_MSR_ACCESS_INFO.ahk" { WHV_X64_MSR_ACCESS_INFO }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_MSR_ACCESS_CONTEXT {
    #StructPack 8

    AccessInfo : WHV_X64_MSR_ACCESS_INFO

    MsrNumber : UInt32

    Rax : Int64

    Rdx : Int64

}
