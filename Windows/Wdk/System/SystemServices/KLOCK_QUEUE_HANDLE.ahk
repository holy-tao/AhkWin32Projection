#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KLOCK_QUEUE_HANDLE {
    #StructPack 8

    LockQueue : IntPtr

    OldIrql : Int8

}
