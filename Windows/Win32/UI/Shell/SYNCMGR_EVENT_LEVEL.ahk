#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of event being reported to Sync Center.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_event_level
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_EVENT_LEVEL extends Win32Enum{

    /**
     * The event is informational in nature and will be displayed with the appropriate icon.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EL_INFORMATION => 1

    /**
     * The event is a warning and will be displayed with the appropriate icon.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EL_WARNING => 2

    /**
     * The event is an error and will be displayed with the appropriate icon. Additionally, this event will be included in the count of errors reported to the handler or item when it is displayed in the folder as well as to the sync tray icon.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EL_ERROR => 3

    /**
     * Used only to declare the largest valid value in this enumeration. Do not use with <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynccallback-reportevent">ISyncMgrSyncCallback::ReportEvent</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EL_MAX => 3
}
