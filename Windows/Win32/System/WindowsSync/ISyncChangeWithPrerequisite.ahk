#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents metadata about a change that is based on the prerequisite knowledge that is associated with the change.
 * @remarks
 * 
  * An <b>ISyncChangeWithPrerequisite</b> object can be obtained by passing <b>IID_ ISyncChangeWithPrerequisite</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchange">ISyncChange</a> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangewithprerequisite
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeWithPrerequisite extends IUnknown{
    /**
     * The interface identifier for ISyncChangeWithPrerequisite
     * @type {Guid}
     */
    static IID => Guid("{9e38382f-1589-48c3-92e4-05ecdcb4f3f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppPrerequisiteKnowledge 
     * @returns {HRESULT} 
     */
    GetPrerequisiteKnowledge(ppPrerequisiteKnowledge) {
        result := ComCall(3, this, "ptr", ppPrerequisiteKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pDestinationKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledgeWithPrerequisite 
     * @returns {HRESULT} 
     */
    GetLearnedKnowledgeWithPrerequisite(pDestinationKnowledge, ppLearnedKnowledgeWithPrerequisite) {
        result := ComCall(4, this, "ptr", pDestinationKnowledge, "ptr", ppLearnedKnowledgeWithPrerequisite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
