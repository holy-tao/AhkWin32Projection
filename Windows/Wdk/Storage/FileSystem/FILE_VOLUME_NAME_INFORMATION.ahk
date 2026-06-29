#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_VOLUME_NAME_INFORMATION {
    #StructPack 4

    DeviceNameLength : UInt32

    DeviceName : WCHAR[1]

}
