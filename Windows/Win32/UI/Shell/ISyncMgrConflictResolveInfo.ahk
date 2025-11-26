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
     * Gets information about which conflict in a set of conflicts is being resolved.
     * @param {Pointer<Integer>} pnCurrentConflict Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index of the conflict in the set that is being resolved.
     * @param {Pointer<Integer>} pcConflicts Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of conflicts that are being resolved.
     * @param {Pointer<Integer>} pcRemainingForApplyToAll Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of the remaining conflicts to which an "apply to all" response would be applied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getiterationinfo
     */
    GetIterationInfo(pnCurrentConflict, pcConflicts, pcRemainingForApplyToAll) {
        pnCurrentConflictMarshal := pnCurrentConflict is VarRef ? "uint*" : "ptr"
        pcConflictsMarshal := pcConflicts is VarRef ? "uint*" : "ptr"
        pcRemainingForApplyToAllMarshal := pcRemainingForApplyToAll is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pnCurrentConflictMarshal, pnCurrentConflict, pcConflictsMarshal, pcConflicts, pcRemainingForApplyToAllMarshal, pcRemainingForApplyToAll, "HRESULT")
        return result
    }

    /**
     * Gets what the presenter wants to do as the next step in the sync manager conflict resolution.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a>*</b>
     * 
     * When this method returns, contains a pointer to the next step in conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getpresenternextstep
     */
    GetPresenterNextStep() {
        result := ComCall(4, this, "int*", &pnPresenterNextStep := 0, "HRESULT")
        return pnPresenterNextStep
    }

    /**
     * Gets what kind of choice was made and whether to apply the choice to all subsequent conflicts in the set.
     * @param {Pointer<Integer>} pnPresenterChoice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a>*</b>
     * 
     * When this method returns, contains a pointer to the choice that was made about the conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a> enumeration.
     * @param {Pointer<BOOL>} pfApplyToAll Type: <b>BOOL*</b>
     * 
     * When this method returns, contains a pointer to a flag. If <b>TRUE</b>, then the given choice is to be applied to all subsequent conflicts in the set, and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoice">ISyncMgrConflictResolveInfo::GetItemChoice</a> and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoicecount">ISyncMgrConflictResolveInfo::GetItemChoiceCount</a> have information on how to apply this choice. Otherwise <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getpresenterchoice
     */
    GetPresenterChoice(pnPresenterChoice, pfApplyToAll) {
        pnPresenterChoiceMarshal := pnPresenterChoice is VarRef ? "int*" : "ptr"
        pfApplyToAllMarshal := pfApplyToAll is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pnPresenterChoiceMarshal, pnPresenterChoice, pfApplyToAllMarshal, pfApplyToAll, "HRESULT")
        return result
    }

    /**
     * Gets the number of items that the user wants to keep.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of items that the user wants to keep.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoicecount
     */
    GetItemChoiceCount() {
        result := ComCall(6, this, "uint*", &pcChoices := 0, "HRESULT")
        return pcChoices
    }

    /**
     * Gets the index of an item that the user wants to keep.
     * @param {Integer} iChoice Type: <b>UINT</b>
     * 
     * The item that the user wants to keep.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The index into the conflict's item array. This value is passed to the resolver for subsequent conflicts in the same conflict set if the user chooses to apply the same operation to all selected conflicts of the same type from the same handler.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoice
     */
    GetItemChoice(iChoice) {
        result := ComCall(7, this, "uint", iChoice, "uint*", &piChoiceIndex := 0, "HRESULT")
        return piChoiceIndex
    }

    /**
     * Sets what the presenter wants to do as the next step in the sync manager conflict resolution.
     * @param {Integer} nPresenterNextStep Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a></b>
     * 
     * The next step in the conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setpresenternextstep
     */
    SetPresenterNextStep(nPresenterNextStep) {
        result := ComCall(8, this, "int", nPresenterNextStep, "HRESULT")
        return result
    }

    /**
     * Sets what kind of choice was made about a sync manager conflict resolution and whether to apply the choice to all subsequent conflicts in the set.
     * @param {Integer} nPresenterChoice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a></b>
     * 
     * The choice that was made about the conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a> enumeration.
     * @param {BOOL} fApplyToAll Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b>, then apply the given choice to all subsequent conflicts in the set. In this case, <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setitemchoices">ISyncMgrConflictResolveInfo::SetItemChoices</a> must also be called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setpresenterchoice
     */
    SetPresenterChoice(nPresenterChoice, fApplyToAll) {
        result := ComCall(9, this, "int", nPresenterChoice, "int", fApplyToAll, "HRESULT")
        return result
    }

    /**
     * Sets the array of indexes that represents which items the user wants to keep. This method is used when the user chooses to apply the same operation to all selected conflicts of the same type from the same handler.
     * @param {Pointer<Integer>} prgiConflictItemIndexes Type: <b>UINT*</b>
     * 
     * The array of indexes of items that the user wants to keep.
     * @param {Integer} cChoices Type: <b>UINT</b>
     * 
     * The number of item choices in <i>prgiConflictItemIndexes</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setitemchoices
     */
    SetItemChoices(prgiConflictItemIndexes, cChoices) {
        prgiConflictItemIndexesMarshal := prgiConflictItemIndexes is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, prgiConflictItemIndexesMarshal, prgiConflictItemIndexes, "uint", cChoices, "HRESULT")
        return result
    }
}
