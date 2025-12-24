#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that have an intrinsic value that does not span a range, and that can be represented as a string.
 * @remarks
 * 
 * The value of the control may or may not be editable depending on the control and its settings.
 *         
 * 
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingvalue">Value</a> control pattern.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-ivalueprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IValueProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValueProvider
     * @type {Guid}
     */
    static IID => Guid("{c7935180-6fb3-4201-b174-7df73adbf64a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetValue", "get_Value", "get_IsReadOnly"]

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {BOOL} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Sets the value of control.
     * @param {PWSTR} val Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The value to set. The provider is responsible for converting the value to the appropriate data type.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ivalueprovider-setvalue
     */
    SetValue(val) {
        val := val is String ? StrPtr(val) : val

        result := ComCall(3, this, "ptr", val, "HRESULT")
        return result
    }

    /**
     * The value of the control.
     * @remarks
     * 
     * Single-line edit controls support programmatic access to their contents by implementing <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> (in addition to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>). However, multi-line edit controls do not implement <b>IValueProvider</b>.
     * 
     * 
     * To retrieve the textual contents of multi-line edit controls, the controls must implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>. However, <b>ITextProvider</b> does not support setting the value of a control.
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> does not support the retrieval of formatting information or substring values. Implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a> in these scenarios.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ivalueprovider-get_value
     */
    get_Value() {
        pRetVal := BSTR()
        result := ComCall(4, this, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the value of a control is read-only.
     * @remarks
     * 
     * A control should have its IsEnabled property (<a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_IsEnabledPropertyId</a>) set to <b>TRUE</b> and its <b>IValueProvider::IsReadOnly</b> 
     *             property set to <b>FALSE</b> before allowing a call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivalueprovider-setvalue">IValueProvider::SetValue</a>.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ivalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
