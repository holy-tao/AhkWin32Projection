#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct HIBERFILE_BUCKET {
    #StructPack 8

    MaxPhysicalMemory : Int64

    PhysicalMemoryPercent : UInt32[3]

}
