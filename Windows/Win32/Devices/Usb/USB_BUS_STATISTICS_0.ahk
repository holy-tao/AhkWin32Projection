#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USB_BUS_STATISTICS_0 structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve bus statistics.
 * @remarks
 * The <b>USB_BUS_STATISTICS_0</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_bus_statistics_0_request">USBUSER_BUS_STATISTICS_0</a> user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
  * 
  * In Windows 8, this request completes successfully. However, the values retrieved from the underlying USB 3.0 driver stack do not reflect actual  bus statistics.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_bus_statistics_0
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_BUS_STATISTICS_0 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 1

    /**
     * The number of devices on the bus.
     * @type {Integer}
     */
    DeviceCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The current system time.
     * @type {Integer}
     */
    CurrentSystemTime {
        get => NumGet(this, 4, "int64")
        set => NumPut("int64", value, this, 4)
    }

    /**
     * The number of the current USB frame.
     * @type {Integer}
     */
    CurrentUsbFrame {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The amount, in bytes, of bulk transfer data.
     * @type {Integer}
     */
    BulkBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The amount, in bytes, of isochronous data.
     * @type {Integer}
     */
    IsoBytes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The amount, in bytes, of interrupt data.
     * @type {Integer}
     */
    InterruptBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The amount, in bytes, of control data.
     * @type {Integer}
     */
    ControlDataBytes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The amount, in bytes, of interrupt data.
     * @type {Integer}
     */
    PciInterruptCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of hard bus resets that have occurred.
     * @type {Integer}
     */
    HardResetCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of times that a worker thread has signaled completion of a task.
     * @type {Integer}
     */
    WorkerSignalCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of bytes that are transferred by common buffer.
     * @type {Integer}
     */
    CommonBufferBytes {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The amount of time, in milliseconds, that worker threads have been idle.
     * @type {Integer}
     */
    WorkerIdleTimeMs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A Boolean value that indicates whether the root hub is enabled. If <b>TRUE</b>, he root hub is enabled. If <b>FALSE</b>, the root hub is disabled.
     * @type {Integer}
     */
    RootHubEnabled {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    RootHubDevicePowerState {
        get => NumGet(this, 53, "char")
        set => NumPut("char", value, this, 53)
    }

    /**
     * If this member is 1, the bus is active. If 0, the bus is inactive.
     * @type {Integer}
     */
    Unused {
        get => NumGet(this, 54, "char")
        set => NumPut("char", value, this, 54)
    }

    /**
     * The index that is used to generate a symbolic link name for the hub PDO. This format of the symbolic link is USBPDO-<i>n</i>, where <i>n</i> is the value in <b>NameIndex</b>.
     * @type {Integer}
     */
    NameIndex {
        get => NumGet(this, 55, "char")
        set => NumPut("char", value, this, 55)
    }
}
