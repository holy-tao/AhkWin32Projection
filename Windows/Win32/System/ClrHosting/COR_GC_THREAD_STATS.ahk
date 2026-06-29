#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct COR_GC_THREAD_STATS {
    #StructPack 8

    PerThreadAllocation : Int64

    Flags : UInt32

}
