#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CS_DES structure is used for specifying a resource list that describes device class-specific resource usage for a device instance. For more information about resource lists, see Hardware Resources.
 * @remarks
 * The data block identified by <b>CSD_LegacyDataSize</b> and <b>CSD_LegacyDataOffset</b> can contain legacy, class-specific data, as stored in the <b>DeviceSpecificData</b> member of a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/ns-wdm-_cm_partial_resource_descriptor">CM_PARTIAL_RESOURCE_DESCRIPTOR</a> structure, if the structure's <b>Type</b> member is <b>CmResourceTypeDeviceSpecific</b>.
  * 
  * The class-specific signature identified by <b>CSD_SignatureLength</b> and <b>CSD_Signature</b> can contain additional class-specific device identification information.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cs_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CS_DES extends Win32Struct
{
    static sizeof => 25

    static packingSize => 1

    /**
     * The number of elements in the byte array specified by <b>CSD_Signature</b>.
     * @type {Integer}
     */
    CSD_SignatureLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Offset, in bytes, from the beginning of the <b>CSD_Signature</b> array to the beginning of a block of data. For example, if the data block follows the signature array, and if the signature array length is 16 bytes, then the value for <b>CSD_LegacyDataOffset</b> should be 16.
     * @type {Integer}
     */
    CSD_LegacyDataOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Length, in bytes, of the data block whose offset is specified by <b>CSD_LegacyDataOffset</b>.
     * @type {Integer}
     */
    CSD_LegacyDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <i>Not used.</i>
     * @type {Integer}
     */
    CSD_Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A globally unique identifier (GUID) identifying a <a href="https://docs.microsoft.com/windows-hardware/drivers/install/overview-of-device-setup-classes">device setup class</a>. If both <b>CSD_SignatureLength</b> and <b>CSD_LegacyDataSize</b> are zero, the GUID is null.
     * @type {Pointer<Guid>}
     */
    CSD_ClassGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A byte array containing a class-specific signature.
     * @type {Array<Byte>}
     */
    CSD_Signature{
        get {
            if(!this.HasProp("__CSD_SignatureProxyArray"))
                this.__CSD_SignatureProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__CSD_SignatureProxyArray
        }
    }
}
