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
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     */
    GetChild(condition) {
        result := ComCall(3, this, "ptr", condition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
