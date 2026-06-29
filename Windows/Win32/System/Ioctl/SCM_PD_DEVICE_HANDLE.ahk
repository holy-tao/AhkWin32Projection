#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_DEVICE_HANDLE {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    DeviceGuid : Guid

    DeviceHandle : UInt32

}
