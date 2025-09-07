#Requires AutoHotkey v2.0.0 64-bit

/**
 * The SYNCMGRFLAG enumeration values are used in the ISyncMgrSynchronize::Initialize method to indicate how the synchronization event was initiated.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrflag
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGRFLAG{

    /**
     * Synchronization was initiated by a network connect event.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_CONNECT => 1

    /**
     * Synchronization was initiated by a pending network disconnect event.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_PENDINGDISCONNECT => 2

    /**
     * Synchronization was initiated manually by the end user.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_MANUAL => 3

    /**
     * Synchronization was programmatically invoked.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_IDLE => 4

    /**
     * Synchronization was programmatically invoked.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_INVOKE => 5

    /**
     * Synchronization was initiated by a scheduled update event.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_SCHEDULED => 6

    /**
     * Synchronization mask value.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_EVENTMASK => 255

    /**
     * Synchronization was initiated for configuration purposes only in the <b>System Properties</b> dialog box.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_SETTINGS => 256

    /**
     * Interaction with the user is permitted. The application is allowed to show user interface elements and interact with the user. If this flag is not set, the application must not display any user interface elements other than using the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a> interface. If an application cannot complete the synchronization without displaying user interface elements and this flag is not set, the application fails the synchronization.
     * @type {Integer (Int32)}
     */
    static SYNCMGRFLAG_MAYBOTHERUSER => 512
}
