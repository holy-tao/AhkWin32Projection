#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO.ahk" { SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_DEDICATED_MEMORY_DEVICES_INFO {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    DeviceCount : UInt32

    Devices : SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO[1]

}
