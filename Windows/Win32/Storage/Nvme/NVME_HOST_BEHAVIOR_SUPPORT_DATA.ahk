#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_HOST_BEHAVIOR_SUPPORT_DATA {
    #StructPack 1

    ACRE : Int8

    ETDAS : Int8

    LBAFEE : Int8

    Reserved : Int8[509]

}
