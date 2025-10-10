#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USB_BANDWIDTH_INFO structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve information about the allocated bandwidth.
 * @remarks
 * 
  * The <b>USB_BANDWIDTH_INFO</b> structure is used with the USBUSER_GET_BANDWIDTH_INFORMATION user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
  * 
  * In Windows 8, this request completes successfully. However, the values retrieved from the underlying USB 3.0 driver stack do not reflect actual information about the allocated bandwidth. That is because the bandwidth information is not exposed by xHCI controllers.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usb_bandwidth_info
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_BANDWIDTH_INFO extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * The number of devices on the bus.
     * @type {Integer}
     */
    DeviceCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The amount of allocated bandwidth, in bits per millisecond.
     * @type {Integer}
     */
    TotalBusBandwidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The amount of allocated bandwidth bits in each 32-millisecond time slice.
     * @type {Integer}
     */
    Total32secBandwidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for bulk and control transfers.
     * @type {Integer}
     */
    AllocedBulkAndControl {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for isochronous transfers.
     * @type {Integer}
     */
    AllocedIso {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 1 millisecond.
     * @type {Integer}
     */
    AllocedInterrupt_1ms {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 2 milliseconds.
     * @type {Integer}
     */
    AllocedInterrupt_2ms {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 4 milliseconds.
     * @type {Integer}
     */
    AllocedInterrupt_4ms {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 8 milliseconds.
     * @type {Integer}
     */
    AllocedInterrupt_8ms {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 16 milliseconds.
     * @type {Integer}
     */
    AllocedInterrupt_16ms {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 32 milliseconds.
     * @type {Integer}
     */
    AllocedInterrupt_32ms {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
