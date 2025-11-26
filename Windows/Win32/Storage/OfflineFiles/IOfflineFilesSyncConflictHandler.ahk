#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by a client calling the IOfflineFilesCache::Synchronize method to prescribe a conflict resolution strategy for sync conflicts as they are detected.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessyncconflicthandler
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSyncConflictHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesSyncConflictHandler
     * @type {Guid}
     */
    static IID => Guid("{b6dd5092-c65c-46b6-97b8-fadd08e7e1be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveConflict"]

    /**
     * Provides a resolution decision for a sync conflict.
     * @param {PWSTR} pszPath The fully qualified UNC path of the item in conflict.
     * @param {Integer} fStateKnown Indicates if the sync state was based on the client state, server state, or both.  This parameter can be one or both of the following flag values.
     * @param {Integer} state A value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_state">OFFLINEFILES_SYNC_STATE</a> enumeration indicating the state of the item in conflict.
     * @param {Integer} fChangeDetails In cases where the <i>state</i> code indicates a change in item state, this value describes the change in further detail.  The value can be either <b>OFFLINEFILES_CHANGES_NONE</b> (0x00000000) or one or more of the following flag values:
     * @param {Pointer<Integer>} pConflictResolution Receives the desired resolution code.  Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_conflict_resolve">OFFLINEFILES_SYNC_CONFLICT_RESOLVE</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilessyncconflicthandler-resolveconflict
     */
    ResolveConflict(pszPath, fStateKnown, state, fChangeDetails, pConflictResolution, ppszNewName) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pConflictResolutionMarshal := pConflictResolution is VarRef ? "int*" : "ptr"
        ppszNewNameMarshal := ppszNewName is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pszPath, "uint", fStateKnown, "int", state, "uint", fChangeDetails, pConflictResolutionMarshal, pConflictResolution, ppszNewNameMarshal, ppszNewName, "HRESULT")
        return result
    }
}
