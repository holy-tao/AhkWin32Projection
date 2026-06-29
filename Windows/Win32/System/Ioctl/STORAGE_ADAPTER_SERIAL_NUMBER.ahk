#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ADAPTER_SERIAL_NUMBER {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    SerialNumber : WCHAR[128]

}
