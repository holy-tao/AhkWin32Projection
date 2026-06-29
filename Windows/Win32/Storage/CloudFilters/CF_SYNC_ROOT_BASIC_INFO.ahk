#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Basic sync root information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_sync_root_basic_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_SYNC_ROOT_BASIC_INFO {
    #StructPack 8

    /**
     * The file ID of the sync root.
     */
    SyncRootFileId : Int64

}
