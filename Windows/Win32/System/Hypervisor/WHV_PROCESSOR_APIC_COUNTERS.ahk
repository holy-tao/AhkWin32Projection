#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_APIC_COUNTERS {
    #StructPack 8

    MmioAccessCount : Int64

    EoiAccessCount : Int64

    TprAccessCount : Int64

    SentIpiCount : Int64

    SelfIpiCount : Int64

}
