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
     * @type {Float} 
     */
    CurrentValue {
        get => this.get_CurrentValue()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsReadOnly {
        get => this.get_CurrentIsReadOnly()
    }

    /**
     * @type {Float} 
     */
    CurrentMaximum {
        get => this.get_CurrentMaximum()
    }

    /**
     * @type {Float} 
     */
    CurrentMinimum {
        get => this.get_CurrentMinimum()
    }

    /**
     * @type {Float} 
     */
    CurrentLargeChange {
        get => this.get_CurrentLargeChange()
    }

    /**
     * @type {Float} 
     */
    CurrentSmallChange {
        get => this.get_CurrentSmallChange()
    }

    /**
     * @type {Float} 
     */
    CachedValue {
        get => this.get_CachedValue()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsReadOnly {
        get => this.get_CachedIsReadOnly()
    }

    /**
     * @type {Float} 
     */
    CachedMaximum {
        get => this.get_CachedMaximum()
    }

    /**
     * @type {Float} 
     */
    CachedMinimum {
        get => this.get_CachedMinimum()
    }

    /**
     * @type {Float} 
     */
    CachedLargeChange {
        get => this.get_CachedLargeChange()
    }

    /**
     * @type {Float} 
     */
    CachedSmallChange {
        get => this.get_CachedSmallChange()
    }

    /**
     * Sets the value of the control.
     * @param {Float} val Type: <b>double</b>
     * 
     * The value to set as the value of the control.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-setvalue
     */
    SetValue(val) {
        result := ComCall(3, this, "double", val, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentvalue
     */
    get_CurrentValue() {
        result := ComCall(4, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the value of the element can be changed.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentisreadonly
     */
    get_CurrentIsReadOnly() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the maximum value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentmaximum
     */
    get_CurrentMaximum() {
        result := ComCall(6, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the minimum value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentminimum
     */
    get_CurrentMinimum() {
        result := ComCall(7, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the value that is added to or subtracted from the value of the control when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
     * 
     * The LargeChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentlargechange
     */
    get_CurrentLargeChange() {
        result := ComCall(8, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the value that is added to or subtracted from the value of the control when a small change is made, such as when an arrow key is pressed.
     * @remarks
     * 
     * The SmallChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentsmallchange
     */
    get_CurrentSmallChange() {
        result := ComCall(9, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedvalue
     */
    get_CachedValue() {
        result := ComCall(10, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the value of the element can be changed.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedisreadonly
     */
    get_CachedIsReadOnly() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached maximum value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedmaximum
     */
    get_CachedMaximum() {
        result := ComCall(12, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached minimum value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedminimum
     */
    get_CachedMinimum() {
        result := ComCall(13, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves, from the cache, the value that is added to or subtracted from the value of the control when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
     * 
     * The LargeChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedlargechange
     */
    get_CachedLargeChange() {
        result := ComCall(14, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves, from the cache, the value that is added to or subtracted from the value of the control when a small change is made, such as when an arrow key is pressed.
     * @remarks
     * 
     * The SmallChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedsmallchange
     */
    get_CachedSmallChange() {
        result := ComCall(15, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }
}
