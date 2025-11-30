#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ATA protocol data type.
 * @remarks
 * 
 * When using [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) to retrieve protocol-specific information in the [STORAGE_PROTOCOL_DATA_DESCRIPTOR](ns-winioctl-storage_protocol_data_descriptor.md), configure the [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md) structure as follows:
 * * Allocate a buffer that can contains both a [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md) and a [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) structure.
 * * Set the **PropertyID** field to **StorageAdapterProtocolSpecificProperty** or **StorageDeviceProtocolSpecificProperty** for a controller or device/namespace request, respectively.
 * * Set the **QueryType** field to **PropertyStandardQuery**.
 * * Fill the [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) structure with the desired values. The start of the **STORAGE_PROTOCOL_SPECIFIC_DATA** is the **AdditionalParameters** field of [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md).
 * 
 * To specify a type of ATA protocol-specific information,  configure the [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) structure as follows:
 * * Set the **ProtocolType** field to **ProtocolTypeAta**.
 * * Set the **DataType** field to an enumeration value defined by **STORAGE_PROTOCOL_ATA_DATA_TYPE**:
 *   * Use **AtaDataTypeIdentify** to identify the ATA drive.
 *   * Use **AtaDataTypeLogPage** to get log pages from the ATA drive.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-storage_protocol_ata_data_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_ATA_DATA_TYPE extends Win32Enum{

    /**
     * Unknown data type.
     * @type {Integer (Int32)}
     */
    static AtaDataTypeUnknown => 0

    /**
     * Identify device data type.
     * @type {Integer (Int32)}
     */
    static AtaDataTypeIdentify => 1

    /**
     * Log page data type.
     * @type {Integer (Int32)}
     */
    static AtaDataTypeLogPage => 2
}
