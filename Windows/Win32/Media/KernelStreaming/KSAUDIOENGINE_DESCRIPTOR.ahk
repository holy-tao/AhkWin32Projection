#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIOENGINE_DESCRIPTOR {
    #StructPack 4

    nHostPinId : UInt32

    nOffloadPinId : UInt32

    nLoopbackPinId : UInt32

}
