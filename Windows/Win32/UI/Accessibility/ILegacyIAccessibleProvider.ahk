#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAccessible.ahk" { IAccessible }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Enables Microsoft UI Automation clients to access the underlying IAccessible implementation of Microsoft Active Accessibility elements.
 * @remarks
 * This interface is implemented by the Microsoft Active Accessibility to UI Automation Proxy to expose native MSAA properties and methods to UI Automation clients that need them for legacy reasons. The proxy automatically supplies this interface for applications or controls that implement Microsoft Active Accessibility natively. This interface is not intended to be implemented by UI Automation applications or controls.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-ilegacyiaccessibleprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ILegacyIAccessibleProvider extends IUnknown {
    /**
     * The interface identifier for ILegacyIAccessibleProvider
     * @type {Guid}
     */
    static IID := Guid("{e44c3566-915d-4070-99c6-047bff5a08f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILegacyIAccessibleProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Select               : IntPtr
        DoDefaultAction      : IntPtr
        SetValue             : IntPtr
        GetIAccessible       : IntPtr
        get_ChildId          : IntPtr
        get_Name             : IntPtr
        get_Value            : IntPtr
        get_Description      : IntPtr
        get_Role             : IntPtr
        get_State            : IntPtr
        get_Help             : IntPtr
        get_KeyboardShortcut : IntPtr
        GetSelection         : IntPtr
        get_DefaultAction    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILegacyIAccessibleProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ChildId {
        get => this.get_ChildId()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Integer} 
     */
    Role {
        get => this.get_Role()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {BSTR} 
     */
    Help {
        get => this.get_Help()
    }

    /**
     * @type {BSTR} 
     */
    KeyboardShortcut {
        get => this.get_KeyboardShortcut()
    }

    /**
     * @type {BSTR} 
     */
    DefaultAction {
        get => this.get_DefaultAction()
    }

    /**
     * Selects the element.
     * @param {Integer} flagsSelect Type: <b>long</b>
     * 
     * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the values described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-select
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "HRESULT")
        return result
    }

    /**
     * Performs the default action on the control.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-dodefaultaction
     */
    DoDefaultAction() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the string value of the control.
     * @param {PWSTR} szValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A localized string that contains the value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-setvalue
     */
    SetValue(szValue) {
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(5, this, "ptr", szValue, "HRESULT")
        return result
    }

    /**
     * Retrieves an accessible object that corresponds to a UI Automation element that supports the LegacyIAccessible control pattern.
     * @returns {IAccessible} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * Receives a pointer to the accessible object.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-getiaccessible
     */
    GetIAccessible() {
        result := ComCall(6, this, "ptr*", &ppAccessible := 0, "HRESULT")
        return IAccessible(ppAccessible)
    }

    /**
     * Specifies the child identifier of this element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_childid
     */
    get_ChildId() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the name of this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_name
     */
    get_Name() {
        pszName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pszName, "HRESULT")
        return pszName
    }

    /**
     * Specifies the value of this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_value
     */
    get_Value() {
        pszValue := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pszValue, "HRESULT")
        return pszValue
    }

    /**
     * Contains the description of this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_description
     */
    get_Description() {
        pszDescription := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * Specifies the role identifier of this element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_role
     */
    get_Role() {
        result := ComCall(11, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * Specifies the state of this element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_state
     */
    get_State() {
        result := ComCall(12, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Specifies a string that contains help information for this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_help
     */
    get_Help() {
        pszHelp := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * Specifies the keyboard shortcut for this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_keyboardshortcut
     */
    get_KeyboardShortcut() {
        pszKeyboardShortcut := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * Retrieves the selected item or items in the control.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> containing the selected items.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-getselection
     */
    GetSelection() {
        result := ComCall(15, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return pvarSelectedChildren
    }

    /**
     * Contains a description of the default action for this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_defaultaction
     */
    get_DefaultAction() {
        pszDefaultAction := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    Query(iid) {
        if (ILegacyIAccessibleProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 2)
        this.vtbl.DoDefaultAction := CallbackCreate(GetMethod(implObj, "DoDefaultAction"), flags, 1)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 2)
        this.vtbl.GetIAccessible := CallbackCreate(GetMethod(implObj, "GetIAccessible"), flags, 2)
        this.vtbl.get_ChildId := CallbackCreate(GetMethod(implObj, "get_ChildId"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_Role := CallbackCreate(GetMethod(implObj, "get_Role"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Help := CallbackCreate(GetMethod(implObj, "get_Help"), flags, 2)
        this.vtbl.get_KeyboardShortcut := CallbackCreate(GetMethod(implObj, "get_KeyboardShortcut"), flags, 2)
        this.vtbl.GetSelection := CallbackCreate(GetMethod(implObj, "GetSelection"), flags, 2)
        this.vtbl.get_DefaultAction := CallbackCreate(GetMethod(implObj, "get_DefaultAction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.DoDefaultAction)
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.GetIAccessible)
        CallbackFree(this.vtbl.get_ChildId)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_Role)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Help)
        CallbackFree(this.vtbl.get_KeyboardShortcut)
        CallbackFree(this.vtbl.GetSelection)
        CallbackFree(this.vtbl.get_DefaultAction)
    }
}
