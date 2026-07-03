#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_IDLE_CALLBACK_INFO {
    #StructPack 8

    IdleCallback : IntPtr

    IdleContext : IntPtr

}
