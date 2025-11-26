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
     * Selects the element.
     * @param {Integer} flagsSelect Type: <b>long</b>
     * 
     * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the values described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-select
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "HRESULT")
        return result
    }

    /**
     * Performs the default action on the control.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-dodefaultaction
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
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-setvalue
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
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-getiaccessible
     */
    GetIAccessible() {
        result := ComCall(6, this, "ptr*", &ppAccessible := 0, "HRESULT")
        return IAccessible(ppAccessible)
    }

    /**
     * Specifies the child identifier of this element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_childid
     */
    get_ChildId() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the name of this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_name
     */
    get_Name() {
        pszName := BSTR()
        result := ComCall(8, this, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * Specifies the value of this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_value
     */
    get_Value() {
        pszValue := BSTR()
        result := ComCall(9, this, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * Contains the description of this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_description
     */
    get_Description() {
        pszDescription := BSTR()
        result := ComCall(10, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * Specifies the role identifier of this element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_role
     */
    get_Role() {
        result := ComCall(11, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * Specifies the state of this element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_state
     */
    get_State() {
        result := ComCall(12, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Specifies a string that contains help information for this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_help
     */
    get_Help() {
        pszHelp := BSTR()
        result := ComCall(13, this, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * Specifies the keyboard shortcut for this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_keyboardshortcut
     */
    get_KeyboardShortcut() {
        pszKeyboardShortcut := BSTR()
        result := ComCall(14, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * Retrieves the selected item or items in the control.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> containing the selected items.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-getselection
     */
    GetSelection() {
        result := ComCall(15, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return pvarSelectedChildren
    }

    /**
     * Contains a description of the default action for this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-ilegacyiaccessibleprovider-get_defaultaction
     */
    get_DefaultAction() {
        pszDefaultAction := BSTR()
        result := ComCall(16, this, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }
}
