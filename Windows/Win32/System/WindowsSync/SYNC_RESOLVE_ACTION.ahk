#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents actions that are taken to resolve a specific concurrency conflict.
 * @remarks
 * 
 * The members of <b>SYNC_RESOLVE_ACTION</b> specify the action that the change applier uses to resolve a concurrency conflict. Concurrency conflicts occur when the same item or change unit is changed on two different replicas that are later synchronized.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ne-winsync-sync_resolve_action
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_RESOLVE_ACTION{

    /**
     * Ignore the conflict and do not apply the change. The change applier does not pass the conflict data to the destination provider.
     * @type {Integer (Int32)}
     */
    static SRA_DEFER => 0

    /**
     * The change made on the destination replica wins. Only version information for the item is updated in the metadata on the destination replica. No item data changes are made.
     * @type {Integer (Int32)}
     */
    static SRA_ACCEPT_DESTINATION_PROVIDER => 1

    /**
     * The change made on the source replica wins. The change is applied to the destination replica exactly like any non-conflicting change.
     * @type {Integer (Int32)}
     */
    static SRA_ACCEPT_SOURCE_PROVIDER => 2

    /**
     * Merge the data from the source item into the destination item. The destination provider combines the source item data and the destination item data, and applies the result to the destination replica.
     * @type {Integer (Int32)}
     */
    static SRA_MERGE => 3

    /**
     * Log the conflict and do not apply the change.
     * @type {Integer (Int32)}
     */
    static SRA_TRANSFER_AND_DEFER => 4

    /**
     * A placeholder for the last element in the enumeration. Do not use this value.
     * @type {Integer (Int32)}
     */
    static SRA_LAST => 5
}
