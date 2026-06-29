#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSRTL_MUP_PROVIDER_INFO_LEVEL_2 {
    #StructPack 8

    ProviderId : UInt32

    ProviderName : IntPtr

}
