#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in a CF_OPERATION_INFO structure to describe the status of a specified sync root.
 * @remarks
 * 
 * If a null pointer is set in the <b>SyncStatus</b> field of a  <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/ns-cfapi-cf_operation_info">CF_OPERATION_INFO</a> structure, the platform will clear the previously set sync status, if there is one.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_sync_status
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_STATUS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The size, in bytes, of the sync status structure, including the actual description string.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The use of this parameter is completely up to the sync provider that supports this rich sync status construct. 
     * 
     * For a particular sync provider, it is expected that there is a 1:1 mapping between the code and the description string.
     * 
     * It is recommended that you use the highest bit order to describe the type of error code: 1 for an error-level code, and 0 for an information-level code.
     * 
     * <div class="alert"><b>Note</b>  <b>Code</b> is opaque to the platform, and is used only for tracking purposes.</div>
     * <div> </div>
     * @type {Integer}
     */
    Code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset of the description string relative to the start of <b>CF_SYNC_STATUS</b>. It points to a localized null-terminated wide string that is expected to contain more meaningful and actionable information about the file in question. Sync providers are expected to balance the requirement of providing more actionable information and maintaining an as small as possible memory footprint.
     * @type {Integer}
     */
    DescriptionOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the description string, in bytes, that includes the null terminator.
     * @type {Integer}
     */
    DescriptionLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    DeviceIdOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    DeviceIdLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
