#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ACTIVE_NAMESPACE_ID_LIST {
    #StructPack 4

    NSID : UInt32[1024]

}
