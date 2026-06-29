#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_CAPABILITY {
    #StructPack 8

    Length : UInt32

    Version : UInt32

    NoOfPMKIDs : UInt32

    NoOfAuthEncryptPairsSupported : UInt32

    AuthenticationEncryptionSupported : IntPtr[1]

}
