#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_TEST {
    #StructPack 8

    Length : UInt32

    Type : UInt32

    AuthenticationEvent : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'RssiTrigger', { type: Int32, offset: 8 })
        this.DeleteProp("__New")
    }
}
