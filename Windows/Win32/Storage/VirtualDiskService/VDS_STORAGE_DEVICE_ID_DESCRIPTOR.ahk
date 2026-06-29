#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_STORAGE_IDENTIFIER.ahk" { VDS_STORAGE_IDENTIFIER }

/**
 * Defines one or more storage identifiers for a storage device (typically an instance, as opposed to a class, of device).
 * @remarks
 * Storage devices can have multiple identifiers, and each of these identifiers can have a different code set and 
 *     type. The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure includes 
 *     this structure as a member to specify the storage device identifiers of a LUN.
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_STORAGE_DEVICE_ID_DESCRIPTOR {
    #StructPack 8

    /**
     * The version of this structure.
     */
    m_version : UInt32

    /**
     * The number of identifiers specified in <b>m_rgIdentifiers</b>.
     */
    m_cIdentifiers : UInt32

    /**
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> structure.
     */
    m_rgIdentifiers : VDS_STORAGE_IDENTIFIER.Ptr

}
