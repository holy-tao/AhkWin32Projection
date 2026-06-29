#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PATHNAME_BUFFER {
    #StructPack 4

    PathNameLength : UInt32

    Name : WCHAR[1]

}
