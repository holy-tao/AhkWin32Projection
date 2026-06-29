#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_SPEED.ahk" { USB_DEVICE_SPEED }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_PERFORMANCE_INFO {
    #StructPack 4

    BulkBytes : UInt32

    ControlDataBytes : UInt32

    IsoBytes : UInt32

    InterruptBytes : UInt32

    BulkUrbCount : UInt32

    ControlUrbCount : UInt32

    IsoUrbCount : UInt32

    InterruptUrbCount : UInt32

    AllocedInterrupt : UInt32[6]

    AllocedIso : UInt32

    Total32secBandwidth : UInt32

    TotalTtBandwidth : UInt32

    DeviceDescription : WCHAR[60]

    DeviceSpeed : USB_DEVICE_SPEED

    TotalIsoLatency : UInt32

    DroppedIsoPackets : UInt32

    TransferErrors : UInt32

    PciInterruptCount : UInt32

    HcIdleState : UInt32

    HcAsyncIdleState : UInt32

    HcAsyncCacheFlushCount : UInt32

    HcPeriodicIdleState : UInt32

    HcPeriodicCacheFlushCount : UInt32

}
