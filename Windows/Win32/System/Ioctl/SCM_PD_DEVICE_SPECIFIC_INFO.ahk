#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PD_DEVICE_SPECIFIC_PROPERTY.ahk" { SCM_PD_DEVICE_SPECIFIC_PROPERTY }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_DEVICE_SPECIFIC_INFO {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    NumberOfProperties : UInt32

    DeviceSpecificProperties : SCM_PD_DEVICE_SPECIFIC_PROPERTY[1]

}
