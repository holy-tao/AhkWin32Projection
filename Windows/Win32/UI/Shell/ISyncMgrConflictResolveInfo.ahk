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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIterationInfo", "GetPresenterNextStep", "GetPresenterChoice", "GetItemChoiceCount", "GetItemChoice", "SetPresenterNextStep", "SetPresenterChoice", "SetItemChoices"]

    /**
     * 
     * @param {Pointer<Integer>} pnCurrentConflict 
     * @param {Pointer<Integer>} pcConflicts 
     * @param {Pointer<Integer>} pcRemainingForApplyToAll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getiterationinfo
     */
    GetIterationInfo(pnCurrentConflict, pcConflicts, pcRemainingForApplyToAll) {
        pnCurrentConflictMarshal := pnCurrentConflict is VarRef ? "uint*" : "ptr"
        pcConflictsMarshal := pcConflicts is VarRef ? "uint*" : "ptr"
        pcRemainingForApplyToAllMarshal := pcRemainingForApplyToAll is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pnCurrentConflictMarshal, pnCurrentConflict, pcConflictsMarshal, pcConflicts, pcRemainingForApplyToAllMarshal, pcRemainingForApplyToAll, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getpresenternextstep
     */
    GetPresenterNextStep() {
        result := ComCall(4, this, "int*", &pnPresenterNextStep := 0, "HRESULT")
        return pnPresenterNextStep
    }

    /**
     * 
     * @param {Pointer<Integer>} pnPresenterChoice 
     * @param {Pointer<BOOL>} pfApplyToAll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getpresenterchoice
     */
    GetPresenterChoice(pnPresenterChoice, pfApplyToAll) {
        pnPresenterChoiceMarshal := pnPresenterChoice is VarRef ? "int*" : "ptr"
        pfApplyToAllMarshal := pfApplyToAll is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pnPresenterChoiceMarshal, pnPresenterChoice, pfApplyToAllMarshal, pfApplyToAll, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoicecount
     */
    GetItemChoiceCount() {
        result := ComCall(6, this, "uint*", &pcChoices := 0, "HRESULT")
        return pcChoices
    }

    /**
     * 
     * @param {Integer} iChoice 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoice
     */
    GetItemChoice(iChoice) {
        result := ComCall(7, this, "uint", iChoice, "uint*", &piChoiceIndex := 0, "HRESULT")
        return piChoiceIndex
    }

    /**
     * 
     * @param {Integer} nPresenterNextStep 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setpresenternextstep
     */
    SetPresenterNextStep(nPresenterNextStep) {
        result := ComCall(8, this, "int", nPresenterNextStep, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPresenterChoice 
     * @param {BOOL} fApplyToAll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setpresenterchoice
     */
    SetPresenterChoice(nPresenterChoice, fApplyToAll) {
        result := ComCall(9, this, "int", nPresenterChoice, "int", fApplyToAll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prgiConflictItemIndexes 
     * @param {Integer} cChoices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setitemchoices
     */
    SetItemChoices(prgiConflictItemIndexes, cChoices) {
        prgiConflictItemIndexesMarshal := prgiConflictItemIndexes is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, prgiConflictItemIndexesMarshal, prgiConflictItemIndexes, "uint", cChoices, "HRESULT")
        return result
    }
}
