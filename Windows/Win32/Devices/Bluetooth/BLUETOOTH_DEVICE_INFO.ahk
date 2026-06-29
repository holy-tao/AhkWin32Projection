#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BLUETOOTH_ADDRESS.ahk" { BLUETOOTH_ADDRESS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_DEVICE_INFO {
    #StructPack 8

    dwSize : UInt32

    Address : BLUETOOTH_ADDRESS

    ulClassofDevice : UInt32

    fConnected : BOOL

    fRemembered : BOOL

    fAuthenticated : BOOL

    stLastSeen : SYSTEMTIME

    stLastUsed : SYSTEMTIME

    szName : WCHAR[248]

}
