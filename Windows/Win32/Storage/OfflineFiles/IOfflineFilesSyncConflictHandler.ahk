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
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} fStateKnown 
     * @param {Integer} state 
     * @param {Integer} fChangeDetails 
     * @param {Pointer<Integer>} pConflictResolution 
     * @param {Pointer<PWSTR>} ppszNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessyncconflicthandler-resolveconflict
     */
    ResolveConflict(pszPath, fStateKnown, state, fChangeDetails, pConflictResolution, ppszNewName) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pConflictResolutionMarshal := pConflictResolution is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pszPath, "uint", fStateKnown, "int", state, "uint", fChangeDetails, pConflictResolutionMarshal, pConflictResolution, "ptr", ppszNewName, "HRESULT")
        return result
    }
}
