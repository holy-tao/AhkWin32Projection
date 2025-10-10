#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of information that is included in a change batch during filtered synchronization.
 * @remarks
 * 
  * A replica that does not keep ghosts for items that are not in the filter indicates this by using <b>FT_CURRENT_ITEMS_ONLY</b>.
  * 
  * <div class="alert"><b>Note</b>  An item that is excluded by the filter in one replica, but is still tracked in the other replica is known as a "ghost".</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ne-winsync-filtering_type
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class FILTERING_TYPE{

    /**
     * The change batch includes data and metadata for items that are currently in the filter.
     * @type {Integer (Int32)}
     */
    static FT_CURRENT_ITEMS_ONLY => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FT_CURRENT_ITEMS_AND_VERSIONS_FOR_MOVED_OUT_ITEMS => 1
}
