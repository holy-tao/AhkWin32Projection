#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct HCD_ISO_STAT_COUNTERS {
    #StructPack 4

    LateUrbs : UInt16

    DoubleBufferedPackets : UInt16

    TransfersCF_5ms : UInt16

    TransfersCF_2ms : UInt16

    TransfersCF_1ms : UInt16

    MaxInterruptLatency : UInt16

    BadStartFrame : UInt16

    StaleUrbs : UInt16

    IsoPacketNotAccesed : UInt16

    IsoPacketHWError : UInt16

    SmallestUrbPacketCount : UInt16

    LargestUrbPacketCount : UInt16

    IsoCRC_Error : UInt16

    IsoOVERRUN_Error : UInt16

    IsoINTERNAL_Error : UInt16

    IsoUNKNOWN_Error : UInt16

    IsoBytesTransferred : UInt32

    LateMissedCount : UInt16

    HWIsoMissedCount : UInt16

    Reserved7 : UInt32[8]

}
