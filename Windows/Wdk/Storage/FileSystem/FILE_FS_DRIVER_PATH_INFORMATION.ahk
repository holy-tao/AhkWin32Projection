#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_FS_DRIVER_PATH_INFORMATION {
    #StructPack 4

    DriverInPath : BOOLEAN

    DriverNameLength : UInt32

    DriverName : WCHAR[1]

}
