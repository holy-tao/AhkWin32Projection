#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the action to be taken by an application in response to ISyncCallback::OnFullEnumerationNeeded.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ne-winsync-sync_full_enumeration_action
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_FULL_ENUMERATION_ACTION{

    /**
     * Perform a full enumeration. This is the default option when the application does not register an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isynccallback">ISyncCallback</a> interface.
     * @type {Integer (Int32)}
     */
    static SFEA_FULL_ENUMERATION => 0

    /**
     * Perform a partial synchronization. When this option is specified, the learned knowledge is applied as single item exceptions.
     * @type {Integer (Int32)}
     */
    static SFEA_PARTIAL_SYNC => 1

    /**
     * Cancel the synchronization session. All methods will return errors as if they were canceled.
     * @type {Integer (Int32)}
     */
    static SFEA_ABORT => 2
}
