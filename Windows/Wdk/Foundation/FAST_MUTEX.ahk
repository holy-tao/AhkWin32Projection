#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_MUTEX {
    #StructPack 8

    Count : Int32

    Owner : IntPtr

    Contention : UInt32

    Event : IntPtr

    OldIrql : UInt32

}
