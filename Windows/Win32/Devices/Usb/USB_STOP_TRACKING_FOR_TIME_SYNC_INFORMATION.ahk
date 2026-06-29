#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION {
    #StructPack 8

    TimeTrackingHandle : HANDLE

}
