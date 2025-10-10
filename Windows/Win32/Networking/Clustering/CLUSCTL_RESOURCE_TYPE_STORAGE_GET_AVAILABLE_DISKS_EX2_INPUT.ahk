#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an input buffer for the CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT control code.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusctl_resource_type_storage_get_available_disks_ex2_input
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A bifmask of flags that specifies settings for the operation.
     * 
     * 
     * This member can contain the following values:
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A storage pool <b>GUID</b> that filters the results.
     * @type {Pointer<Guid>}
     */
    guidPoolFilter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
