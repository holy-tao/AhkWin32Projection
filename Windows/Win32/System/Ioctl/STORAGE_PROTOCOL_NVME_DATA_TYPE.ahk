#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the type of NVMe protocol-specific data that's to be queried during an IOCTL_STORAGE_QUERY_PROPERTY request.
 * @remarks
 * 
 * When using [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) to retrieve protocol-specific information in the [STORAGE_PROTOCOL_DATA_DESCRIPTOR](ns-winioctl-storage_protocol_data_descriptor.md), configure the [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md) structure as follows:
 * * Allocate a buffer that can contains both a [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md) and a [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) structure.
 * * Set the **PropertyID** field to **StorageAdapterProtocolSpecificProperty** or **StorageDeviceProtocolSpecificProperty** for a controller or device/namespace request, respectively.
 * * Set the **QueryType** field to **PropertyStandardQuery**.
 * * Fill the [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) structure with the desired values. The start of the **STORAGE_PROTOCOL_SPECIFIC_DATA** is the **AdditionalParameters** field of [STORAGE_PROPERTY_QUERY](ns-winioctl-storage_property_query.md).
 * 
 * To specify a type of NVMe protocol-specific information,  configure the [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) structure as follows:
 * * Set the **ProtocolType** field to **ProtocolTypeNVMe**.
 * * Set the **DataType** field to an enumeration value defined by **STORAGE_PROTOCOL_NVME_DATA_TYPE**:
 *   * Use **NVMeDataTypeIdentify** to get Identify Controller data or Identify Namespace data.
 *   * Use **NVMeDataTypeLogPage** to get log pages (including SMART/health data).
 *   * Use **NVMeDataTypeFeature** to get features of the NVMe drive.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-storage_protocol_nvme_data_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_NVME_DATA_TYPE{

    /**
     * Unknown data type.
     * @type {Integer (Int32)}
     */
    static NVMeDataTypeUnknown => 0

    /**
     * Identify data type. This can be either Identify Controller data or Identify Namespace data. When this type of data is being queried, the ProtocolDataRequestValue field of [STORAGE_PROTOCOL_SPECIFIC_DATA](ns-winioctl-storage_protocol_specific_data.md) will have a value of **NVME_IDENTIFY_CNS_CONTROLLER** for adapter or **NVME_IDENTIFY_CNS_SPECIFIC_NAMESPACE** for namespace. If the ProtocolDataRequestValue is **NVME_IDENTIFY_CNS_SPECIFIC_NAMESPACE**, the ProtocolDataRequestSubValue field from the **STORAGE_PROTOCOL_SPECIFIC_DATA** structure will have a value of the namespace ID.
     * @type {Integer (Int32)}
     */
    static NVMeDataTypeIdentify => 1

    /**
     * Log page data type.
     * @type {Integer (Int32)}
     */
    static NVMeDataTypeLogPage => 2

    /**
     * Feature data type.
     * @type {Integer (Int32)}
     */
    static NVMeDataTypeFeature => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDataTypeLogPageEx => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVMeDataTypeFeatureEx => 5
}
