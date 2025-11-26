#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationElementArray.ahk
#Include .\IAccessible.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods and properties that enable Microsoft UI Automation clients to retrieve UI information from Microsoft Active Accessibility (MSAA) servers.
 * @remarks
 * 
 * This interface is obtained just like any other control pattern. It enables UI Automation clients to gather MSAA properties more efficiently, taking advantage of the caching system, and also enables UI Automation clients to interact with native Microsoft Active Accessibility servers that support the <b>IAccessible</b> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationlegacyiaccessiblepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationLegacyIAccessiblePattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationLegacyIAccessiblePattern
     * @type {Guid}
     */
    static IID => Guid("{828055ad-355b-4435-86d5-3b51c14a9b1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Select", "DoDefaultAction", "SetValue", "get_CurrentChildId", "get_CurrentName", "get_CurrentValue", "get_CurrentDescription", "get_CurrentRole", "get_CurrentState", "get_CurrentHelp", "get_CurrentKeyboardShortcut", "GetCurrentSelection", "get_CurrentDefaultAction", "get_CachedChildId", "get_CachedName", "get_CachedValue", "get_CachedDescription", "get_CachedRole", "get_CachedState", "get_CachedHelp", "get_CachedKeyboardShortcut", "GetCachedSelection", "get_CachedDefaultAction", "GetIAccessible"]

    /**
     * @type {Integer} 
     */
    CurrentChildId {
        get => this.get_CurrentChildId()
    }

    /**
     * @type {BSTR} 
     */
    CurrentName {
        get => this.get_CurrentName()
    }

    /**
     * @type {BSTR} 
     */
    CurrentValue {
        get => this.get_CurrentValue()
    }

    /**
     * @type {BSTR} 
     */
    CurrentDescription {
        get => this.get_CurrentDescription()
    }

    /**
     * @type {Integer} 
     */
    CurrentRole {
        get => this.get_CurrentRole()
    }

    /**
     * @type {Integer} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * @type {BSTR} 
     */
    CurrentHelp {
        get => this.get_CurrentHelp()
    }

    /**
     * @type {BSTR} 
     */
    CurrentKeyboardShortcut {
        get => this.get_CurrentKeyboardShortcut()
    }

    /**
     * @type {BSTR} 
     */
    CurrentDefaultAction {
        get => this.get_CurrentDefaultAction()
    }

    /**
     * @type {Integer} 
     */
    CachedChildId {
        get => this.get_CachedChildId()
    }

    /**
     * @type {BSTR} 
     */
    CachedName {
        get => this.get_CachedName()
    }

    /**
     * @type {BSTR} 
     */
    CachedValue {
        get => this.get_CachedValue()
    }

    /**
     * @type {BSTR} 
     */
    CachedDescription {
        get => this.get_CachedDescription()
    }

    /**
     * @type {Integer} 
     */
    CachedRole {
        get => this.get_CachedRole()
    }

    /**
     * @type {Integer} 
     */
    CachedState {
        get => this.get_CachedState()
    }

    /**
     * @type {BSTR} 
     */
    CachedHelp {
        get => this.get_CachedHelp()
    }

    /**
     * @type {BSTR} 
     */
    CachedKeyboardShortcut {
        get => this.get_CachedKeyboardShortcut()
    }

    /**
     * @type {BSTR} 
     */
    CachedDefaultAction {
        get => this.get_CachedDefaultAction()
    }

    /**
     * Performs a Microsoft Active Accessibility selection.
     * @param {Integer} flagsSelect Type: <b>long</b>
     * 
     * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the values described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-select
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "HRESULT")
        return result
    }

    /**
     * Performs the Microsoft Active Accessibility default action for the element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-dodefaultaction
     */
    DoDefaultAction() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the Microsoft Active Accessibility value property for the element.
     * @param {PWSTR} szValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A localized string that contains the object's value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-setvalue
     */
    SetValue(szValue) {
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(5, this, "ptr", szValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the Microsoft Active Accessibility child identifier for the element.
     * @remarks
     * 
     * If the element is not a child element, CHILDID_SELF (0) is returned.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentchildid
     */
    get_CurrentChildId() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the Microsoft Active Accessibility name property of the element.
     * @remarks
     * 
     * The name of an element can be used to find the element in the element tree when the automation ID property is not supported on the element.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentname
     */
    get_CurrentName() {
        pszName := BSTR()
        result := ComCall(7, this, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * Retrieves the Microsoft Active Accessibility value property.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentvalue
     */
    get_CurrentValue() {
        pszValue := BSTR()
        result := ComCall(8, this, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * Retrieves the Microsoft Active Accessibility description of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdescription
     */
    get_CurrentDescription() {
        pszDescription := BSTR()
        result := ComCall(9, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * Retrieves the Microsoft Active Accessibility role identifier of the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentrole
     */
    get_CurrentRole() {
        result := ComCall(10, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * Retrieves the Microsoft Active Accessibility state identifier for the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentstate
     */
    get_CurrentState() {
        result := ComCall(11, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Retrieves the Microsoft Active Accessibility help string for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currenthelp
     */
    get_CurrentHelp() {
        pszHelp := BSTR()
        result := ComCall(12, this, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * Retrieves the Microsoft Active Accessibility keyboard shortcut property for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentkeyboardshortcut
     */
    get_CurrentKeyboardShortcut() {
        pszKeyboardShortcut := BSTR()
        result := ComCall(13, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * Retrieves the Microsoft Active Accessibility property that identifies the selected children of this element.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of the selected child elements.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(14, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return IUIAutomationElementArray(pvarSelectedChildren)
    }

    /**
     * Retrieves the Microsoft Active Accessibility current default action for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdefaultaction
     */
    get_CurrentDefaultAction() {
        pszDefaultAction := BSTR()
        result := ComCall(15, this, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility child identifier for the element.
     * @remarks
     * 
     * If the element is not a child element, CHILDID_SELF (0) is returned.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedchildid
     */
    get_CachedChildId() {
        result := ComCall(16, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility name property of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedname
     */
    get_CachedName() {
        pszName := BSTR()
        result := ComCall(17, this, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility value property.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedvalue
     */
    get_CachedValue() {
        pszValue := BSTR()
        result := ComCall(18, this, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility description of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddescription
     */
    get_CachedDescription() {
        pszDescription := BSTR()
        result := ComCall(19, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility role of the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedrole
     */
    get_CachedRole() {
        result := ComCall(20, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility state identifier for the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedstate
     */
    get_CachedState() {
        result := ComCall(21, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility help string for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedhelp
     */
    get_CachedHelp() {
        pszHelp := BSTR()
        result := ComCall(22, this, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility keyboard shortcut property for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedkeyboardshortcut
     */
    get_CachedKeyboardShortcut() {
        pszKeyboardShortcut := BSTR()
        result := ComCall(23, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility property that identifies the selected children of this element.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the cached collection of the selected child elements.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcachedselection
     */
    GetCachedSelection() {
        result := ComCall(24, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return IUIAutomationElementArray(pvarSelectedChildren)
    }

    /**
     * Retrieves the Microsoft Active Accessibility cached default action for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddefaultaction
     */
    get_CachedDefaultAction() {
        pszDefaultAction := BSTR()
        result := ComCall(25, this, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * Retrieves an IAccessible object that corresponds to the Microsoft UI Automation element.
     * @returns {IAccessible} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface for the accessible object.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getiaccessible
     */
    GetIAccessible() {
        result := ComCall(26, this, "ptr*", &ppAccessible := 0, "HRESULT")
        return IAccessible(ppAccessible)
    }
}
