#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSWAVE_OUTPUT_CAPABILITIES {
    #StructPack 4

    MaximumChannelsPerConnection : UInt32

    MinimumBitsPerSample : UInt32

    MaximumBitsPerSample : UInt32

    MinimumSampleFrequency : UInt32

    MaximumSampleFrequency : UInt32

    TotalConnections : UInt32

    StaticConnections : UInt32

    StreamingConnections : UInt32

    ActiveConnections : UInt32

    ActiveStaticConnections : UInt32

    ActiveStreamingConnections : UInt32

    Total3DConnections : UInt32

    Static3DConnections : UInt32

    Streaming3DConnections : UInt32

    Active3DConnections : UInt32

    ActiveStatic3DConnections : UInt32

    ActiveStreaming3DConnections : UInt32

    TotalSampleMemory : UInt32

    FreeSampleMemory : UInt32

    LargestFreeContiguousSampleMemory : UInt32

}
