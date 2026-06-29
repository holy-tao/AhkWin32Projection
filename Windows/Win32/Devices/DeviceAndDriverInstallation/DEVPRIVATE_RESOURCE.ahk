#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVPRIVATE_RANGE.ahk" { DEVPRIVATE_RANGE }
#Import ".\DEVPRIVATE_DES.ahk" { DEVPRIVATE_DES }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DEVPRIVATE_RESOURCE {
    #StructPack 4

    PRV_Header : DEVPRIVATE_DES

    PRV_Data : DEVPRIVATE_RANGE[1]

}
