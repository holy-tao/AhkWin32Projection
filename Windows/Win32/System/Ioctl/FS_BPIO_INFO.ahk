#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FS_BPIO_INFO {
    #StructPack 4

    ActiveBypassIoCount : UInt32

    StorageDriverNameLen : UInt16

    StorageDriverName : WCHAR[32]

}
