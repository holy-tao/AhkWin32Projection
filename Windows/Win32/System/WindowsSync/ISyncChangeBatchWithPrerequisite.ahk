#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk
#Include .\IForgottenKnowledge.ahk
#Include .\ISyncChangeBatchBase.ahk

/**
 * Represents metadata about a change batch that is based on the prerequisite knowledge associated with the change batch.
 * @remarks
 * 
 * An <b>ISyncChangeBatchWithPrerequisite</b> object can be obtained by passing <b>IID_ISyncChangeBatchWithPrerequisite</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatchbase">ISyncChangeBatchBase</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchwithprerequisite
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchWithPrerequisite extends ISyncChangeBatchBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchWithPrerequisite
     * @type {Guid}
     */
    static IID => Guid("{097f13be-5b92-4048-b3f2-7b42a2515e07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrerequisiteKnowledge", "GetLearnedKnowledgeWithPrerequisite", "GetLearnedForgottenKnowledge"]

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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchwithprerequisite-setprerequisiteknowledge
     */
    SetPrerequisiteKnowledge(pPrerequisiteKnowledge) {
        result := ComCall(17, this, "ptr", pPrerequisiteKnowledge, "HRESULT")
        return result
    }

    /**
     * Gets the knowledge that the destination replica learns when the destination provider applies all the changes in this change batch, based on the prerequisite knowledge of the change batch.
     * @param {ISyncKnowledge} pDestinationKnowledge A knowledge fragment is added to the returned learned knowledge only if <i>pDestinationKnowledge</i> contains the prerequisite knowledge for that fragment.
     * @returns {ISyncKnowledge} The knowledge that the destination replica learns when the destination provider applies all the changes in this change batch, based on the prerequisite knowledge of the change batch.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchwithprerequisite-getlearnedknowledgewithprerequisite
     */
    GetLearnedKnowledgeWithPrerequisite(pDestinationKnowledge) {
        result := ComCall(18, this, "ptr", pDestinationKnowledge, "ptr*", &ppLearnedWithPrerequisiteKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedWithPrerequisiteKnowledge)
    }

    /**
     * Gets the forgotten knowledge that the destination replica learns when the destination provider applies all the changes in this change batch during recovery synchronization.
     * @returns {IForgottenKnowledge} Returns the forgotten knowledge that the destination replica learns when the destination provider applies all the changes in this change batch during recovery synchronization.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchwithprerequisite-getlearnedforgottenknowledge
     */
    GetLearnedForgottenKnowledge() {
        result := ComCall(19, this, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return IForgottenKnowledge(ppLearnedForgottenKnowledge)
    }
}
