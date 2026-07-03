#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCM_LOGICAL_DEVICE_INSTANCE.ahk" { SCM_LOGICAL_DEVICE_INSTANCE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_LOGICAL_DEVICES {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    DeviceCount : UInt32

    Devices : SCM_LOGICAL_DEVICE_INSTANCE[1]

}
