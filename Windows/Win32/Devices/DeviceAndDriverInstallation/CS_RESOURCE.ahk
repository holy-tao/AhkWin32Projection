#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CS_DES.ahk" { CS_DES }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The CS_RESOURCE structure is used for specifying a resource list that describes device class-specific resource usage for a device instance. For more information about resource lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cs_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CS_RESOURCE {
    #StructPack 4

    /**
     * A [CS_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cs_des) structure.
     */
    CS_Header : CS_DES

}
