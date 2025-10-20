#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get and set information about sync manager conflict resolution.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrConflictResolveInfo extends IUnknown{
    /**
     * The interface identifier for ISyncMgrConflictResolveInfo
     * @type {Guid}
     */
    static IID => Guid("{c405a219-25a2-442e-8743-b845a2cee93f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pnCurrentConflict 
     * @param {Pointer<UInt32>} pcConflicts 
     * @param {Pointer<UInt32>} pcRemainingForApplyToAll 
     * @returns {HRESULT} 
     */
    GetIterationInfo(pnCurrentConflict, pcConflicts, pcRemainingForApplyToAll) {
        result := ComCall(3, this, "uint*", pnCurrentConflict, "uint*", pcConflicts, "uint*", pcRemainingForApplyToAll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnPresenterNextStep 
     * @returns {HRESULT} 
     */
    GetPresenterNextStep(pnPresenterNextStep) {
        result := ComCall(4, this, "int*", pnPresenterNextStep, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnPresenterChoice 
     * @param {Pointer<BOOL>} pfApplyToAll 
     * @returns {HRESULT} 
     */
    GetPresenterChoice(pnPresenterChoice, pfApplyToAll) {
        result := ComCall(5, this, "int*", pnPresenterChoice, "ptr", pfApplyToAll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcChoices 
     * @returns {HRESULT} 
     */
    GetItemChoiceCount(pcChoices) {
        result := ComCall(6, this, "uint*", pcChoices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iChoice 
     * @param {Pointer<UInt32>} piChoiceIndex 
     * @returns {HRESULT} 
     */
    GetItemChoice(iChoice, piChoiceIndex) {
        result := ComCall(7, this, "uint", iChoice, "uint*", piChoiceIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nPresenterNextStep 
     * @returns {HRESULT} 
     */
    SetPresenterNextStep(nPresenterNextStep) {
        result := ComCall(8, this, "int", nPresenterNextStep, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nPresenterChoice 
     * @param {BOOL} fApplyToAll 
     * @returns {HRESULT} 
     */
    SetPresenterChoice(nPresenterChoice, fApplyToAll) {
        result := ComCall(9, this, "int", nPresenterChoice, "int", fApplyToAll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} prgiConflictItemIndexes 
     * @param {Integer} cChoices 
     * @returns {HRESULT} 
     */
    SetItemChoices(prgiConflictItemIndexes, cChoices) {
        result := ComCall(10, this, "uint*", prgiConflictItemIndexes, "uint", cChoices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
