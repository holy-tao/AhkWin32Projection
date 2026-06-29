#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_FEATURE_HOST_METADATA_DATA {
    #StructPack 1

    NumberOfMetadataElementDescriptors : Int8

    Reserved0 : Int8

    MetadataElementDescriptors : Int8[4094]

}
