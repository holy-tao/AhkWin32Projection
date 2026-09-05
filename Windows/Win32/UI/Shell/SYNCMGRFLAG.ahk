#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The SYNCMGRFLAG enumeration values are used in the ISyncMgrSynchronize::Initialize method to indicate how the synchronization event was initiated.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrflag
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGRFLAG extends Win32Enum {

    /**
     * Synchronization was initiated by a network connect event.
     * Native name: SYNCMGRFLAG_CONNECT
     * @type {Integer (Int32)}
     */
    static CONNECT => 1

    /**
     * Synchronization was initiated by a pending network disconnect event.
     * Native name: SYNCMGRFLAG_PENDINGDISCONNECT
     * @type {Integer (Int32)}
     */
    static PENDINGDISCONNECT => 2

    /**
     * Synchronization was initiated manually by the end user.
     * Native name: SYNCMGRFLAG_MANUAL
     * @type {Integer (Int32)}
     */
    static MANUAL => 3

    /**
     * Synchronization was programmatically invoked.
     * Native name: SYNCMGRFLAG_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 4

    /**
     * Synchronization was programmatically invoked.
     * Native name: SYNCMGRFLAG_INVOKE
     * @type {Integer (Int32)}
     */
    static INVOKE => 5

    /**
     * Synchronization was initiated by a scheduled update event.
     * Native name: SYNCMGRFLAG_SCHEDULED
     * @type {Integer (Int32)}
     */
    static SCHEDULED => 6

    /**
     * Synchronization mask value.
     * Native name: SYNCMGRFLAG_EVENTMASK
     * @type {Integer (Int32)}
     */
    static EVENTMASK => 255

    /**
     * Synchronization was initiated for configuration purposes only in the <b>System Properties</b> dialog box.
     * Native name: SYNCMGRFLAG_SETTINGS
     * @type {Integer (Int32)}
     */
    static SETTINGS => 256

    /**
     * Interaction with the user is permitted. The application is allowed to show user interface elements and interact with the user. If this flag is not set, the application must not display any user interface elements other than using the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback">ISyncMgrSynchronizeCallback</a> interface. If an application cannot complete the synchronization without displaying user interface elements and this flag is not set, the application fails the synchronization.
     * Native name: SYNCMGRFLAG_MAYBOTHERUSER
     * @type {Integer (Int32)}
     */
    static MAYBOTHERUSER => 512
}
