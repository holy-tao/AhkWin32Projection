#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to controls that can be set to a value within a range.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingrangevalue">RangeValue</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irangevalueprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRangeValueProvider extends IUnknown {
    /**
     * The interface identifier for IRangeValueProvider
     * @type {Guid}
     */
    static IID := Guid("{36dc7aef-33e6-4691-afe1-2be7274b3d33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRangeValueProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetValue        : IntPtr
        get_Value       : IntPtr
        get_IsReadOnly  : IntPtr
        get_Maximum     : IntPtr
        get_Minimum     : IntPtr
        get_LargeChange : IntPtr
        get_SmallChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRangeValueProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Sets the value of the control. (IRangeValueProvider.SetValue)
     * @remarks
     * The actual value set depends on the control implementation. The control may round the requested value up or down.
     * @param {Float} _val Type: <b>double</b>
     * 
     * The value to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-setvalue
     */
    SetValue(_val) {
        result := ComCall(3, this, "double", _val, "HRESULT")
        return result
    }

    /**
     * Specifies the value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_value
     */
    get_Value() {
        result := ComCall(4, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the value of a control is read-only. (IRangeValueProvider.get_IsReadOnly)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(5, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the maximum range value supported by the control.
     * @remarks
     * This value should be greater than [Minimum](nf-uiautomationcore-irangevalueprovider-get_minimum.md).
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_maximum
     */
    get_Maximum() {
        result := ComCall(6, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the minimum range value supported by the control.
     * @remarks
     * This value should be less than [Maximum](nf-uiautomationcore-irangevalueprovider-get_maximum.md).
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_minimum
     */
    get_Minimum() {
        result := ComCall(7, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the value that is added to or subtracted from the IRangeValueProvider::Value property when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_largechange
     */
    get_LargeChange() {
        result := ComCall(8, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the value that is added to or subtracted from the IRangeValueProvider::Value property when a small change is made, such as when an arrow key is pressed.
     * @remarks
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_smallchange
     */
    get_SmallChange() {
        result := ComCall(9, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IRangeValueProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.get_IsReadOnly := CallbackCreate(GetMethod(implObj, "get_IsReadOnly"), flags, 2)
        this.vtbl.get_Maximum := CallbackCreate(GetMethod(implObj, "get_Maximum"), flags, 2)
        this.vtbl.get_Minimum := CallbackCreate(GetMethod(implObj, "get_Minimum"), flags, 2)
        this.vtbl.get_LargeChange := CallbackCreate(GetMethod(implObj, "get_LargeChange"), flags, 2)
        this.vtbl.get_SmallChange := CallbackCreate(GetMethod(implObj, "get_SmallChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.get_IsReadOnly)
        CallbackFree(this.vtbl.get_Maximum)
        CallbackFree(this.vtbl.get_Minimum)
        CallbackFree(this.vtbl.get_LargeChange)
        CallbackFree(this.vtbl.get_SmallChange)
    }
}
