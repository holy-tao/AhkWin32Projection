#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the parameters to be used when a virtual disk is created.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_create_vdisk_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_CREATE_VDISK_PARAMETERS {
    #StructPack 8

    /**
     * A unique GUID value to be assigned to the virtual disk.
     */
    UniqueId : Guid

    /**
     * The maximum virtual size, in bytes, of the virtual disk object.
     */
    MaximumSize : Int64

    /**
     * The internal block size, in bytes, of the virtual disk object.
     */
    BlockSizeInBytes : UInt32

    /**
     * Internal sector size, in bytes, of the virtual disk object.
     */
    SectorSizeInBytes : UInt32

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a parent virtual disk object. This member associates the new virtual disk with an existing virtual disk.
     */
    pParentPath : PWSTR

    /**
     * A <b>NULL</b>-terminated wide-character string that contains an optional path to a source of data to be copied to the new virtual disk.
     */
    pSourcePath : PWSTR

}
