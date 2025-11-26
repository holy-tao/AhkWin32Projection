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
     * @type {BSTR} 
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
     * @type {BSTR} 
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
     * Sets the value of the element.
     * @param {BSTR} val Type: <b>BSTR</b>
     * 
     * The value to set.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue
     */
    SetValue(val) {
        val := val is String ? BSTR.Alloc(val).Value : val

        result := ComCall(3, this, "ptr", val, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the element.
     * @remarks
     * 
     * Single-line edit controls support programmatic access to their contents through <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern">IUIAutomationValuePattern</a>. However, multiline edit controls do not support this control pattern, and their contents must be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a>.
     * 
     * This property does not support the retrieval of formatting information or substring values. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a> must be used in these scenarios as well.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentvalue
     */
    get_CurrentValue() {
        retVal := BSTR()
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the value of the element is read-only.
     * @remarks
     * 
     * This property must be <b>TRUE</b> for <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a> to succeed.
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentisreadonly
     */
    get_CurrentIsReadOnly() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached value of the element.
     * @remarks
     * 
     * Single-line edit controls support programmatic access to their contents through <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern">IUIAutomationValuePattern</a>. However, multiline edit controls do not support this control pattern, and their contents must be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a>.
     * 
     * This property does not support the retrieval of formatting information or substring values. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a> must be used in these scenarios as well.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_cachedvalue
     */
    get_CachedValue() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the value of the element is read-only.
     * @remarks
     * 
     * This property must be <b>TRUE</b> for <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a> to succeed.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_cachedisreadonly
     */
    get_CachedIsReadOnly() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
