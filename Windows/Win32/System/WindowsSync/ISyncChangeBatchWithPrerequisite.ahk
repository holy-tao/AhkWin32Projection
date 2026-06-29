#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IForgottenKnowledge.ahk" { IForgottenKnowledge }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChangeBatchBase.ahk" { ISyncChangeBatchBase }

/**
 * Represents metadata about a change batch that is based on the prerequisite knowledge associated with the change batch.
 * @remarks
 * An <b>ISyncChangeBatchWithPrerequisite</b> object can be obtained by passing <b>IID_ISyncChangeBatchWithPrerequisite</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatchbase">ISyncChangeBatchBase</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncchangebatchwithprerequisite
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeBatchWithPrerequisite extends ISyncChangeBatchBase {
    /**
     * The interface identifier for ISyncChangeBatchWithPrerequisite
     * @type {Guid}
     */
    static IID := Guid("{097f13be-5b92-4048-b3f2-7b42a2515e07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeBatchWithPrerequisite interfaces
    */
    struct Vtbl extends ISyncChangeBatchBase.Vtbl {
        SetPrerequisiteKnowledge            : IntPtr
        GetLearnedKnowledgeWithPrerequisite : IntPtr
        GetLearnedForgottenKnowledge        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeBatchWithPrerequisite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the minimum knowledge that a destination provider is required to have to process this change batch.
     * @param {ISyncKnowledge} pPrerequisiteKnowledge The minimum knowledge that a destination provider is required to have to process this change batch.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchwithprerequisite-setprerequisiteknowledge
     */
    SetPrerequisiteKnowledge(pPrerequisiteKnowledge) {
        result := ComCall(17, this, "ptr", pPrerequisiteKnowledge, "HRESULT")
        return result
    }

    /**
     * Gets the knowledge that the destination replica learns when the destination provider applies all the changes in this change batch, based on the prerequisite knowledge of the change batch.
     * @remarks
     * The knowledge that is returned in <i>ppLearnedWithPrerequisiteKnowledge</i> is computed by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncknowledge2-projectontoknowledgewithprerequisite">ISyncKnowledge2::ProjectOntoKnowledgeWithPrerequisite</a> method of the learned knowledge of the change batch, passing <i>pDestinationKnowledge</i> as the template knowledge.
     * @param {ISyncKnowledge} pDestinationKnowledge A knowledge fragment is added to the returned learned knowledge only if <i>pDestinationKnowledge</i> contains the prerequisite knowledge for that fragment.
     * @returns {ISyncKnowledge} The knowledge that the destination replica learns when the destination provider applies all the changes in this change batch, based on the prerequisite knowledge of the change batch.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchwithprerequisite-getlearnedknowledgewithprerequisite
     */
    GetLearnedKnowledgeWithPrerequisite(pDestinationKnowledge) {
        result := ComCall(18, this, "ptr", pDestinationKnowledge, "ptr*", &ppLearnedWithPrerequisiteKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedWithPrerequisiteKnowledge)
    }

    /**
     * Gets the forgotten knowledge that the destination replica learns when the destination provider applies all the changes in this change batch during recovery synchronization.
     * @remarks
     * The knowledge returned in <i>ppLearnedForgottenKnowledge</i> is the source forgotten knowledge of the change batch projected onto the range contained in the change batch.
     * @returns {IForgottenKnowledge} Returns the forgotten knowledge that the destination replica learns when the destination provider applies all the changes in this change batch during recovery synchronization.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchwithprerequisite-getlearnedforgottenknowledge
     */
    GetLearnedForgottenKnowledge() {
        result := ComCall(19, this, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return IForgottenKnowledge(ppLearnedForgottenKnowledge)
    }

    Query(iid) {
        if (ISyncChangeBatchWithPrerequisite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPrerequisiteKnowledge := CallbackCreate(GetMethod(implObj, "SetPrerequisiteKnowledge"), flags, 2)
        this.vtbl.GetLearnedKnowledgeWithPrerequisite := CallbackCreate(GetMethod(implObj, "GetLearnedKnowledgeWithPrerequisite"), flags, 3)
        this.vtbl.GetLearnedForgottenKnowledge := CallbackCreate(GetMethod(implObj, "GetLearnedForgottenKnowledge"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPrerequisiteKnowledge)
        CallbackFree(this.vtbl.GetLearnedKnowledgeWithPrerequisite)
        CallbackFree(this.vtbl.GetLearnedForgottenKnowledge)
    }
}
