#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_FILE_SYSTEM_TYPE.ahk" { VDS_FILE_SYSTEM_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines the properties of a file system type.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-queryfilesystemtypes">IVdsService::QueryFileSystemTypes</a> method returns this structure to report the property details of a file-system type.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_file_system_type_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_FILE_SYSTEM_TYPE_PROP {
    #StructPack 8

    /**
     * The file system types enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a>. Valid types are FAT, FAT32, NTFS, CDFS and UDF.
     */
    type : VDS_FILE_SYSTEM_TYPE

    /**
     * The file system name.
     */
    wszName : WCHAR[8]

    /**
     * The file system flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_flag">VDS_FILE_SYSTEM_FLAG</a>.
     */
    ulFlags : UInt32

    /**
     * The valid allocation unit sizes used for compression.
     */
    ulCompressionFlags : UInt32

    /**
     * The maximum length for a label name.
     */
    ulMaxLableLength : UInt32

    /**
     * A string containing all characters that are not valid for this file system type.
     */
    pwszIllegalLabelCharSet : PWSTR

}
