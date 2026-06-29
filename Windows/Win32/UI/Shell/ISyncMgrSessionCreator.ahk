#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncMgrSyncCallback.ahk" { ISyncMgrSyncCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a single method through which a handler or external application can notify Sync Center that synchronization has begun, as well as report progress and events.
 * @remarks
 * This interface is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandler-synchronize">ISyncMgrHandler::Synchronize</a>. The handler can choose to create a session in its <b>Synchronize</b> implementation. This allows the handler to report progress and events itself or to signal a background process to report progress and events itself.
 * 
 *                 
 * 
 * Alternatively, the handler can choose to signal an external process to create a CLSID_SyncMgrClient object. If a handler is implemented to perform automatic synchronizations in an external process such as a service, it must be able to provide progress reports to Sync Center so that Sync Center can update the UI for the user. The handler also must be able to add events to Sync Center's <b>Sync Results</b> folder. An external process creates the CLSID_SyncMgrClient object by passing the CLSCTX_SERVER flag and the <b>ISyncMgrSessionCreator</b> IID to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. This allows that process to report progress and events as well as to ask Sync Center whether the user canceled the synchronization. Note, however, that <b>ISyncMgrSessionCreator</b> cannot be marshaled to an external process.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrSessionCreator extends IUnknown {
    /**
     * The interface identifier for ISyncMgrSessionCreator
     * @type {Guid}
     */
    static IID := Guid("{17f48517-f305-4321-a08d-b25a834918fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrSessionCreator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrSessionCreator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Sync Center that synchronization of the specified items has begun.
     * @remarks
     * Both <i>pszHandlerID</i> and <i>ppszItemIDs</i> must be specified.
     * @param {PWSTR} pszHandlerID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the unique ID of the handler. This string is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Pointer<PWSTR>} ppszItemIDs Type: <b>LPCWSTR*</b>
     * 
     * The address of a pointer to a buffer containing an array of item IDs, managed by the handler specified in <i>pszHandlerID</i>, to be synchronized. Each ID is of maximum length MAX_SYNCMGR_ID including the terminating <b>null</b> character.
     * @param {Integer} cItems Type: <b>ULONG</b>
     * 
     * The number of item IDs contained in the buffer referenced in <i>ppszItemIDs</i>.
     * @returns {ISyncMgrSyncCallback} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynccallback">ISyncMgrSyncCallback</a>**</b>
     * 
     * The address of a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsynccallback">ISyncMgrSyncCallback</a> used to report progress and events. This value can be <b>NULL</b> if no callback is needed.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrsessioncreator-createsession
     */
    CreateSession(pszHandlerID, ppszItemIDs, cItems) {
        pszHandlerID := pszHandlerID is String ? StrPtr(pszHandlerID) : pszHandlerID

        ppszItemIDsMarshal := ppszItemIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszHandlerID, ppszItemIDsMarshal, ppszItemIDs, "uint", cItems, "ptr*", &ppCallback := 0, "HRESULT")
        return ISyncMgrSyncCallback(ppCallback)
    }

    Query(iid) {
        if (ISyncMgrSessionCreator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSession := CallbackCreate(GetMethod(implObj, "CreateSession"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSession)
    }
}
