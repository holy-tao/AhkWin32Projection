#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USB_BANDWIDTH_INFO structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve information about the allocated bandwidth.
 * @remarks
 * The <b>USB_BANDWIDTH_INFO</b> structure is used with the USBUSER_GET_BANDWIDTH_INFORMATION user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * 
 * In Windows 8, this request completes successfully. However, the values retrieved from the underlying USB 3.0 driver stack do not reflect actual information about the allocated bandwidth. That is because the bandwidth information is not exposed by xHCI controllers.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_bandwidth_info
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_BANDWIDTH_INFO {
    #StructPack 4

    /**
     * The number of devices on the bus.
     */
    DeviceCount : UInt32

    /**
     * The amount of allocated bandwidth, in bits per millisecond.
     */
    TotalBusBandwidth : UInt32

    /**
     * The amount of allocated bandwidth bits in each 32-millisecond time slice.
     */
    Total32secBandwidth : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for bulk and control transfers.
     */
    AllocedBulkAndControl : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for isochronous transfers.
     */
    AllocedIso : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 1 millisecond.
     */
    AllocedInterrupt_1ms : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 2 milliseconds.
     */
    AllocedInterrupt_2ms : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 4 milliseconds.
     */
    AllocedInterrupt_4ms : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 8 milliseconds.
     */
    AllocedInterrupt_8ms : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 16 milliseconds.
     */
    AllocedInterrupt_16ms : UInt32

    /**
     * The amount of bandwidth, in bits per 32-millisecond, that is allocated for interrupt transactions when the period is 32 milliseconds.
     */
    AllocedInterrupt_32ms : UInt32

}
