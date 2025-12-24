#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCondition.ahk

/**
 * Represents a condition that can be either TRUE (selects all elements) or FALSE (selects no elements).
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationboolcondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationBoolCondition extends IUIAutomationCondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationBoolCondition
     * @type {Guid}
     */
    static IID => Guid("{1b4e1f2e-75eb-4d0b-8952-5a69988e2307}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BooleanValue"]

    /**
     * @type {BOOL} 
     */
    BooleanValue {
        get => this.get_BooleanValue()
    }

    /**
     * Retrieves the value of the condition:\_either TRUE or FALSE.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationboolcondition-get_booleanvalue
     */
    get_BooleanValue() {
        result := ComCall(3, this, "int*", &boolVal := 0, "HRESULT")
        return boolVal
    }
}
