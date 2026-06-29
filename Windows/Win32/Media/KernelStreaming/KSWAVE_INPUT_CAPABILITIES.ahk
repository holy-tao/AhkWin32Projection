#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSWAVE_INPUT_CAPABILITIES {
    #StructPack 4

    MaximumChannelsPerConnection : UInt32

    MinimumBitsPerSample : UInt32

    MaximumBitsPerSample : UInt32

    MinimumSampleFrequency : UInt32

    MaximumSampleFrequency : UInt32

    TotalConnections : UInt32

    ActiveConnections : UInt32

}
