#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_ROOT_HUB_NAME {
    #StructPack 4

    ActualLength : UInt32

    RootHubName : WCHAR[1]

}
