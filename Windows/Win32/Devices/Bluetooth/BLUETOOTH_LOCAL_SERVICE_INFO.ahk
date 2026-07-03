#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLUETOOTH_ADDRESS.ahk" { BLUETOOTH_ADDRESS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_LOCAL_SERVICE_INFO {
    #StructPack 8

    Enabled : BOOL

    btAddr : BLUETOOTH_ADDRESS

    szName : WCHAR[256]

    szDeviceString : WCHAR[256]

}
