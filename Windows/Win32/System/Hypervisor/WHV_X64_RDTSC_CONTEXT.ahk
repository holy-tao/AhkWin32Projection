#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_RDTSC_INFO.ahk" { WHV_X64_RDTSC_INFO }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_RDTSC_CONTEXT {
    #StructPack 8

    TscAux : Int64

    VirtualOffset : Int64

    Tsc : Int64

    ReferenceTime : Int64

    RdtscInfo : WHV_X64_RDTSC_INFO

}
