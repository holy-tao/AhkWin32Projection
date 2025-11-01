#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCondition.ahk

/**
 * Exposes properties and methods that Microsoft UI Automation client applications can use to retrieve information about an AND-based property condition.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationandcondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationAndCondition extends IUIAutomationCondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationAndCondition
     * @type {Guid}
     */
    static IID => Guid("{a7d0af36-b912-45fe-9855-091ddc174aec}")

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
     * @param {Pointer<Integer>} childCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationandcondition-get_childcount
     */
    get_ChildCount(childCount) {
        childCountMarshal := childCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, childCountMarshal, childCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<IUIAutomationCondition>>} childArray 
     * @param {Pointer<Integer>} childArrayCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationandcondition-getchildrenasnativearray
     */
    GetChildrenAsNativeArray(childArray, childArrayCount) {
        childArrayCountMarshal := childArrayCount is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr*", childArray, childArrayCountMarshal, childArrayCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} childArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationandcondition-getchildren
     */
    GetChildren(childArray) {
        result := ComCall(5, this, "ptr*", childArray, "HRESULT")
        return result
    }
}
