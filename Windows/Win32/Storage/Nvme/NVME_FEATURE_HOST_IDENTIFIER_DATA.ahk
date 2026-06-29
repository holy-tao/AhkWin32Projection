#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_FEATURE_HOST_IDENTIFIER_DATA {
    #StructPack 1

    HOSTID : Int8[16]

}
