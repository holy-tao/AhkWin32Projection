#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEM_LARGE_RANGE.ahk" { MEM_LARGE_RANGE }
#Import ".\MEM_LARGE_DES.ahk" { MEM_LARGE_DES }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MEM_LARGE_RESOURCE {
    #StructPack 8

    MEM_LARGE_Header : MEM_LARGE_DES

    MEM_LARGE_Data : MEM_LARGE_RANGE[1]

}
