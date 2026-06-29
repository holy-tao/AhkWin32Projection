#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_RECEIVE_HASH_PARAMETERS {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    HashInformation : UInt32

    HashSecretKeySize : UInt16

    HashSecretKeyOffset : UInt32

}
