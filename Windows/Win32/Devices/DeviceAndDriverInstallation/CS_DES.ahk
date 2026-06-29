#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The CS_DES structure is used for specifying a resource list that describes device class-specific resource usage for a device instance. For more information about resource lists, see Hardware Resources.
 * @remarks
 * The data block identified by <b>CSD_LegacyDataSize</b> and <b>CSD_LegacyDataOffset</b> can contain legacy, class-specific data, as stored in the <b>DeviceSpecificData</b> member of a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/ns-wdm-_cm_partial_resource_descriptor">CM_PARTIAL_RESOURCE_DESCRIPTOR</a> structure, if the structure's <b>Type</b> member is <b>CmResourceTypeDeviceSpecific</b>.
 * 
 * The class-specific signature identified by <b>CSD_SignatureLength</b> and <b>CSD_Signature</b> can contain additional class-specific device identification information.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cs_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CS_DES {
    #StructPack 4

    /**
     * The number of elements in the byte array specified by <b>CSD_Signature</b>.
     */
    CSD_SignatureLength : UInt32

    /**
     * Offset, in bytes, from the beginning of the <b>CSD_Signature</b> array to the beginning of a block of data. For example, if the data block follows the signature array, and if the signature array length is 16 bytes, then the value for <b>CSD_LegacyDataOffset</b> should be 16.
     */
    CSD_LegacyDataOffset : UInt32

    /**
     * Length, in bytes, of the data block whose offset is specified by <b>CSD_LegacyDataOffset</b>.
     */
    CSD_LegacyDataSize : UInt32

    /**
     * <i>Not used.</i>
     */
    CSD_Flags : UInt32

    /**
     * A globally unique identifier (GUID) identifying a <a href="https://docs.microsoft.com/windows-hardware/drivers/install/overview-of-device-setup-classes">device setup class</a>. If both <b>CSD_SignatureLength</b> and <b>CSD_LegacyDataSize</b> are zero, the GUID is null.
     */
    CSD_ClassGuid : Guid

    /**
     * A byte array containing a class-specific signature.
     */
    CSD_Signature : Int8[1]

}
