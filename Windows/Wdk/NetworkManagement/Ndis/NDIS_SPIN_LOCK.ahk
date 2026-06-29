#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_SPIN_LOCK {
    #StructPack 8

    SpinLock : IntPtr

    OldIrql : Int8

}
