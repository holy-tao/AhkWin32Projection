#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NVCACHE_REQUEST_BLOCK {
    #StructPack 8

    NRBSize : UInt32

    Function : UInt16

    NRBFlags : UInt32

    NRBStatus : UInt32

    Count : UInt32

    LBA : Int64

    DataBufSize : UInt32

    NVCacheStatus : UInt32

    NVCacheSubStatus : UInt32

}
