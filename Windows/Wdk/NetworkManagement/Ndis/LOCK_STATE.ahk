#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct LOCK_STATE {
    #StructPack 2

    LockState : UInt16

    OldIrql : Int8

}
