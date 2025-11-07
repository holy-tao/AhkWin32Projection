#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that can be set to a value within a range.
 * @remarks
 * 
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingrangevalue">RangeValue</a> control pattern.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irangevalueprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRangeValueProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeValueProvider
     * @type {Guid}
     */
    static IID => Guid("{36dc7aef-33e6-4691-afe1-2be7274b3d33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetValue", "get_Value", "get_IsReadOnly", "get_Maximum", "get_Minimum", "get_LargeChange", "get_SmallChange"]

    /**
     * 
     * @param {Float} val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-setvalue
     */
    SetValue(val) {
        result := ComCall(3, this, "double", val, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_value
     */
    get_Value() {
        result := ComCall(4, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_maximum
     */
    get_Maximum() {
        result := ComCall(6, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_minimum
     */
    get_Minimum() {
        result := ComCall(7, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_largechange
     */
    get_LargeChange() {
        result := ComCall(8, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_smallchange
     */
    get_SmallChange() {
        result := ComCall(9, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
