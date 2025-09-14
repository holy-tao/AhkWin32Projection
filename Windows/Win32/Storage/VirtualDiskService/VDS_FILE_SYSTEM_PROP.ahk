#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of a file system.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-getfilesystemproperties">IVdsVolumeMF::GetFileSystemProperties</a> method returns this structure to report the property details of a file system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_file_system_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_FILE_SYSTEM_PROP extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The file-system type enumerated by  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a>.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The GUID of the volume object containing the file system.
     * @type {Pointer<Guid>}
     */
    volumeId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The file-system flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_prop_flag">VDS_FILE_SYSTEM_PROP_FLAG</a>.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The total number of allocation units.
     * @type {Integer}
     */
    ullTotalAllocationUnits {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The  unused allocation units.
     * @type {Integer}
     */
    ullAvailableAllocationUnits {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The allocation unit size, in bytes, for the file system, which is
     * usually between 512 and 4096.
     * @type {Integer}
     */
    ulAllocationUnitSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A string containing the file-system label.
     * @type {Pointer<PWSTR>}
     */
    pwszLabel {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
