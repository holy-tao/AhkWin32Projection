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
     * 
     * @param {Pointer<Int32>} childCount 
     * @returns {HRESULT} 
     */
    get_ChildCount(childCount) {
        result := ComCall(3, this, "int*", childCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} childArray 
     * @param {Pointer<Int32>} childArrayCount 
     * @returns {HRESULT} 
     */
    GetChildrenAsNativeArray(childArray, childArrayCount) {
        result := ComCall(4, this, "ptr", childArray, "int*", childArrayCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} childArray 
     * @returns {HRESULT} 
     */
    GetChildren(childArray) {
        result := ComCall(5, this, "ptr", childArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
