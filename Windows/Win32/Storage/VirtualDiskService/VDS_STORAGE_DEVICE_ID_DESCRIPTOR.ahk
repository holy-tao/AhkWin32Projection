#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines one or more storage identifiers for a storage device (typically an instance, as opposed to a class, of device).
 * @remarks
 * Storage devices can have multiple identifiers, and each of these identifiers can have a different code set and 
 *     type. The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure includes 
 *     this structure as a member to specify the storage device identifiers of a LUN.
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_STORAGE_DEVICE_ID_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The version of this structure.
     * @type {Integer}
     */
    m_version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of identifiers specified in <b>m_rgIdentifiers</b>.
     * @type {Integer}
     */
    m_cIdentifiers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> structure.
     * @type {Pointer<VDS_STORAGE_IDENTIFIER>}
     */
    m_rgIdentifiers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
