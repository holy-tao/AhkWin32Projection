#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PHYSICAL_DEVICE_INSTANCE {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    NfitHandle : UInt32

    SymbolicLink : WCHAR[256]

}
