#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_HEALTH_NOTIFICATION_DATA {
    #StructPack 4

    DeviceGuid : Guid

}
