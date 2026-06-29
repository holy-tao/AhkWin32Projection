#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION {
    #StructPack 8

    TimeTrackingHandle : HANDLE

    IsStartupDelayTolerable : BOOLEAN

}
