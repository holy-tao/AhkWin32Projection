#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PMEM_PAGE_RANGE {
    #StructPack 8

    StartingPfn : Int64

    PageCount : Int64

    MarkedBadBitmap : Int64

}
