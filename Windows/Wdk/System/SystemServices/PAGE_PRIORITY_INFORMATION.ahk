#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PAGE_PRIORITY_INFORMATION {
    #StructPack 4

    PagePriority : UInt32

}
