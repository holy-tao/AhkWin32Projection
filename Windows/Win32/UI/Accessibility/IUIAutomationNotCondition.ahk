#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCondition.ahk

/**
 * Represents a condition that is the negative of another condition.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationnotcondition
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
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationnotcondition-getchild
     */
    GetChild() {
        result := ComCall(3, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }
}
