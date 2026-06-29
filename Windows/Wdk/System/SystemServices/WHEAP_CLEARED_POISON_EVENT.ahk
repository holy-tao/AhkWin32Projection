#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_CLEARED_POISON_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    PhysicalAddress : Int64

}
