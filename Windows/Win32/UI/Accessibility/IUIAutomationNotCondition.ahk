#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCondition.ahk

/**
 * Represents a condition that is the negative of another condition.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationnotcondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationNotCondition extends IUIAutomationCondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationNotCondition
     * @type {Guid}
     */
    static IID => Guid("{f528b657-847b-498c-8896-d52b565407a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChild"]

    /**
     * Retrieves the condition of which this condition is the negative.
     * @remarks
     * The returned condition is the one that was used in creating this condition.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the condition.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationnotcondition-getchild
     */
    GetChild() {
        result := ComCall(3, this, "ptr*", &condition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIAutomationCondition(condition)
    }
}
