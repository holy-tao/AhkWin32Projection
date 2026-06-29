#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_LOGICAL_DEVICE_INSTANCE {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    DeviceGuid : Guid

    SymbolicLink : WCHAR[256]

}
