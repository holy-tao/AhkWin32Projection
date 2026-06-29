#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains data for the Changed Namespace List log page that describes namespaces in the controller that have changed [Identify Namespace](../nvme/ns-nvme-nvme_identify_namespace_data.md) information since the last time the log page was read.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_changed_namespace_list_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CHANGED_NAMESPACE_LIST_LOG {
    #StructPack 4

    /**
     * Specifies a list of Namespace IDs with up to 1024 entries.
     * 
     * If more than 1024 namespaces have changed attributes since the last time the log page was read, the first entry in the log page will be set to `FFFFFFFFh` and the remainder of the list will be zero filled.
     */
    NSID : UInt32[1024]

}
