#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEM_RANGE.ahk" { MEM_RANGE }
#Import ".\MEM_DES.ahk" { MEM_DES }
#Import ".\MD_FLAGS.ahk" { MD_FLAGS }

/**
 * The MEM_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes memory usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mem_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MEM_RESOURCE {
    #StructPack 8

    /**
     * A [MEM_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-mem_des) structure.
     */
    MEM_Header : MEM_DES

    MEM_Data : MEM_RANGE[1]

}
