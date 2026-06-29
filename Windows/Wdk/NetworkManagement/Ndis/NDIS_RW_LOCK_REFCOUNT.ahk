#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_RW_LOCK_REFCOUNT {
    #StructPack 4

    RefCount : UInt32

    static __New() {
        DefineProp(this.Prototype, 'cacheLine', { type: Int8[16], offset: 0 })
        this.DeleteProp("__New")
    }
}
