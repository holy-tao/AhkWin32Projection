#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that contains a value that does not span a range and that can be represented as a string.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationValuePattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationValuePattern
     * @type {Guid}
     */
    static IID := Guid("{a94cd8b1-0844-4cd6-9d2d-640537ab39e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationValuePattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetValue              : IntPtr
        get_CurrentValue      : IntPtr
        get_CurrentIsReadOnly : IntPtr
        get_CachedValue       : IntPtr
        get_CachedIsReadOnly  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationValuePattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisenabled">CurrentIsEnabled</a> property must be <b>TRUE</b>, and the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentisreadonly">IUIAutomationValuePattern::CurrentIsReadOnly</a> property must be <b>FALSE</b>.
     * @param {BSTR} _val Type: <b>BSTR</b>
     * 
     * The value to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue
     */
    SetValue(_val) {
        _val := _val is String ? BSTR.Alloc(_val).Value : _val

        result := ComCall(3, this, BSTR, _val, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the element.
     * @remarks
     * Single-line edit controls support programmatic access to their contents through <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern">IUIAutomationValuePattern</a>. However, multiline edit controls do not support this control pattern, and their contents must be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a>.
     * 
     * This property does not support the retrieval of formatting information or substring values. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a> must be used in these scenarios as well.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentvalue
     */
    get_CurrentValue() {
        retVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the value of the element is read-only.
     * @remarks
     * This property must be <b>TRUE</b> for <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a> to succeed.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_currentisreadonly
     */
    get_CurrentIsReadOnly() {
        result := ComCall(5, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached value of the element.
     * @remarks
     * Single-line edit controls support programmatic access to their contents through <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern">IUIAutomationValuePattern</a>. However, multiline edit controls do not support this control pattern, and their contents must be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a>.
     * 
     * This property does not support the retrieval of formatting information or substring values. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a> must be used in these scenarios as well.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_cachedvalue
     */
    get_CachedValue() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the value of the element is read-only.
     * @remarks
     * This property must be <b>TRUE</b> for <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a> to succeed.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-get_cachedisreadonly
     */
    get_CachedIsReadOnly() {
        result := ComCall(7, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationValuePattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 2)
        this.vtbl.get_CurrentValue := CallbackCreate(GetMethod(implObj, "get_CurrentValue"), flags, 2)
        this.vtbl.get_CurrentIsReadOnly := CallbackCreate(GetMethod(implObj, "get_CurrentIsReadOnly"), flags, 2)
        this.vtbl.get_CachedValue := CallbackCreate(GetMethod(implObj, "get_CachedValue"), flags, 2)
        this.vtbl.get_CachedIsReadOnly := CallbackCreate(GetMethod(implObj, "get_CachedIsReadOnly"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.get_CurrentValue)
        CallbackFree(this.vtbl.get_CurrentIsReadOnly)
        CallbackFree(this.vtbl.get_CachedValue)
        CallbackFree(this.vtbl.get_CachedIsReadOnly)
    }
}
