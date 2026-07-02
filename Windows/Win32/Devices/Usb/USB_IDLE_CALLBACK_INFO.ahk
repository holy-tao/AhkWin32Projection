#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_IDLE_CALLBACK.ahk" { USB_IDLE_CALLBACK }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_IDLE_CALLBACK_INFO {
    #StructPack 8

    IdleCallback : USB_IDLE_CALLBACK

    IdleContext : IntPtr

}
