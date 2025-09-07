#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible values of the PropertyId member of the STORAGE_PROPERTY_QUERY structure passed as input to the IOCTL_STORAGE_QUERY_PROPERTY request to retrieve the properties of a storage device or adapter.
 * @remarks
 * The optional output buffer returned through the *lpOutBuffer* parameter of the [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) control code request can be one of several structures depending on the value of the **PropertyId** member of the [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md) structure pointed to by the *lpInBuffer* parameter. If the **QueryType** member of the **STORAGE_PROPERTY_QUERY** is set to **PropertyExistsQuery**, then no structure is returned.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_property_id
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROPERTY_ID{

    /**
     * Indicates that the caller is querying for the device descriptor, [STORAGE_DEVICE_DESCRIPTOR](ns-winioctl-storage_device_descriptor.md).
     * @type {Integer (Int32)}
     */
    static StorageDeviceProperty => 0

    /**
     * Indicates that the caller is querying for the adapter descriptor, [STORAGE_ADAPTER_DESCRIPTOR](ns-winioctl-storage_adapter_descriptor.md).
     * @type {Integer (Int32)}
     */
    static StorageAdapterProperty => 1

    /**
     * Indicates that the caller is querying for the device identifiers provided with the SCSI vital product data pages. Data is returned using the  [STORAGE_DEVICE_ID_DESCRIPTOR](ns-winioctl-storage_device_id_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageDeviceIdProperty => 2

    /**
     * **Intended for driver usage.** Indicates that the caller is querying for the unique device identifiers. Data is returned using the **STORAGE_DEVICE_UNIQUE_IDENTIFIER** structure (see the storduid.h header in the DDK).
 * 
 * **Windows Server 2003 and Windows XP:**  This value is not supported before Windows Vista and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static StorageDeviceUniqueIdProperty => 3

    /**
     * Indicates that the caller is querying for the write cache property. Data is returned using the [STORAGE_WRITE_CACHE_PROPERTY](ns-winioctl-storage_write_cache_property.md) structure.
 * 
 * **Windows Server 2003 and Windows XP:**  This value is not supported before Windows Vista and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static StorageDeviceWriteCacheProperty => 4

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageMiniportProperty => 5

    /**
     * Indicates that the caller is querying for the access alignment descriptor, [STORAGE_ACCESS_ALIGNMENT_DESCRIPTOR](ns-winioctl-storage_access_alignment_descriptor.md).
 * 
 * **Windows Server 2003 and Windows XP:**  This value is not supported before Windows Vista and Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static StorageAccessAlignmentProperty => 6

    /**
     * Indicates that the caller is querying for the seek penalty descriptor, [DEVICE_SEEK_PENALTY_DESCRIPTOR](ns-winioctl-device_seek_penalty_descriptor.md).
 * 
 * **Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:**  This value is not supported before Windows 7 and Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static StorageDeviceSeekPenaltyProperty => 7

    /**
     * Indicates that the caller is querying for the trim descriptor, [DEVICE_TRIM_DESCRIPTOR](ns-winioctl-device_trim_descriptor.md).
 * 
 * **Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:**  This value is not supported before Windows 7 and Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static StorageDeviceTrimProperty => 8

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceWriteAggregationProperty => 9

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceDeviceTelemetryProperty => 10

    /**
     * Indicates that the caller is querying for the logical block provisioning property. Data is returned using the [DEVICE_LB_PROVISIONING_DESCRIPTOR](ns-winioctl-device_lb_provisioning_descriptor.md) structure.
 * 
 * **Windows 7, Windows Server 2008 R2, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:**  This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static StorageDeviceLBProvisioningProperty => 11

    /**
     * Indicates that the caller is querying for the device power descriptor. Data is returned using the [DEVICE_POWER_DESCRIPTOR](ns-winioctl-device_power_descriptor.md) structure.
 * 
 * **Windows 7, Windows Server 2008 R2, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:**  This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static StorageDevicePowerProperty => 12

    /**
     * Indicates that the caller is querying for the copy offload  parameters property. Data is returned using the [DEVICE_COPY_OFFLOAD_DESCRIPTOR](ns-winioctl-device_copy_offload_descriptor.md) structure.
 * 
 * **Windows 7, Windows Server 2008 R2, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:**  This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static StorageDeviceCopyOffloadProperty => 13

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceResiliencyProperty => 14

    /**
     * Indicates that the caller is querying for the medium product type. Data is returned using the [STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR](./ns-winioctl-storage_medium_product_type_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageDeviceMediumProductType => 15

    /**
     * Indicates that the caller is querying for RPMB support and properties. Data is returned using the [STORAGE_RPMB_DESCRIPTOR](ns-winioctl-storage_rpmb_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageAdapterRpmbProperty => 16

    /**
     * Provides info on the storage adapter encryption capabilities. This is currently supported on UFS (Universal Flash Storage) adapters.
     * @type {Integer (Int32)}
     */
    static StorageAdapterCryptoProperty => 17

    /**
     * Indicates that the caller is querying for the device I/O capability property. Data is returned using the [DEVICE_IO_CAPABILITY_DESCRIPTOR](ns-winioctl-storage_device_io_capability_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageDeviceIoCapabilityProperty => 48

    /**
     * Indicates that the caller is querying for protocol-specific data from the  adapter. Data is returned using the [STORAGE_PROTOCOL_DATA_DESCRIPTOR](ns-winioctl-storage_protocol_data_descriptor.md) structure. See the remarks for more info.
     * @type {Integer (Int32)}
     */
    static StorageAdapterProtocolSpecificProperty => 49

    /**
     * Indicates that the caller is querying for protocol-specific data from the device. Data is returned using the [STORAGE_PROTOCOL_DATA_DESCRIPTOR](ns-winioctl-storage_protocol_data_descriptor.md) structure. See the remarks for more info.
     * @type {Integer (Int32)}
     */
    static StorageDeviceProtocolSpecificProperty => 50

    /**
     * Indicates that the caller is querying temperature data from the adapter. Data is returned using the [STORAGE_TEMPERATURE_DATA_DESCRIPTOR](ns-winioctl-storage_temperature_data_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageAdapterTemperatureProperty => 51

    /**
     * Indicates that the caller is querying for temperature data from the device.  Data is returned using the [STORAGE_TEMPERATURE_DATA_DESCRIPTOR](ns-winioctl-storage_temperature_data_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageDeviceTemperatureProperty => 52

    /**
     * Indicates that the caller is querying for topology information from the adapter. Data is returned using the [STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR](ns-winioctl-storage_physical_topology_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageAdapterPhysicalTopologyProperty => 53

    /**
     * Indicates that the caller is querying for topology information from the device. Data is returned using the [STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR](ns-winioctl-storage_physical_topology_descriptor.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageDevicePhysicalTopologyProperty => 54

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceAttributesProperty => 55

    /**
     * Provides health information about the storage device (specifically for the persistent memory stack).
     * @type {Integer (Int32)}
     */
    static StorageDeviceManagementStatus => 56

    /**
     * Indicates that the caller is querying for the adapter serial number. Data is returned using the [STORAGE_ADAPTER_SERIAL_NUMBER](ns-winioctl-storage_adapter_serial_number.md) structure.
     * @type {Integer (Int32)}
     */
    static StorageAdapterSerialNumberProperty => 57

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceLocationProperty => 58

    /**
     * Provides the non-uniform memory access (NUMA) node of the storage device.
     * @type {Integer (Int32)}
     */
    static StorageDeviceNumaProperty => 59

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceZonedDeviceProperty => 60

    /**
     * Provides the unsafe shutdown count value used to determine if the device data might have been lost during a power loss event (specifically for the persistent memory stack).
     * @type {Integer (Int32)}
     */
    static StorageDeviceUnsafeShutdownCount => 61

    /**
     * Provides info on how many bytes have been read/write from a solid-state drive (SSD). This property is supported only for Non-Volatile Memory Express (NVMe) devices that implement a certain NVMe feature.
     * @type {Integer (Int32)}
     */
    static StorageDeviceEnduranceProperty => 62

    /**
     * Provides info on the state of the LED associated with a storage device. This is a server-oriented feature.
     * @type {Integer (Int32)}
     */
    static StorageDeviceLedStateProperty => 63

    /**
     * Reserved for system use.
     * @type {Integer (Int32)}
     */
    static StorageDeviceSelfEncryptionProperty => 64

    /**
     * Provides identification info for a storage device that can be physically replaced with a Field Replacement Unit (FRU).
     * @type {Integer (Int32)}
     */
    static StorageFruIdProperty => 65
}
