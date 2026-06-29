#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a control that presents a range of values.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationrangevaluepattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationRangeValuePattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationRangeValuePattern
     * @type {Guid}
     */
    static IID := Guid("{59213f4f-7346-49e5-b120-80555987a148}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationRangeValuePattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetValue               : IntPtr
        get_CurrentValue       : IntPtr
        get_CurrentIsReadOnly  : IntPtr
        get_CurrentMaximum     : IntPtr
        get_CurrentMinimum     : IntPtr
        get_CurrentLargeChange : IntPtr
        get_CurrentSmallChange : IntPtr
        get_CachedValue        : IntPtr
        get_CachedIsReadOnly   : IntPtr
        get_CachedMaximum      : IntPtr
        get_CachedMinimum      : IntPtr
        get_CachedLargeChange  : IntPtr
        get_CachedSmallChange  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationRangeValuePattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Sets the value of the control. (IUIAutomationRangeValuePattern.SetValue)
     * @param {Float} _val Type: <b>double</b>
     * 
     * The value to set as the value of the control.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-setvalue
     */
    SetValue(_val) {
        result := ComCall(3, this, "double", _val, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentvalue
     */
    get_CurrentValue() {
        result := ComCall(4, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the value of the element can be changed.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentisreadonly
     */
    get_CurrentIsReadOnly() {
        result := ComCall(5, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the maximum value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentmaximum
     */
    get_CurrentMaximum() {
        result := ComCall(6, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the minimum value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentminimum
     */
    get_CurrentMinimum() {
        result := ComCall(7, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the value that is added to or subtracted from the value of the control when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
     * The LargeChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentlargechange
     */
    get_CurrentLargeChange() {
        result := ComCall(8, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the value that is added to or subtracted from the value of the control when a small change is made, such as when an arrow key is pressed.
     * @remarks
     * The SmallChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_currentsmallchange
     */
    get_CurrentSmallChange() {
        result := ComCall(9, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedvalue
     */
    get_CachedValue() {
        result := ComCall(10, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the value of the element can be changed.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedisreadonly
     */
    get_CachedIsReadOnly() {
        result := ComCall(11, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached maximum value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedmaximum
     */
    get_CachedMaximum() {
        result := ComCall(12, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached minimum value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedminimum
     */
    get_CachedMinimum() {
        result := ComCall(13, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves, from the cache, the value that is added to or subtracted from the value of the control when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
     * The LargeChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedlargechange
     */
    get_CachedLargeChange() {
        result := ComCall(14, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves, from the cache, the value that is added to or subtracted from the value of the control when a small change is made, such as when an arrow key is pressed.
     * @remarks
     * The SmallChange property can support a Not a Number (NaN) value. When retrieving this property, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationrangevaluepattern-get_cachedsmallchange
     */
    get_CachedSmallChange() {
        result := ComCall(15, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationRangeValuePattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 2)
        this.vtbl.get_CurrentValue := CallbackCreate(GetMethod(implObj, "get_CurrentValue"), flags, 2)
        this.vtbl.get_CurrentIsReadOnly := CallbackCreate(GetMethod(implObj, "get_CurrentIsReadOnly"), flags, 2)
        this.vtbl.get_CurrentMaximum := CallbackCreate(GetMethod(implObj, "get_CurrentMaximum"), flags, 2)
        this.vtbl.get_CurrentMinimum := CallbackCreate(GetMethod(implObj, "get_CurrentMinimum"), flags, 2)
        this.vtbl.get_CurrentLargeChange := CallbackCreate(GetMethod(implObj, "get_CurrentLargeChange"), flags, 2)
        this.vtbl.get_CurrentSmallChange := CallbackCreate(GetMethod(implObj, "get_CurrentSmallChange"), flags, 2)
        this.vtbl.get_CachedValue := CallbackCreate(GetMethod(implObj, "get_CachedValue"), flags, 2)
        this.vtbl.get_CachedIsReadOnly := CallbackCreate(GetMethod(implObj, "get_CachedIsReadOnly"), flags, 2)
        this.vtbl.get_CachedMaximum := CallbackCreate(GetMethod(implObj, "get_CachedMaximum"), flags, 2)
        this.vtbl.get_CachedMinimum := CallbackCreate(GetMethod(implObj, "get_CachedMinimum"), flags, 2)
        this.vtbl.get_CachedLargeChange := CallbackCreate(GetMethod(implObj, "get_CachedLargeChange"), flags, 2)
        this.vtbl.get_CachedSmallChange := CallbackCreate(GetMethod(implObj, "get_CachedSmallChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.get_CurrentValue)
        CallbackFree(this.vtbl.get_CurrentIsReadOnly)
        CallbackFree(this.vtbl.get_CurrentMaximum)
        CallbackFree(this.vtbl.get_CurrentMinimum)
        CallbackFree(this.vtbl.get_CurrentLargeChange)
        CallbackFree(this.vtbl.get_CurrentSmallChange)
        CallbackFree(this.vtbl.get_CachedValue)
        CallbackFree(this.vtbl.get_CachedIsReadOnly)
        CallbackFree(this.vtbl.get_CachedMaximum)
        CallbackFree(this.vtbl.get_CachedMinimum)
        CallbackFree(this.vtbl.get_CachedLargeChange)
        CallbackFree(this.vtbl.get_CachedSmallChange)
    }
}
