#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CHANGED_ZONE_LIST_LOG {
    #StructPack 8

    ZoneIdentifiersCount : UInt16

    Reserved : Int8[6]

    ZoneIdentifier : Int64[511]

}
