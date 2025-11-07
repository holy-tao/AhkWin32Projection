#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCondition.ahk

/**
 * Represents a condition made up of multiple conditions, at least one of which must be true.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationorcondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationOrCondition extends IUIAutomationCondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationOrCondition
     * @type {Guid}
     */
    static IID => Guid("{8753f032-3db1-47b5-a1fc-6e34a266c712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChildCount", "GetChildrenAsNativeArray", "GetChildren"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationorcondition-get_childcount
     */
    get_ChildCount() {
        result := ComCall(3, this, "int*", &childCount := 0, "HRESULT")
        return childCount
    }

    /**
     * 
     * @param {Pointer<Pointer<IUIAutomationCondition>>} childArray 
     * @param {Pointer<Integer>} childArrayCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationorcondition-getchildrenasnativearray
     */
    GetChildrenAsNativeArray(childArray, childArrayCount) {
        childArrayMarshal := childArray is VarRef ? "ptr*" : "ptr"
        childArrayCountMarshal := childArrayCount is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, childArrayMarshal, childArray, childArrayCountMarshal, childArrayCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationorcondition-getchildren
     */
    GetChildren() {
        result := ComCall(5, this, "ptr*", &childArray := 0, "HRESULT")
        return childArray
    }
}
