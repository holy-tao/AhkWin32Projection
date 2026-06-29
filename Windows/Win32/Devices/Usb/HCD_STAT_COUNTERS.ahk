#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct HCD_STAT_COUNTERS {
    #StructPack 4

    BytesTransferred : UInt32

    IsoMissedCount : UInt16

    DataOverrunErrorCount : UInt16

    CrcErrorCount : UInt16

    ScheduleOverrunCount : UInt16

    TimeoutErrorCount : UInt16

    InternalHcErrorCount : UInt16

    BufferOverrunErrorCount : UInt16

    SWErrorCount : UInt16

    StallPidCount : UInt16

    PortDisableCount : UInt16

}
