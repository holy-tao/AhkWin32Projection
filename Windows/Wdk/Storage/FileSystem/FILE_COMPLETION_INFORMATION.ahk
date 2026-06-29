#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_COMPLETION_INFORMATION {
    #StructPack 8

    Port : HANDLE

    Key : IntPtr

}
