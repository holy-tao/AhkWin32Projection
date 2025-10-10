#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_PROTOCOL_SPECIFIC_DATA.ahk

/**
 * This structure is used in conjunction with IOCTL_STORAGE_QUERY_PROPERTY to return protocol-specific data from a storage device or adapter.
 * @remarks
 * 
  * When using <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> to retrieve protocol-specific information in the <b>STORAGE_PROTOCOL_DATA_DESCRIPTOR</b>, configure the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> structure as follows:
  * 
  * <ul>
  * <li>
  * Allocate a buffer that can contains both a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> and a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_protocol_specific_data">STORAGE_PROTOCOL_SPECIFIC_DATA</a> structure.
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
  * Fill the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_protocol_specific_data">STORAGE_PROTOCOL_SPECIFIC_DATA</a> structure with the desired values. The start of the <b>STORAGE_PROTOCOL_SPECIFIC_DATA</b> is the <b>AdditionalParameters</b> field of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a>.
  * 
  * </li>
  * </ul>
  * To specify a type of NVMe protocol-specific information,  configure the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_protocol_specific_data">STORAGE_PROTOCOL_SPECIFIC_DATA</a> structure as follows:
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
  * To specify a type of ATA protocol-specific information,  configure the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_protocol_specific_data">STORAGE_PROTOCOL_SPECIFIC_DATA</a> structure as follows:
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_protocol_data_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_DATA_DESCRIPTOR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The version of this structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total size of the descriptor, including the space for all protocol data.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The protocol-specific data, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_protocol_specific_data">STORAGE_PROTOCOL_SPECIFIC_DATA</a>.
     * @type {STORAGE_PROTOCOL_SPECIFIC_DATA}
     */
    ProtocolSpecificData{
        get {
            if(!this.HasProp("__ProtocolSpecificData"))
                this.__ProtocolSpecificData := STORAGE_PROTOCOL_SPECIFIC_DATA(this.ptr + 8)
            return this.__ProtocolSpecificData
        }
    }
}
