#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERIALPERF_STATS {
    #StructPack 4

    ReceivedCount : UInt32

    TransmittedCount : UInt32

    FrameErrorCount : UInt32

    SerialOverrunErrorCount : UInt32

    BufferOverrunErrorCount : UInt32

    ParityErrorCount : UInt32

}
