#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk
#Include .\IForgottenKnowledge.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLearnedKnowledgeAfterRecoveryComplete", "GetLearnedForgottenKnowledge"]

    /**
     * 
     * @returns {ISyncKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchange-getlearnedknowledgeafterrecoverycomplete
     */
    GetLearnedKnowledgeAfterRecoveryComplete() {
        result := ComCall(3, this, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * 
     * @returns {IForgottenKnowledge} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfullenumerationchange-getlearnedforgottenknowledge
     */
    GetLearnedForgottenKnowledge() {
        result := ComCall(4, this, "ptr*", &ppLearnedForgottenKnowledge := 0, "HRESULT")
        return IForgottenKnowledge(ppLearnedForgottenKnowledge)
    }
}
