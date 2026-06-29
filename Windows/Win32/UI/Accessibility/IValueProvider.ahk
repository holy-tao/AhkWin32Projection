#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to controls that have an intrinsic value that does not span a range, and that can be represented as a string.
 * @remarks
 * The value of the control may or may not be editable depending on the control and its settings.
 *         
 * 
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingvalue">Value</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-ivalueprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IValueProvider extends IUnknown {
    /**
     * The interface identifier for IValueProvider
     * @type {Guid}
     */
    static IID := Guid("{c7935180-6fb3-4201-b174-7df73adbf64a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IValueProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetValue       : IntPtr
        get_Value      : IntPtr
        get_IsReadOnly : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IValueProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * Single-line edit controls support programmatic access to their contents by implementing <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a>. 
     *         However, multi-line edit controls do not implement <b>IValueProvider</b>; 
     *         instead they provide access to their content by implementing <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>.
     *         
     * 
     * Controls such as ListItem and TreeItem must implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> 
     *         if the value of any of the items is editable, regardless of the current edit 
     *         mode of the control. The parent control must also implement <b>IValueProvider</b> 
     *         if the child items are editable.
     * @param {PWSTR} _val Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The value to set. The provider is responsible for converting the value to the appropriate data type.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ivalueprovider-setvalue
     */
    SetValue(_val) {
        _val := _val is String ? StrPtr(_val) : _val

        result := ComCall(3, this, "ptr", _val, "HRESULT")
        return result
    }

    /**
     * The value of the control.
     * @remarks
     * Single-line edit controls support programmatic access to their contents by implementing <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> (in addition to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>). However, multi-line edit controls do not implement <b>IValueProvider</b>.
     * 
     * 
     * To retrieve the textual contents of multi-line edit controls, the controls must implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>. However, <b>ITextProvider</b> does not support setting the value of a control.
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> does not support the retrieval of formatting information or substring values. Implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a> in these scenarios.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ivalueprovider-get_value
     */
    get_Value() {
        pRetVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the value of a control is read-only. (IValueProvider.get_IsReadOnly)
     * @remarks
     * A control should have its IsEnabled property (<a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_IsEnabledPropertyId</a>) set to <b>TRUE</b> and its <b>IValueProvider::IsReadOnly</b> 
     *             property set to <b>FALSE</b> before allowing a call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivalueprovider-setvalue">IValueProvider::SetValue</a>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ivalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(5, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IValueProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.get_IsReadOnly := CallbackCreate(GetMethod(implObj, "get_IsReadOnly"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.get_IsReadOnly)
    }
}
