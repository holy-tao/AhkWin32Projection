#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for the Changed Namespace List log page that describes namespaces in the controller that have changed [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) information since the last time the log page was read.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_changed_namespace_list_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CHANGED_NAMESPACE_LIST_LOG extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 4

    /**
     * Specifies a list of Namespace IDs with up to 1024 entries.
     * 
     * If more than 1024 namespaces have changed attributes since the last time the log page was read, the first entry in the log page will be set to `FFFFFFFFh` and the remainder of the list will be zero filled.
     * @type {Array<UInt32>}
     */
    NSID{
        get {
            if(!this.HasProp("__NSIDProxyArray"))
                this.__NSIDProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__NSIDProxyArray
        }
    }
}
