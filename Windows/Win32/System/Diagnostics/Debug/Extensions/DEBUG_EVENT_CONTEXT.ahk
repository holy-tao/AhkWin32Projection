#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_EVENT_CONTEXT {
    #StructPack 4

    Size : UInt32

    ProcessEngineId : UInt32

    ThreadEngineId : UInt32

    FrameEngineId : UInt32

}
