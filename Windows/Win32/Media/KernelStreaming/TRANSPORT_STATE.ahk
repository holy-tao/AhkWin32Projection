#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TRANSPORT_STATE {
    #StructPack 4

    Mode : UInt32

    State : UInt32

}
