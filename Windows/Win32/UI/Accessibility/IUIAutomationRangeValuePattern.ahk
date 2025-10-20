#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that presents a range of values.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationrangevaluepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationRangeValuePattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationRangeValuePattern
     * @type {Guid}
     */
    static IID => Guid("{59213f4f-7346-49e5-b120-80555987a148}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetValue", "get_CurrentValue", "get_CurrentIsReadOnly", "get_CurrentMaximum", "get_CurrentMinimum", "get_CurrentLargeChange", "get_CurrentSmallChange", "get_CachedValue", "get_CachedIsReadOnly", "get_CachedMaximum", "get_CachedMinimum", "get_CachedLargeChange", "get_CachedSmallChange"]

    /**
     * 
     * @param {Float} val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-setvalue
     */
    SetValue(val) {
        result := ComCall(3, this, "double", val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentvalue
     */
    get_CurrentValue(retVal) {
        result := ComCall(4, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentisreadonly
     */
    get_CurrentIsReadOnly(retVal) {
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentmaximum
     */
    get_CurrentMaximum(retVal) {
        result := ComCall(6, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentminimum
     */
    get_CurrentMinimum(retVal) {
        result := ComCall(7, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentlargechange
     */
    get_CurrentLargeChange(retVal) {
        result := ComCall(8, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentsmallchange
     */
    get_CurrentSmallChange(retVal) {
        result := ComCall(9, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedvalue
     */
    get_CachedValue(retVal) {
        result := ComCall(10, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedisreadonly
     */
    get_CachedIsReadOnly(retVal) {
        result := ComCall(11, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedmaximum
     */
    get_CachedMaximum(retVal) {
        result := ComCall(12, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedminimum
     */
    get_CachedMinimum(retVal) {
        result := ComCall(13, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedlargechange
     */
    get_CachedLargeChange(retVal) {
        result := ComCall(14, this, "double*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedsmallchange
     */
    get_CachedSmallChange(retVal) {
        result := ComCall(15, this, "double*", retVal, "HRESULT")
        return result
    }
}
