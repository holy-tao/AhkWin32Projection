#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_FILE_SYSTEM_TYPE.ahk" { VDS_FILE_SYSTEM_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the properties of a file system.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-getfilesystemproperties">IVdsVolumeMF::GetFileSystemProperties</a> method returns this structure to report the property details of a file system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_file_system_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_FILE_SYSTEM_PROP {
    #StructPack 8

    /**
     * The file-system type enumerated by  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a>.
     */
    type : VDS_FILE_SYSTEM_TYPE

    /**
     * The GUID of the volume object containing the file system.
     */
    volumeId : Guid

    /**
     * The file-system flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_prop_flag">VDS_FILE_SYSTEM_PROP_FLAG</a>.
     */
    ulFlags : UInt32

    /**
     * The total number of allocation units.
     */
    ullTotalAllocationUnits : Int64

    /**
     * The  unused allocation units.
     */
    ullAvailableAllocationUnits : Int64

    /**
     * The allocation unit size, in bytes, for the file system, which is
     * usually between 512 and 4096.
     */
    ulAllocationUnitSize : UInt32

    /**
     * A string containing the file-system label.
     */
    pwszLabel : PWSTR

}
