#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IForgottenKnowledge.ahk" { IForgottenKnowledge }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents additional information about an ISyncChange object during recovery synchronization.
 * @remarks
 * To obtain an <b>ISyncFullEnumerationChange</b> object, pass <b>IID_ISyncFullEnumerationChange</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchange">ISyncChange</a> object during recovery synchronization.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncfullenumerationchange
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFullEnumerationChange extends IUnknown {
    /**
     * The interface identifier for ISyncFullEnumerationChange
     * @type {Guid}
     */
    static IID := Guid("{9785e0bd-bdff-40c4-98c5-b34b2f1991b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFullEnumerationChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLearnedKnowledgeAfterRecoveryComplete : IntPtr
        GetLearnedForgottenKnowledge             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFullEnumerationChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the knowledge the destination replica will learn after it applies the changes in the full enumeration.
     * @returns {ISyncKnowledge} The knowledge that the destination replica will learn after it applies this change during recovery synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchange-getlearnedknowledgeafterrecoverycomplete
     */
    GetLearnedKnowledgeAfterRecoveryComplete() {
        result := ComCall(3, this, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * Gets the forgotten knowledge that the destination replica learns when the destination provider applies this change during recovery synchronization.
     * @remarks
     * The knowledge returned in <i>ppLearnedForgottenKnowledge</i> is the source forgotten knowledge of the change batch projected onto the item that is associated with this change.
     * @returns {IForgottenKnowledge} The forgotten knowledge that the destination replica learns when the destination provider applies this change during recovery synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchange-getlearnedforgottenknowledge
     */
    GetLearnedForgottenKnowledge() {
        result := ComCall(4, this, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return IForgottenKnowledge(ppLearnedForgottenKnowledge)
    }

    Query(iid) {
        if (ISyncFullEnumerationChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLearnedKnowledgeAfterRecoveryComplete := CallbackCreate(GetMethod(implObj, "GetLearnedKnowledgeAfterRecoveryComplete"), flags, 2)
        this.vtbl.GetLearnedForgottenKnowledge := CallbackCreate(GetMethod(implObj, "GetLearnedForgottenKnowledge"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLearnedKnowledgeAfterRecoveryComplete)
        CallbackFree(this.vtbl.GetLearnedForgottenKnowledge)
    }
}
