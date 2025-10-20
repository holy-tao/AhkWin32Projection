#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manage synchronizing conflicts. Implement this interface to construct a sync conflict handler. The conflict resolution user interface (UI) will call this interface to resolve the conflict presented to the user.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrresolutionhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrResolutionHandler extends IUnknown{
    /**
     * The interface identifier for ISyncMgrResolutionHandler
     * @type {Guid}
     */
    static IID => Guid("{40a3d052-8bff-4c4b-a338-d4a395700de9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwAbilities 
     * @returns {HRESULT} 
     */
    QueryAbilities(pdwAbilities) {
        result := ComCall(3, this, "uint*", pdwAbilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psiOther 
     * @param {Pointer<Int32>} pFeedback 
     * @returns {HRESULT} 
     */
    KeepOther(psiOther, pFeedback) {
        result := ComCall(4, this, "ptr", psiOther, "int*", pFeedback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFeedback 
     * @returns {HRESULT} 
     */
    KeepRecent(pFeedback) {
        result := ComCall(5, this, "int*", pFeedback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFeedback 
     * @returns {HRESULT} 
     */
    RemoveFromSyncSet(pFeedback) {
        result := ComCall(6, this, "int*", pFeedback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrConflictResolutionItems>} pArray 
     * @param {Pointer<Int32>} pFeedback 
     * @returns {HRESULT} 
     */
    KeepItems(pArray, pFeedback) {
        result := ComCall(7, this, "ptr", pArray, "int*", pFeedback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
