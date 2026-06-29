#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBSCAN_TIMEOUT {
    #StructPack 4

    TimeoutRead : UInt32

    TimeoutWrite : UInt32

    TimeoutEvent : UInt32

}
