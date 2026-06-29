#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_INTERCONNECT.ahk" { VDS_INTERCONNECT }
#Import ".\VDS_STORAGE_IDENTIFIER.ahk" { VDS_STORAGE_IDENTIFIER }
#Import ".\VDS_STORAGE_BUS_TYPE.ahk" { VDS_STORAGE_BUS_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\VDS_STORAGE_DEVICE_ID_DESCRIPTOR.ahk" { VDS_STORAGE_DEVICE_ID_DESCRIPTOR }

/**
 * Defines information about a LUN or disk. Applications can use this structure to uniquely identify a LUN at all times.
 * @remarks
 * The <b>VDS_LUN_INFORMATION</b> structure includes 
 *     fields from the SCSI Inquiry Data and Vital Product Data pages 0x80 and 0x83. The 
 *     <b>GetIdentificationData</b> method on both the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdslun">IVdsLun</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsdisk">IVdsDisk</a> interfaces return this structure. It is also 
 *     passed as an argument in the
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwproviderprivate-queryifcreatedlun">IVdsHwProviderPrivate::QueryIfCreatedLun</a> 
 *     method to determine whether a given provider owns a specified LUN.
 * 
 * To get the LUN object, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> method. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method to get the LUN properties.
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ns-vdslun-vds_lun_information
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_LUN_INFORMATION {
    #StructPack 8

    /**
     * The version of this structure. The current value is the constant 
     *       <b>VER_VDS_LUN_INFORMATION</b>.
     */
    m_version : UInt32

    /**
     * The SCSI-2 device type of the LUN.
     */
    m_DeviceType : Int8

    /**
     * The SCSI-2 device type modifier of the LUN. For LUNs that have no device type modifier, the value is 
     *       zero.
     */
    m_DeviceTypeModifier : Int8

    /**
     * If <b>TRUE</b>, the LUN supports multiple outstanding commands; otherwise, 
     *       <b>FALSE</b>. The synchronization of the queue is the responsibility of the port 
     *       driver.
     */
    m_bCommandQueueing : BOOL

    /**
     * The bus type of the LUN enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a>.
     */
    m_BusType : VDS_STORAGE_BUS_TYPE

    /**
     * Pointer to the LUN vendor identifier; a zero-terminated, human-readable string. For devices that have no 
     *       vendor identifier, the value is zero.
     */
    m_szVendorId : IntPtr

    /**
     * Pointer to the LUN product identifier, typically a model number; a zero-terminated, human-readable string. 
     *       For devices that have no product identifier, the value is zero.
     */
    m_szProductId : IntPtr

    /**
     * Pointer to the LUN product revision; a zero-terminated, human-readable string. For devices that have no 
     *       product revision, the value is zero.
     */
    m_szProductRevision : IntPtr

    /**
     * Pointer to the LUN serial number; a zero-terminated, human-readable string. For devices that have no serial 
     *       number, the value is zero.
     */
    m_szSerialNumber : IntPtr

    /**
     * The signature of the LUN. For disks that use the Master Boot Record (MBR) partitioning structure, the first 
     *       32 bits of the GUID comprise the disk signature, and the remaining bits are zeros. For disks that use the GUID 
     *       Partition Table (GPT) partitioning structure, the GUID consists of the GPT disk identifier. If this value is 
     *       zero, the disk is uninitialized or the hardware provider was unable to retrieve the signature.
     */
    m_diskSignature : Guid

    /**
     * Array containing the LUN descriptor in various formats, such as "VDSStorageIdTypeFCPHName" 
     *       and "VDSStorageIdTypeVendorSpecific". Providers can use 
     *       "VDSStorageIdTypeVendorSpecific" to store an arbitrary byte string of the vendor's choosing to 
     *       uniquely identify the LUN. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor">VDS_STORAGE_DEVICE_ID_DESCRIPTOR</a> 
     *       structure and the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> 
     *       structure.
     */
    m_deviceIdDescriptor : VDS_STORAGE_DEVICE_ID_DESCRIPTOR

    /**
     * The number of interconnect ports specified in <b>m_rgInterconnects</b>.
     */
    m_cInterconnects : UInt32

    /**
     * Pointer to an array of the interconnect ports by which the LUN can be accessed. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_interconnect">VDS_INTERCONNECT</a> structure.
     */
    m_rgInterconnects : VDS_INTERCONNECT.Ptr

}
