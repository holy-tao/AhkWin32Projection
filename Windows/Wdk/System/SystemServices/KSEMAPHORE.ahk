#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KSEMAPHORE {
    #StructPack 8

    Header : IntPtr

    Limit : Int32

}
