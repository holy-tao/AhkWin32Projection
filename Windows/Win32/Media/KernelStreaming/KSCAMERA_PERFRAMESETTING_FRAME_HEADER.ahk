#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PERFRAMESETTING_FRAME_HEADER {
    #StructPack 4

    Size : UInt32

    Id : UInt32

    ItemCount : UInt32

    Reserved : UInt32

}
