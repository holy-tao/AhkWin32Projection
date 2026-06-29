#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in a CF_OPERATION_INFO structure to describe the status of a specified sync root.
 * @remarks
 * If a null pointer is set in the *SyncStatus* field of a [CF_OPERATION_INFO](ns-cfapi-cf_operation_info.md) structure, the platform will clear the previously set sync status, if there is one.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_status
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_SYNC_STATUS {
    #StructPack 4

    /**
     * The size, in bytes, of the sync status structure, including the actual description string.
     */
    StructSize : UInt32

    /**
     * The use of this parameter is completely up to the sync provider that supports this rich sync status construct.
     * 
     * For a particular sync provider, it is expected that there is a 1:1 mapping between the code and the description string.
     * 
     * It is recommended that you use the highest bit order to describe the type of error code: `1` for an error-level code, and `0` for an information-level code.
     * 
     * >[!NOTE]
     * >*Code* is opaque to the platform, and is used only for tracking purposes.
     */
    Code : UInt32

    /**
     * The offset of the description string relative to the start of **CF_SYNC_STATUS**. It points to a localized null-terminated wide string that is expected to contain more meaningful and actionable information about the file in question. Sync providers are expected to balance the requirement of providing more actionable information and maintaining an as small as possible memory footprint.
     */
    DescriptionOffset : UInt32

    /**
     * The size of the description string, in bytes, that includes the null terminator.
     */
    DescriptionLength : UInt32

    /**
     * The offset of a device id blob relative to the start of **CF_SYNC_STATUS**. The device id blob is optional and opaque to the platform. The blob is expected to be unique on a per device basis. If provided, the blob will be collected as part of the platform telemetry to help diagnose technical issues.
     */
    DeviceIdOffset : UInt32

    /**
     * The size of the device id blob, in bytes.
     */
    DeviceIdLength : UInt32

}
