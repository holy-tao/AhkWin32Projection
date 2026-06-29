#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OFFLINEFILES_SYNC_CONFLICT_RESOLVE.ahk" { OFFLINEFILES_SYNC_CONFLICT_RESOLVE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\OFFLINEFILES_SYNC_STATE.ahk" { OFFLINEFILES_SYNC_STATE }

/**
 * Used by a client calling the IOfflineFilesCache::Synchronize method to prescribe a conflict resolution strategy for sync conflicts as they are detected.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilessyncconflicthandler
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesSyncConflictHandler extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesSyncConflictHandler
     * @type {Guid}
     */
    static IID := Guid("{b6dd5092-c65c-46b6-97b8-fadd08e7e1be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesSyncConflictHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResolveConflict : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesSyncConflictHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a resolution decision for a sync conflict.
     * @param {PWSTR} pszPath The fully qualified UNC path of the item in conflict.
     * @param {Integer} fStateKnown Indicates if the sync state was based on the client state, server state, or both.  This parameter can be one or both of the following flag values.
     * @param {OFFLINEFILES_SYNC_STATE} state A value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_state">OFFLINEFILES_SYNC_STATE</a> enumeration indicating the state of the item in conflict.
     * @param {Integer} fChangeDetails In cases where the <i>state</i> code indicates a change in item state, this value describes the change in further detail.  The value can be either <b>OFFLINEFILES_CHANGES_NONE</b> (0x00000000) or one or more of the following flag values:
     * @param {Pointer<OFFLINEFILES_SYNC_CONFLICT_RESOLVE>} pConflictResolution Receives the desired resolution code.  Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_conflict_resolve">OFFLINEFILES_SYNC_CONFLICT_RESOLVE</a> enumeration.
     * @param {Pointer<PWSTR>} ppszNewName If the value of the  <i>pConflictResolution</i> parameter is <b>OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPALLCHANGES</b>, the conflict handler must provide a new name for the item.  This new name is used for the new copies created remotely and locally.  Note that this is a file name, not a fully qualified path.
     * 
     * The name string must be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>.
     * 
     * This parameter may be <b>NULL</b> if a new name is not required by the resolution.
     * 
     * The Offline Files conflict handler used by Sync Center creates a name of the following format:
     * 
     * &lt;original name&gt; (&lt;user name&gt; v<i>N</i>).&lt;original ext&gt;
     * 
     * where <i>N</i> is a version number. Therefore, if the original file name is "samples.doc" and the user's name is "Alice", the new file name will be:
     * 
     * "samples (Alice v1).doc"
     * 
     * If a file of that name exists the Offline Files conflict handler increments <i>N</i> until a unique name is found, for example:
     * 
     * <ul>
     * <li>samples (Alice v2).doc</li>
     * <li>samples (Alice v3).doc</li>
     * </ul>
     * This description is provided only to illustrate how the Offline Files conflict handler in Sync Center creates new file names.  An implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilessyncconflicthandler">IOfflineFilesSyncConflictHandler</a> is free to use any name format that it wishes to define.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncconflicthandler-resolveconflict
     */
    ResolveConflict(pszPath, fStateKnown, state, fChangeDetails, pConflictResolution, ppszNewName) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pConflictResolutionMarshal := pConflictResolution is VarRef ? "int*" : "ptr"
        ppszNewNameMarshal := ppszNewName is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszPath, "uint", fStateKnown, OFFLINEFILES_SYNC_STATE, state, "uint", fChangeDetails, pConflictResolutionMarshal, pConflictResolution, ppszNewNameMarshal, ppszNewName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesSyncConflictHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResolveConflict := CallbackCreate(GetMethod(implObj, "ResolveConflict"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResolveConflict)
    }
}
