#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_PHOTOMODE {
    #StructPack 4

    RequestedHistoryFrames : UInt32

    MaxHistoryFrames : UInt32

    SubMode : UInt32

    Reserved : UInt32

}
