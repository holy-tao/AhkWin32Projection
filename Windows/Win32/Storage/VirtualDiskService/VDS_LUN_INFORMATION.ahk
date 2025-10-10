#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_STORAGE_DEVICE_ID_DESCRIPTOR.ahk

/**
 * Defines information about a LUN or disk. Applications can use this structure to uniquely identify a LUN at all times.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vdslun/ns-vdslun-vds_lun_information
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_LUN_INFORMATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The version of this structure. The current value is the constant 
     *       <b>VER_VDS_LUN_INFORMATION</b>.
     * @type {Integer}
     */
    m_version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The SCSI-2 device type of the LUN.
     * @type {Integer}
     */
    m_DeviceType {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * The SCSI-2 device type modifier of the LUN. For LUNs that have no device type modifier, the value is 
     *       zero.
     * @type {Integer}
     */
    m_DeviceTypeModifier {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * If <b>TRUE</b>, the LUN supports multiple outstanding commands; otherwise, 
     *       <b>FALSE</b>. The synchronization of the queue is the responsibility of the port 
     *       driver.
     * @type {Integer}
     */
    m_bCommandQueueing {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The bus type of the LUN enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a>.
     * @type {Integer}
     */
    m_BusType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Pointer to the LUN vendor identifier; a zero-terminated, human-readable string. For devices that have no 
     *       vendor identifier, the value is zero.
     * @type {Pointer<Byte>}
     */
    m_szVendorId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the LUN product identifier, typically a model number; a zero-terminated, human-readable string. 
     *       For devices that have no product identifier, the value is zero.
     * @type {Pointer<Byte>}
     */
    m_szProductId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the LUN product revision; a zero-terminated, human-readable string. For devices that have no 
     *       product revision, the value is zero.
     * @type {Pointer<Byte>}
     */
    m_szProductRevision {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the LUN serial number; a zero-terminated, human-readable string. For devices that have no serial 
     *       number, the value is zero.
     * @type {Pointer<Byte>}
     */
    m_szSerialNumber {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The signature of the LUN. For disks that use the Master Boot Record (MBR) partitioning structure, the first 
     *       32 bits of the GUID comprise the disk signature, and the remaining bits are zeros. For disks that use the GUID 
     *       Partition Table (GPT) partitioning structure, the GUID consists of the GPT disk identifier. If this value is 
     *       zero, the disk is uninitialized or the hardware provider was unable to retrieve the signature.
     * @type {Pointer<Guid>}
     */
    m_diskSignature {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Array containing the LUN descriptor in various formats, such as "VDSStorageIdTypeFCPHName" 
     *       and "VDSStorageIdTypeVendorSpecific". Providers can use 
     *       "VDSStorageIdTypeVendorSpecific" to store an arbitrary byte string of the vendor's choosing to 
     *       uniquely identify the LUN. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor">VDS_STORAGE_DEVICE_ID_DESCRIPTOR</a> 
     *       structure and the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_identifier">VDS_STORAGE_IDENTIFIER</a> 
     *       structure.
     * @type {VDS_STORAGE_DEVICE_ID_DESCRIPTOR}
     */
    m_deviceIdDescriptor{
        get {
            if(!this.HasProp("__m_deviceIdDescriptor"))
                this.__m_deviceIdDescriptor := VDS_STORAGE_DEVICE_ID_DESCRIPTOR(this.ptr + 56)
            return this.__m_deviceIdDescriptor
        }
    }

    /**
     * The number of interconnect ports specified in <b>m_rgInterconnects</b>.
     * @type {Integer}
     */
    m_cInterconnects {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Pointer to an array of the interconnect ports by which the LUN can be accessed. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_interconnect">VDS_INTERCONNECT</a> structure.
     * @type {Pointer<VDS_INTERCONNECT>}
     */
    m_rgInterconnects {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
