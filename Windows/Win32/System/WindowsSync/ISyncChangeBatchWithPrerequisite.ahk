#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {ISyncKnowledge} pPrerequisiteKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchwithprerequisite-setprerequisiteknowledge
     */
    SetPrerequisiteKnowledge(pPrerequisiteKnowledge) {
        result := ComCall(17, this, "ptr", pPrerequisiteKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncKnowledge} pDestinationKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppLearnedWithPrerequisiteKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchwithprerequisite-getlearnedknowledgewithprerequisite
     */
    GetLearnedKnowledgeWithPrerequisite(pDestinationKnowledge, ppLearnedWithPrerequisiteKnowledge) {
        result := ComCall(18, this, "ptr", pDestinationKnowledge, "ptr*", ppLearnedWithPrerequisiteKnowledge, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IForgottenKnowledge>} ppLearnedForgottenKnowledge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchwithprerequisite-getlearnedforgottenknowledge
     */
    GetLearnedForgottenKnowledge(ppLearnedForgottenKnowledge) {
        result := ComCall(19, this, "ptr*", ppLearnedForgottenKnowledge, "HRESULT")
        return result
    }
}
