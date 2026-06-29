#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct WNF_KSCAMERA_STREAMSTATE_INFO {
    #StructPack 4

    ProcessId : UInt32

    SessionId : UInt32

    StreamState : UInt32

    Reserved : UInt32

}
