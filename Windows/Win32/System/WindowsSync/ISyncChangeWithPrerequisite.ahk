#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents metadata about a change that is based on the prerequisite knowledge that is associated with the change.
 * @remarks
 * An <b>ISyncChangeWithPrerequisite</b> object can be obtained by passing <b>IID_ ISyncChangeWithPrerequisite</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchange">ISyncChange</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncchangewithprerequisite
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeWithPrerequisite extends IUnknown {
    /**
     * The interface identifier for ISyncChangeWithPrerequisite
     * @type {Guid}
     */
    static IID := Guid("{9e38382f-1589-48c3-92e4-05ecdcb4f3f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeWithPrerequisite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPrerequisiteKnowledge            : IntPtr
        GetLearnedKnowledgeWithPrerequisite : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeWithPrerequisite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the minimum knowledge that a destination provider is required to have to process this change.
     * @returns {ISyncKnowledge} The minimum knowledge that a destination provider is required to have to process this change.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangewithprerequisite-getprerequisiteknowledge
     */
    GetPrerequisiteKnowledge() {
        result := ComCall(3, this, "ptr*", &ppPrerequisiteKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppPrerequisiteKnowledge)
    }

    /**
     * Gets the knowledge that the destination replica learns when the destination provider applies this change, based on the prerequisite knowledge that is associated with the change.
     * @param {ISyncKnowledge} pDestinationKnowledge The knowledge of a change unit that is contained in this change is not added to the returned learned knowledge when <i>pDestinationKnowledge</i> contains the prerequisite knowledge for the change unit.
     * @returns {ISyncKnowledge} The knowledge that the destination replica learns when the destination provider applies this change, based on the prerequisite knowledge that is associated with the change.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangewithprerequisite-getlearnedknowledgewithprerequisite
     */
    GetLearnedKnowledgeWithPrerequisite(pDestinationKnowledge) {
        result := ComCall(4, this, "ptr", pDestinationKnowledge, "ptr*", &ppLearnedKnowledgeWithPrerequisite := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledgeWithPrerequisite)
    }

    Query(iid) {
        if (ISyncChangeWithPrerequisite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrerequisiteKnowledge := CallbackCreate(GetMethod(implObj, "GetPrerequisiteKnowledge"), flags, 2)
        this.vtbl.GetLearnedKnowledgeWithPrerequisite := CallbackCreate(GetMethod(implObj, "GetLearnedKnowledgeWithPrerequisite"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrerequisiteKnowledge)
        CallbackFree(this.vtbl.GetLearnedKnowledgeWithPrerequisite)
    }
}
