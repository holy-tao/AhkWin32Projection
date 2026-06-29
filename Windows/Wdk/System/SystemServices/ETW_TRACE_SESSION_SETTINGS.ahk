#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ETW_TRACE_SESSION_SETTINGS {
    #StructPack 4

    Version : UInt32

    BufferSize : UInt32

    MinimumBuffers : UInt32

    MaximumBuffers : UInt32

    LoggerMode : UInt32

    FlushTimer : UInt32

    FlushThreshold : UInt32

    ClockType : UInt32

}
