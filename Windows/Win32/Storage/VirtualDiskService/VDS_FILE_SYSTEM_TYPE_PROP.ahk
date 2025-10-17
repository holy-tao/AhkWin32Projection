#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a file system type.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-queryfilesystemtypes">IVdsService::QueryFileSystemTypes</a>method returns this structure to report the property details of a file-system type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_file_system_type_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_FILE_SYSTEM_TYPE_PROP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The file system types enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a>. Valid types are FAT, FAT32, NTFS, CDFS and UDF.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The file system name.
     * @type {String}
     */
    wszName {
        get => StrGet(this.ptr + 4, 7, "UTF-16")
        set => StrPut(value, this.ptr + 4, 7, "UTF-16")
    }

    /**
     * The file system flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_flag">VDS_FILE_SYSTEM_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The valid allocation unit sizes used for compression.
     * @type {Integer}
     */
    ulCompressionFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The maximum length for a label name.
     * @type {Integer}
     */
    ulMaxLableLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A string containing all characters that are not valid for this file system type.
     * @type {PWSTR}
     */
    pwszIllegalLabelCharSet {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
