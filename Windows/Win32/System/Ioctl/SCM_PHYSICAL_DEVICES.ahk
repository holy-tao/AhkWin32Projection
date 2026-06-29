#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PHYSICAL_DEVICE_INSTANCE.ahk" { SCM_PHYSICAL_DEVICE_INSTANCE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PHYSICAL_DEVICES {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    DeviceCount : UInt32

    Devices : SCM_PHYSICAL_DEVICE_INSTANCE[1]

}
