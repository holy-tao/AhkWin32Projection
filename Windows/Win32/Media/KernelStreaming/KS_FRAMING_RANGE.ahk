#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_FRAMING_RANGE {
    #StructPack 4

    MinFrameSize : UInt32

    MaxFrameSize : UInt32

    Stepping : UInt32

}
