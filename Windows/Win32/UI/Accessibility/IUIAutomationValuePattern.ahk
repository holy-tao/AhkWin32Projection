#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that contains a value that does not span a range and that can be represented as a string.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationValuePattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationValuePattern
     * @type {Guid}
     */
    static IID => Guid("{a94cd8b1-0844-4cd6-9d2d-640537ab39e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetValue", "get_CurrentValue", "get_CurrentIsReadOnly", "get_CachedValue", "get_CachedIsReadOnly"]

    /**
     * 
     * @param {BSTR} val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue
     */
    SetValue(val) {
        val := val is String ? BSTR.Alloc(val).Value : val

        result := ComCall(3, this, "ptr", val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentvalue
     */
    get_CurrentValue() {
        retVal := BSTR()
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentisreadonly
     */
    get_CurrentIsReadOnly() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_cachedvalue
     */
    get_CachedValue() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_cachedisreadonly
     */
    get_CachedIsReadOnly() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
