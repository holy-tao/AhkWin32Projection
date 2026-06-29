#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NODE_CONNECTION_DRIVERKEY_NAME {
    #StructPack 4

    ConnectionIndex : UInt32

    ActualLength : UInt32

    DriverKeyName : WCHAR[1]

}
