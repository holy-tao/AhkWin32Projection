#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the capabilities of a handler regarding the actions that can be performed against it.
 * @remarks
 * Sync Center queries the handler for its capabilities through <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a> whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandler">ISyncMgrControl::UpdateHandler</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updatehandlercollection">ISyncMgrControl::UpdateHandlerCollection</a> method is called.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_HANDLER_CAPABILITIES extends Win32Enum{

    /**
     * No capability flags are set.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_NONE => 0

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_Icon flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iextracticona">IExtractIcon</a>. Generally, this value should not be returned if possible.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_PROVIDES_ICON => 1

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_EventStore flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgreventstore">ISyncMgrEventStore</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_EVENT_STORE => 2

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_ConflictStore flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictstore">ISyncMgrConflictStore</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_CONFLICT_STORE => 4

    /**
     * If a handler sets this flag in the mask returned from the handler's <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a> method, it indicates that the handler plans to create multiple simultaneous synchronization sessions using <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsessioncreator-createsession">ISyncMgrSessionCreator::CreateSession</a>. This is useful for handlers that implement a background synchronization architecture in which the handler simply signals another process to perform the synchronization rather than performing the synchronization in its <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">ISyncMgrHandler::Synchronize</a> method directly. This allows synchronization engines to report progress, conflicts, and events (through <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynccallback">ISyncMgrSyncCallback</a>) when synchronization requests come from sources other than Sync Center. For example, this could be the result of a data change notification or through application-specific UI. If more than one session is synchronizing the same item, then the progress for that item will be reported as indeterminate.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_SUPPORTS_CONCURRENT_SESSIONS => 16

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_BrowseContent flag. If this value is set, the <b>Browse Content</b> task is added to the handler's shortcut menu. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_CAN_BROWSE_CONTENT => 65536

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_ShowSchedule flag. If this value is set, the <b>Show Schedule</b> task is added to the handler's shortcut menu. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a>. This value is used by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrschedulewizarduioperation">ISyncMgrScheduleWizardUIOperation</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_CAN_SHOW_SCHEDULE => 131072

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeActivate flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_QUERY_BEFORE_ACTIVATE => 1048576

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeDeactivate flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_QUERY_BEFORE_DEACTIVATE => 2097152

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeEnable flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_QUERY_BEFORE_ENABLE => 4194304

    /**
     * The handler returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeDisable flag. The object returned from <b>ISyncMgrHandler::GetObject</b> must implement <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgruioperation">ISyncMgrUIOperation</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_QUERY_BEFORE_DISABLE => 8388608

    /**
     * A mask used to determine valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities">SYNCMGR_HANDLER_CAPABILITIES</a> flags. Compare against the value retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getcapabilities">ISyncMgrHandler::GetCapabilities</a> to verify valid results.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HCM_VALID_MASK => 15925271
}
