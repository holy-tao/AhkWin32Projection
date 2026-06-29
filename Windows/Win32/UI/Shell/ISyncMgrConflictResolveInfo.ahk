#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNCMGR_PRESENTER_NEXT_STEP.ahk" { SYNCMGR_PRESENTER_NEXT_STEP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNCMGR_PRESENTER_CHOICE.ahk" { SYNCMGR_PRESENTER_CHOICE }

/**
 * Exposes methods that get and set information about sync manager conflict resolution.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrConflictResolveInfo extends IUnknown {
    /**
     * The interface identifier for ISyncMgrConflictResolveInfo
     * @type {Guid}
     */
    static IID := Guid("{c405a219-25a2-442e-8743-b845a2cee93f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrConflictResolveInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIterationInfo     : IntPtr
        GetPresenterNextStep : IntPtr
        GetPresenterChoice   : IntPtr
        GetItemChoiceCount   : IntPtr
        GetItemChoice        : IntPtr
        SetPresenterNextStep : IntPtr
        SetPresenterChoice   : IntPtr
        SetItemChoices       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrConflictResolveInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
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
     * Gets what the presenter wants to do as the next step in the sync manager conflict resolution.
     * @returns {SYNCMGR_PRESENTER_NEXT_STEP} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a>*</b>
     * 
     * When this method returns, contains a pointer to the next step in conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getpresenternextstep
     */
    GetPresenterNextStep() {
        result := ComCall(4, this, "int*", &pnPresenterNextStep := 0, "HRESULT")
        return pnPresenterNextStep
    }

    /**
     * Gets what kind of choice was made and whether to apply the choice to all subsequent conflicts in the set.
     * @param {Pointer<SYNCMGR_PRESENTER_CHOICE>} pnPresenterChoice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a>*</b>
     * 
     * When this method returns, contains a pointer to the choice that was made about the conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a> enumeration.
     * @param {Pointer<BOOL>} pfApplyToAll Type: <b>BOOL*</b>
     * 
     * When this method returns, contains a pointer to a flag. If <b>TRUE</b>, then the given choice is to be applied to all subsequent conflicts in the set, and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoice">ISyncMgrConflictResolveInfo::GetItemChoice</a> and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoicecount">ISyncMgrConflictResolveInfo::GetItemChoiceCount</a> have information on how to apply this choice. Otherwise <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getpresenterchoice
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
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoicecount
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
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-getitemchoice
     */
    GetItemChoice(iChoice) {
        result := ComCall(7, this, "uint", iChoice, "uint*", &piChoiceIndex := 0, "HRESULT")
        return piChoiceIndex
    }

    /**
     * Sets what the presenter wants to do as the next step in the sync manager conflict resolution.
     * @param {SYNCMGR_PRESENTER_NEXT_STEP} nPresenterNextStep Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a></b>
     * 
     * The next step in the conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step">SYNCMGR_PRESENTER_NEXT_STEP</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setpresenternextstep
     */
    SetPresenterNextStep(nPresenterNextStep) {
        result := ComCall(8, this, SYNCMGR_PRESENTER_NEXT_STEP, nPresenterNextStep, "HRESULT")
        return result
    }

    /**
     * Sets what kind of choice was made about a sync manager conflict resolution and whether to apply the choice to all subsequent conflicts in the set.
     * @param {SYNCMGR_PRESENTER_CHOICE} nPresenterChoice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a></b>
     * 
     * The choice that was made about the conflict resolution. One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice">SYNCMGR_PRESENTER_CHOICE</a> enumeration.
     * @param {BOOL} fApplyToAll Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b>, then apply the given choice to all subsequent conflicts in the set. In this case, <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setitemchoices">ISyncMgrConflictResolveInfo::SetItemChoices</a> must also be called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setpresenterchoice
     */
    SetPresenterChoice(nPresenterChoice, fApplyToAll) {
        result := ComCall(9, this, SYNCMGR_PRESENTER_CHOICE, nPresenterChoice, BOOL, fApplyToAll, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflictresolveinfo-setitemchoices
     */
    SetItemChoices(prgiConflictItemIndexes, cChoices) {
        prgiConflictItemIndexesMarshal := prgiConflictItemIndexes is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, prgiConflictItemIndexesMarshal, prgiConflictItemIndexes, "uint", cChoices, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrConflictResolveInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIterationInfo := CallbackCreate(GetMethod(implObj, "GetIterationInfo"), flags, 4)
        this.vtbl.GetPresenterNextStep := CallbackCreate(GetMethod(implObj, "GetPresenterNextStep"), flags, 2)
        this.vtbl.GetPresenterChoice := CallbackCreate(GetMethod(implObj, "GetPresenterChoice"), flags, 3)
        this.vtbl.GetItemChoiceCount := CallbackCreate(GetMethod(implObj, "GetItemChoiceCount"), flags, 2)
        this.vtbl.GetItemChoice := CallbackCreate(GetMethod(implObj, "GetItemChoice"), flags, 3)
        this.vtbl.SetPresenterNextStep := CallbackCreate(GetMethod(implObj, "SetPresenterNextStep"), flags, 2)
        this.vtbl.SetPresenterChoice := CallbackCreate(GetMethod(implObj, "SetPresenterChoice"), flags, 3)
        this.vtbl.SetItemChoices := CallbackCreate(GetMethod(implObj, "SetItemChoices"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIterationInfo)
        CallbackFree(this.vtbl.GetPresenterNextStep)
        CallbackFree(this.vtbl.GetPresenterChoice)
        CallbackFree(this.vtbl.GetItemChoiceCount)
        CallbackFree(this.vtbl.GetItemChoice)
        CallbackFree(this.vtbl.SetPresenterNextStep)
        CallbackFree(this.vtbl.SetPresenterChoice)
        CallbackFree(this.vtbl.SetItemChoices)
    }
}
