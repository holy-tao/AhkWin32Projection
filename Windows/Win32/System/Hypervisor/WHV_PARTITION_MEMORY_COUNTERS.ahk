#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PARTITION_MEMORY_COUNTERS {
    #StructPack 8

    Mapped4KPageCount : Int64

    Mapped2MPageCount : Int64

    Mapped1GPageCount : Int64

}
