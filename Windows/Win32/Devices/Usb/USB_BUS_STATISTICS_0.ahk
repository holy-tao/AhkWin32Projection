#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The USB_BUS_STATISTICS_0 structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve bus statistics.
 * @remarks
 * The <b>USB_BUS_STATISTICS_0</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_bus_statistics_0_request">USBUSER_BUS_STATISTICS_0</a> user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * 
 * In Windows 8, this request completes successfully. However, the values retrieved from the underlying USB 3.0 driver stack do not reflect actual  bus statistics.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_bus_statistics_0
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_BUS_STATISTICS_0 {
    #StructPack 8

    /**
     * The number of devices on the bus.
     */
    DeviceCount : UInt32

    /**
     * The current system time.
     */
    CurrentSystemTime : Int64

    /**
     * The number of the current USB frame.
     */
    CurrentUsbFrame : UInt32

    /**
     * The amount, in bytes, of bulk transfer data.
     */
    BulkBytes : UInt32

    /**
     * The amount, in bytes, of isochronous data.
     */
    IsoBytes : UInt32

    /**
     * The amount, in bytes, of interrupt data.
     */
    InterruptBytes : UInt32

    /**
     * The amount, in bytes, of control data.
     */
    ControlDataBytes : UInt32

    /**
     * The amount, in bytes, of interrupt data.
     */
    PciInterruptCount : UInt32

    /**
     * The number of hard bus resets that have occurred.
     */
    HardResetCount : UInt32

    /**
     * The number of times that a worker thread has signaled completion of a task.
     */
    WorkerSignalCount : UInt32

    /**
     * The number of bytes that are transferred by common buffer.
     */
    CommonBufferBytes : UInt32

    /**
     * The amount of time, in milliseconds, that worker threads have been idle.
     */
    WorkerIdleTimeMs : UInt32

    /**
     * A Boolean value that indicates whether the root hub is enabled. If <b>TRUE</b>, he root hub is enabled. If <b>FALSE</b>, the root hub is disabled.
     */
    RootHubEnabled : BOOLEAN

    RootHubDevicePowerState : Int8

    /**
     * If this member is 1, the bus is active. If 0, the bus is inactive.
     */
    Unused : Int8

    /**
     * The index that is used to generate a symbolic link name for the hub PDO. This format of the symbolic link is USBPDO-<i>n</i>, where <i>n</i> is the value in <b>NameIndex</b>.
     */
    NameIndex : Int8

}
