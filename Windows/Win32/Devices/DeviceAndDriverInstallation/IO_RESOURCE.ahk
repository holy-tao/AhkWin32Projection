#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_DES.ahk" { IO_DES }
#Import ".\IO_RANGE.ahk" { IO_RANGE }
#Import ".\IOD_DESFLAGS.ahk" { IOD_DESFLAGS }

/**
 * The IO_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes I/O port usage for a device instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-io_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IO_RESOURCE {
    #StructPack 8

    /**
     * An [IO_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-io_des) structure.
     */
    IO_Header : IO_DES

    IO_Data : IO_RANGE[1]

}
