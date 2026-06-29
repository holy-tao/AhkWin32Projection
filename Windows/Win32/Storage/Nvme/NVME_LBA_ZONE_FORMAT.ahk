#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_LBA_ZONE_FORMAT {
    #StructPack 8

    ZoneSize : Int64

    ZDES : Int8

    Reserved : Int8[7]

}
