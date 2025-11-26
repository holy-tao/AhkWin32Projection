#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAccessible.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables Microsoft UI Automation clients to access the underlying IAccessible implementation of Microsoft Active Accessibility elements.
 * @remarks
 * 
 * This interface is implemented by the Microsoft Active Accessibility to UI Automation Proxy to expose native MSAA properties and methods to UI Automation clients that need them for legacy reasons. The proxy automatically supplies this interface for applications or controls that implement Microsoft Active Accessibility natively. This interface is not intended to be implemented by UI Automation applications or controls.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-ilegacyiaccessibleprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ILegacyIAccessibleProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILegacyIAccessibleProvider
     * @type {Guid}
     */
    static IID => Guid("{e44c3566-915d-4070-99c6-047bff5a08f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Select", "DoDefaultAction", "SetValue", "GetIAccessible", "get_ChildId", "get_Name", "get_Value", "get_Description", "get_Role", "get_State", "get_Help", "get_KeyboardShortcut", "GetSelection", "get_DefaultAction"]

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
     * 
     * @param {Integer} flagsSelect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-select
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-dodefaultaction
     */
    DoDefaultAction() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-setvalue
     */
    SetValue(szValue) {
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(5, this, "ptr", szValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAccessible} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-getiaccessible
     */
    GetIAccessible() {
        result := ComCall(6, this, "ptr*", &ppAccessible := 0, "HRESULT")
        return IAccessible(ppAccessible)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_childid
     */
    get_ChildId() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_name
     */
    get_Name() {
        pszName := BSTR()
        result := ComCall(8, this, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_value
     */
    get_Value() {
        pszValue := BSTR()
        result := ComCall(9, this, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_description
     */
    get_Description() {
        pszDescription := BSTR()
        result := ComCall(10, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_role
     */
    get_Role() {
        result := ComCall(11, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_state
     */
    get_State() {
        result := ComCall(12, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_help
     */
    get_Help() {
        pszHelp := BSTR()
        result := ComCall(13, this, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_keyboardshortcut
     */
    get_KeyboardShortcut() {
        pszKeyboardShortcut := BSTR()
        result := ComCall(14, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-getselection
     */
    GetSelection() {
        result := ComCall(15, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return pvarSelectedChildren
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_defaultaction
     */
    get_DefaultAction() {
        pszDefaultAction := BSTR()
        result := ComCall(16, this, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }
}
