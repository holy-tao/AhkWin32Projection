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
     * @type {Float} 
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
     * @type {Float} 
     */
    Maximum {
        get => this.get_Maximum()
    }

    /**
     * @type {Float} 
     */
    Minimum {
        get => this.get_Minimum()
    }

    /**
     * @type {Float} 
     */
    LargeChange {
        get => this.get_LargeChange()
    }

    /**
     * @type {Float} 
     */
    SmallChange {
        get => this.get_SmallChange()
    }

    /**
     * Sets the value of the control.
     * @param {Float} val Type: <b>double</b>
     * 
     * The value to set.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-setvalue
     */
    SetValue(val) {
        result := ComCall(3, this, "double", val, "HRESULT")
        return result
    }

    /**
     * Specifies the value of the control.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_value
     */
    get_Value() {
        result := ComCall(4, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the value of a control is read-only.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the maximum range value supported by the control.
     * @remarks
     * 
     * This value should be greater than [Minimum](nf-uiautomationcore-irangevalueprovider-get_minimum.md).
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_maximum
     */
    get_Maximum() {
        result := ComCall(6, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the minimum range value supported by the control.
     * @remarks
     * 
     * This value should be less than [Maximum](nf-uiautomationcore-irangevalueprovider-get_maximum.md).
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_minimum
     */
    get_Minimum() {
        result := ComCall(7, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the value that is added to or subtracted from the IRangeValueProvider::Value property when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
     * 
     * The LargeChange property can support Not a Number (NaN) value. When returning a NaN value, the provider should return a quiet (non-signaling) NaN to avoid raising an exception if floating-point exceptions are turned on. The following example shows how to create a quiet NaN:
     * 
     *             
     * 
     * 
     * ```
     * ULONGLONG ulNaN = 0xFFFFFFFFFFFFFFFF;
     *     *pRetVal = *reinterpret_cast<double*>(&ulNaN);
     * ```
     * 
     * 
     * Alternatively, you can use the following function from the standard C++ libraries:
     * 
     * 
     * ```
     * numeric_limits<double>::quiet_NaN( )
     * ```
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_largechange
     */
    get_LargeChange() {
        result := ComCall(8, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the value that is added to or subtracted from the IRangeValueProvider::Value property when a small change is made, such as when an arrow key is pressed.
     * @remarks
     * 
     * The SmallChange property can support Not a Number (NaN) value. When returning a NaN value, the provider should return a quiet (non-signaling) NaN to avoid raising an exception if floating-point exceptions are turned on. The following example shows how to create a quiet NaN:
     * 
     *             
     * 
     * 
     * ```
     * ULONGLONG ulNaN = 0xFFFFFFFFFFFFFFFF;
     *     *pRetVal = *reinterpret_cast<double*>(&ulNaN);
     * ```
     * 
     * 
     * Alternatively, you can use the following function from the standard C++ libraries:
     * 
     * 
     * ```
     * numeric_limits<double>::quiet_NaN( )
     * ```
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_smallchange
     */
    get_SmallChange() {
        result := ComCall(9, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
