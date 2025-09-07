#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes protocol-specific device data, provided in the input and output buffer of an IOCTL_STORAGE_QUERY_PROPERTY request.
 * @remarks
 * When using <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> to retrieve protocol-specific information in the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_protocol_data_descriptor">STORAGE_PROTOCOL_DATA_DESCRIPTOR</a>, configure the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> structure as follows:
  * 
  * <ul>
  * <li>
  * Allocate a buffer that can contains both a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> and a <b>STORAGE_PROTOCOL_SPECIFIC_DATA</b> structure.
  * 
  * </li>
  * <li>
  * Set the <b>PropertyID</b>  field to <b>StorageAdapterProtocolSpecificProperty</b> or <b>StorageDeviceProtocolSpecificProperty</b> for a controller or device/namespace request, respectively.
  * 
  * </li>
  * <li>
  * Set the <b>QueryType</b>  field to <b>PropertyStandardQuery</b>.
  * 
  * </li>
  * <li>
  * Fill the <b>STORAGE_PROTOCOL_SPECIFIC_DATA</b> structure with the desired values. The start of the <b>STORAGE_PROTOCOL_SPECIFIC_DATA</b> is the <b>AdditionalParameters</b> field of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a>.
  * 
  * </li>
  * </ul>
  * To specify a type of NVMe protocol-specific information,  configure the <b>STORAGE_PROTOCOL_SPECIFIC_DATA</b> structure as follows:
  * 
  * <ul>
  * <li>
  * Set the <b>ProtocolType</b>  field to <b>ProtocolTypeNVMe</b>.
  * 
  * </li>
  * <li>
  * Set the <b>DataType</b>  field to an enumeration value defined by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_nvme_data_type">STORAGE_PROTOCOL_NVME_DATA_TYPE</a>:<ul>
  * <li>Use <b>NVMeDataTypeIdentify</b> to get Identify Controller data or Identify Namespace data.</li>
  * <li>Use <b>NVMeDataTypeLogPage</b> to get log pages (including SMART/health data).</li>
  * <li>Use <b>NVMeDataTypeFeature</b> to get features of the NVMe drive.</li>
  * </ul>
  * 
  * 
  * </li>
  * </ul>
  * To specify a type of ATA protocol-specific information,  configure the <b>STORAGE_PROTOCOL_SPECIFIC_DATA</b> structure as follows:
  * 
  * <ul>
  * <li>
  * Set the <b>ProtocolType</b>  field to <b>ProtocolTypeAta</b>.
  * 
  * </li>
  * <li>
  * Set the <b>DataType</b>  field to an enumeration value defined by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_ata_data_type">STORAGE_PROTOCOL_ATA_DATA_TYPE</a>:<ul>
  * <li>Use <b>AtaDataTypeIdentify</b> to identify the ATA drive.</li>
  * <li>Use <b>AtaDataTypeLogPage</b> to get log pages from the ATA drive.</li>
  * </ul>
  * 
  * 
  * </li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_protocol_specific_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_SPECIFIC_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * The protocol type. Values for this member are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a> enumeration.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The protocol data type. Data types are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_nvme_data_type">STORAGE_PROTOCOL_NVME_DATA_TYPE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_ata_data_type">STORAGE_PROTOCOL_ATA_DATA_TYPE</a> enumerations.
     * @type {Integer}
     */
    DataType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The protocol data request value.
     * @type {Integer}
     */
    ProtocolDataRequestValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The sub value of the protocol data request.
     * @type {Integer}
     */
    ProtocolDataRequestSubValue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The offset of the data buffer that is from the beginning of this structure. The typical value can be sizeof(<b>STORAGE_PROTOCOL_SPECIFIC_DATA</b>).
     * @type {Integer}
     */
    ProtocolDataOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The length of the protocol data.
     * @type {Integer}
     */
    ProtocolDataLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The returned data.
     * @type {Integer}
     */
    FixedProtocolReturnData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    ProtocolDataRequestSubValue2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    ProtocolDataRequestSubValue3 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ProtocolDataRequestSubValue4 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
