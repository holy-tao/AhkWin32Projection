#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PERFRAMESETTING_ITEM_HEADER {
    #StructPack 8

    Size : UInt32

    Type : UInt32

    Flags : Int64

}
