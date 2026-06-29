#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BUSNUMBER_RANGE.ahk" { BUSNUMBER_RANGE }
#Import ".\BUSNUMBER_DES.ahk" { BUSNUMBER_DES }

/**
 * The BUSNUMBER_RESOURCE structure specifies either a resource list or a resource requirements list that describes bus number usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-busnumber_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct BUSNUMBER_RESOURCE {
    #StructPack 4

    /**
     * A [BUSNUMBER_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-busnumber_des) structure.
     */
    BusNumber_Header : BUSNUMBER_DES

    BusNumber_Data : BUSNUMBER_RANGE[1]

}
