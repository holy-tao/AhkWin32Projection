#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_DEVICE_SPECIFIC_PROPERTY {
    #StructPack 8

    Name : WCHAR[128]

    Value : Int64

}
