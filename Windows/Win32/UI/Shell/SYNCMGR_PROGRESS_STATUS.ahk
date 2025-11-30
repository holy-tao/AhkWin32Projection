#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the current progress status of a synchronization process. Used by ISyncMgrSyncCallback::ReportProgress.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_progress_status
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_PROGRESS_STATUS extends Win32Enum{

    /**
     * The progress status is currently being updated by the handler.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_UPDATING => 1

    /**
     * Ignore step parameters. The progress bar cycles from left to right on a timer internal to the sync folder. This is known as marquee mode.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_UPDATING_INDETERMINATE => 2

    /**
     * The synchronization is complete.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_SUCCEEDED => 3

    /**
     * Indicates something went wrong during the synchronization.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_FAILED => 4

    /**
     * The user canceled the synchronization before it completed. Upon receipt of this value, Sync Center updates the UI and enables the option to restart the sync for that item.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_CANCELED => 5

    /**
     * The device being synchronized was disconnected before the sync completed..
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_DISCONNECTED => 6

    /**
     * Used only to declare the largest valid value in this enumeration. Do not use with <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportprogress">ISyncMgrSyncCallback::ReportProgress</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PS_MAX => 6
}
