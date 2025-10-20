#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents additional information about an ISyncChange object during recovery synchronization.
 * @remarks
 * 
  * To obtain an <b>ISyncFullEnumerationChange</b> object, pass <b>IID_ISyncFullEnumerationChange</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchange">ISyncChange</a> object during recovery synchronization.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncfullenumerationchange
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFullEnumerationChange extends IUnknown{
    /**
     * The interface identifier for ISyncFullEnumerationChange
     * @type {Guid}
     */
    static IID => Guid("{9785e0bd-bdff-40c4-98c5-b34b2f1991b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppLearnedKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedKnowledgeAfterRecoveryComplete(ppLearnedKnowledge) {
        result := ComCall(3, this, "ptr", ppLearnedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IForgottenKnowledge>} ppLearnedForgottenKnowledge 
     * @returns {HRESULT} 
     */
    GetLearnedForgottenKnowledge(ppLearnedForgottenKnowledge) {
        result := ComCall(4, this, "ptr", ppLearnedForgottenKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
