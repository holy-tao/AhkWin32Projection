#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_RESERVATION_RELEASE_DATA_STRUCTURE {
    #StructPack 8

    CRKEY : Int64

}
