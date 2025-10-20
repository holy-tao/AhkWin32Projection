#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method through which a sync handler or sync item can display a UI object when requested to do so by Sync Center.
 * @remarks
 * 
  * Handlers implement <b>ISyncMgrUIOperation</b> to provide UI for a particular action. Each separate action (browse, schedule, enable/disable, activate/deactivate, and delete) requires a separate implementation.
  * 
  * A handler should only implement this interface for operations for which it wants to present UI.
  * 
  * The following summarizes the steps Sync Center takes to instantiate and use this interface.
  *             
  *                 
  * 
  * <ol>
  * <li>Sync Center creates a separate thread for the UI operation.</li>
  * <li>Sync Center creates a new instance of the handler.</li>
  * <li>If the operation involves only a handler, Sync Center calls <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-getobject">ISyncMgrHandler::GetObject</a> with the appropriate <b>SYNCMGR_OBJECTID</b> object ID to obtain a pointer to the <b>ISyncMgrUIOperation</b> that implements that UI object. For example, Sync Center calls <b>ISyncMgrHandler::GetObject</b> with <b>SYNCMGR_OBJECTID_QueryBeforeDelete</b> to obtain an object that is called to display UI when the user chooses to delete the handler, asking for a confirmation that they do indeed want to delete it.</li>
  * <li>If the operation involves a sync item, Sync Center makes a series of calls, including the following: 
  *                         <ol>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> is called on the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a> interface to retrieve an instance of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitemcontainer">ISyncMgrSyncItemContainer</a>.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitemcontainer-getsyncitem">ISyncMgrSyncItemContainer::GetSyncItem</a> is called to obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a> instance representing the item.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> is called with the appropriate <b>SYNCMGR_OBJECTID</b> object ID to obtain a pointer to the <b>ISyncMgrUIOperation</b> that implements the UI object.</li>
  * </ol>
  * </li>
  * <li>Sync Center calls the UI object's <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgruioperation-run">Run</a> method to display the UI.</li>
  * </ol>
  * By implementing the UI as a separate interface, the display of the UI can be performed independently of synchronization. <b>ISyncMgrUIOperation</b> should be implemented on a different object than either <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a> or <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a>.
  * 
  * If the user requests an action, then requests that same action again before the first has completed, the UI for the initial action is activated and brought to the foreground.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgruioperation
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrUIOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrUIOperation
     * @type {Guid}
     */
    static IID => Guid("{fc7cfa47-dfe1-45b5-a049-8cfd82bec271}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Run"]

    /**
     * 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgruioperation-run
     */
    Run(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hwndOwner, "int")
        return result
    }
}
