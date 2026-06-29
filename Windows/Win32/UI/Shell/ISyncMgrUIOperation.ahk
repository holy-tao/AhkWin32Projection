#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method through which a sync handler or sync item can display a UI object when requested to do so by Sync Center.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgruioperation
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrUIOperation extends IUnknown {
    /**
     * The interface identifier for ISyncMgrUIOperation
     * @type {Guid}
     */
    static IID := Guid("{fc7cfa47-dfe1-45b5-a049-8cfd82bec271}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrUIOperation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Run : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrUIOperation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs the actual display of UI for a handler or sync item when requested to do so by Sync Center.
     * @remarks
     * The handler itself, not the UI, is expected to use the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrcontrol">ISyncMgrControl</a> interface to notify Sync Center of changes to its state that come about through choices made by the user in the UI.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the window used to display the UI.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. Returns S_FALSE or another error code if this method is called to confirm an operation, such as activating a handler or disabling a sync item, but that operation should not be executed.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgruioperation-run
     */
    Run(hwndOwner) {
        result := ComCall(3, this, HWND, hwndOwner, Int32)
        return result
    }

    Query(iid) {
        if (ISyncMgrUIOperation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Run := CallbackCreate(GetMethod(implObj, "Run"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Run)
    }
}
