#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAccessible.ahk" { IAccessible }

/**
 * Exposes methods and properties that enable Microsoft UI Automation clients to retrieve UI information from Microsoft Active Accessibility (MSAA) servers.
 * @remarks
 * This interface is obtained just like any other control pattern. It enables UI Automation clients to gather MSAA properties more efficiently, taking advantage of the caching system, and also enables UI Automation clients to interact with native Microsoft Active Accessibility servers that support the <b>IAccessible</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationlegacyiaccessiblepattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationLegacyIAccessiblePattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationLegacyIAccessiblePattern
     * @type {Guid}
     */
    static IID := Guid("{828055ad-355b-4435-86d5-3b51c14a9b1b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationLegacyIAccessiblePattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Select                      : IntPtr
        DoDefaultAction             : IntPtr
        SetValue                    : IntPtr
        get_CurrentChildId          : IntPtr
        get_CurrentName             : IntPtr
        get_CurrentValue            : IntPtr
        get_CurrentDescription      : IntPtr
        get_CurrentRole             : IntPtr
        get_CurrentState            : IntPtr
        get_CurrentHelp             : IntPtr
        get_CurrentKeyboardShortcut : IntPtr
        GetCurrentSelection         : IntPtr
        get_CurrentDefaultAction    : IntPtr
        get_CachedChildId           : IntPtr
        get_CachedName              : IntPtr
        get_CachedValue             : IntPtr
        get_CachedDescription       : IntPtr
        get_CachedRole              : IntPtr
        get_CachedState             : IntPtr
        get_CachedHelp              : IntPtr
        get_CachedKeyboardShortcut  : IntPtr
        GetCachedSelection          : IntPtr
        get_CachedDefaultAction     : IntPtr
        GetIAccessible              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationLegacyIAccessiblePattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Performs a Microsoft Active Accessibility selection. (IUIAutomationLegacyIAccessiblePattern.Select)
     * @param {Integer} flagsSelect Type: <b>long</b>
     * 
     * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the values described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-select
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "HRESULT")
        return result
    }

    /**
     * Performs the Microsoft Active Accessibility default action for the element. (IUIAutomationLegacyIAccessiblePattern.DoDefaultAction)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-dodefaultaction
     */
    DoDefaultAction() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the Microsoft Active Accessibility value property for the element.
     * @remarks
     * This method is supported only for some elements (usually edit controls).
     * @param {PWSTR} szValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A localized string that contains the object's value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-setvalue
     */
    SetValue(szValue) {
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(5, this, "ptr", szValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the Microsoft Active Accessibility child identifier for the element.
     * @remarks
     * If the element is not a child element, CHILDID_SELF (0) is returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentchildid
     */
    get_CurrentChildId() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the Microsoft Active Accessibility name property of the element.
     * @remarks
     * The name of an element can be used to find the element in the element tree when the automation ID property is not supported on the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentname
     */
    get_CurrentName() {
        pszName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pszName, "HRESULT")
        return pszName
    }

    /**
     * Retrieves the Microsoft Active Accessibility value property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentvalue
     */
    get_CurrentValue() {
        pszValue := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pszValue, "HRESULT")
        return pszValue
    }

    /**
     * Retrieves the Microsoft Active Accessibility description of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdescription
     */
    get_CurrentDescription() {
        pszDescription := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * Retrieves the Microsoft Active Accessibility role identifier of the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentrole
     */
    get_CurrentRole() {
        result := ComCall(10, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * Retrieves the Microsoft Active Accessibility state identifier for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentstate
     */
    get_CurrentState() {
        result := ComCall(11, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Retrieves the Microsoft Active Accessibility help string for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currenthelp
     */
    get_CurrentHelp() {
        pszHelp := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * Retrieves the Microsoft Active Accessibility keyboard shortcut property for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentkeyboardshortcut
     */
    get_CurrentKeyboardShortcut() {
        pszKeyboardShortcut := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * Retrieves the Microsoft Active Accessibility property that identifies the selected children of this element.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of the selected child elements.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(14, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return IUIAutomationElementArray(pvarSelectedChildren)
    }

    /**
     * Retrieves the Microsoft Active Accessibility current default action for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdefaultaction
     */
    get_CurrentDefaultAction() {
        pszDefaultAction := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility child identifier for the element.
     * @remarks
     * If the element is not a child element, CHILDID_SELF (0) is returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedchildid
     */
    get_CachedChildId() {
        result := ComCall(16, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility name property of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedname
     */
    get_CachedName() {
        pszName := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pszName, "HRESULT")
        return pszName
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility value property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedvalue
     */
    get_CachedValue() {
        pszValue := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pszValue, "HRESULT")
        return pszValue
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility description of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddescription
     */
    get_CachedDescription() {
        pszDescription := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility role of the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedrole
     */
    get_CachedRole() {
        result := ComCall(20, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility state identifier for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedstate
     */
    get_CachedState() {
        result := ComCall(21, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility help string for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedhelp
     */
    get_CachedHelp() {
        pszHelp := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility keyboard shortcut property for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedkeyboardshortcut
     */
    get_CachedKeyboardShortcut() {
        pszKeyboardShortcut := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * Retrieves the cached Microsoft Active Accessibility property that identifies the selected children of this element.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the cached collection of the selected child elements.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcachedselection
     */
    GetCachedSelection() {
        result := ComCall(24, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return IUIAutomationElementArray(pvarSelectedChildren)
    }

    /**
     * Retrieves the Microsoft Active Accessibility cached default action for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddefaultaction
     */
    get_CachedDefaultAction() {
        pszDefaultAction := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * Retrieves an IAccessible object that corresponds to the Microsoft UI Automation element.
     * @remarks
     * This method returns <b>NULL</b> if the underlying implementation of the UI Automation element is not a native Microsoft Active Accessibility server; that is, if a client attempts to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface for an element originally supported by a proxy object from OLEACC.dll, or by the UIA-to-MSAA Bridge.
     * @returns {IAccessible} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface for the accessible object.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getiaccessible
     */
    GetIAccessible() {
        result := ComCall(26, this, "ptr*", &ppAccessible := 0, "HRESULT")
        return IAccessible(ppAccessible)
    }

    Query(iid) {
        if (IUIAutomationLegacyIAccessiblePattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Select := CallbackCreate(GetMethod(implObj, "Select"), flags, 2)
        this.vtbl.DoDefaultAction := CallbackCreate(GetMethod(implObj, "DoDefaultAction"), flags, 1)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 2)
        this.vtbl.get_CurrentChildId := CallbackCreate(GetMethod(implObj, "get_CurrentChildId"), flags, 2)
        this.vtbl.get_CurrentName := CallbackCreate(GetMethod(implObj, "get_CurrentName"), flags, 2)
        this.vtbl.get_CurrentValue := CallbackCreate(GetMethod(implObj, "get_CurrentValue"), flags, 2)
        this.vtbl.get_CurrentDescription := CallbackCreate(GetMethod(implObj, "get_CurrentDescription"), flags, 2)
        this.vtbl.get_CurrentRole := CallbackCreate(GetMethod(implObj, "get_CurrentRole"), flags, 2)
        this.vtbl.get_CurrentState := CallbackCreate(GetMethod(implObj, "get_CurrentState"), flags, 2)
        this.vtbl.get_CurrentHelp := CallbackCreate(GetMethod(implObj, "get_CurrentHelp"), flags, 2)
        this.vtbl.get_CurrentKeyboardShortcut := CallbackCreate(GetMethod(implObj, "get_CurrentKeyboardShortcut"), flags, 2)
        this.vtbl.GetCurrentSelection := CallbackCreate(GetMethod(implObj, "GetCurrentSelection"), flags, 2)
        this.vtbl.get_CurrentDefaultAction := CallbackCreate(GetMethod(implObj, "get_CurrentDefaultAction"), flags, 2)
        this.vtbl.get_CachedChildId := CallbackCreate(GetMethod(implObj, "get_CachedChildId"), flags, 2)
        this.vtbl.get_CachedName := CallbackCreate(GetMethod(implObj, "get_CachedName"), flags, 2)
        this.vtbl.get_CachedValue := CallbackCreate(GetMethod(implObj, "get_CachedValue"), flags, 2)
        this.vtbl.get_CachedDescription := CallbackCreate(GetMethod(implObj, "get_CachedDescription"), flags, 2)
        this.vtbl.get_CachedRole := CallbackCreate(GetMethod(implObj, "get_CachedRole"), flags, 2)
        this.vtbl.get_CachedState := CallbackCreate(GetMethod(implObj, "get_CachedState"), flags, 2)
        this.vtbl.get_CachedHelp := CallbackCreate(GetMethod(implObj, "get_CachedHelp"), flags, 2)
        this.vtbl.get_CachedKeyboardShortcut := CallbackCreate(GetMethod(implObj, "get_CachedKeyboardShortcut"), flags, 2)
        this.vtbl.GetCachedSelection := CallbackCreate(GetMethod(implObj, "GetCachedSelection"), flags, 2)
        this.vtbl.get_CachedDefaultAction := CallbackCreate(GetMethod(implObj, "get_CachedDefaultAction"), flags, 2)
        this.vtbl.GetIAccessible := CallbackCreate(GetMethod(implObj, "GetIAccessible"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Select)
        CallbackFree(this.vtbl.DoDefaultAction)
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.get_CurrentChildId)
        CallbackFree(this.vtbl.get_CurrentName)
        CallbackFree(this.vtbl.get_CurrentValue)
        CallbackFree(this.vtbl.get_CurrentDescription)
        CallbackFree(this.vtbl.get_CurrentRole)
        CallbackFree(this.vtbl.get_CurrentState)
        CallbackFree(this.vtbl.get_CurrentHelp)
        CallbackFree(this.vtbl.get_CurrentKeyboardShortcut)
        CallbackFree(this.vtbl.GetCurrentSelection)
        CallbackFree(this.vtbl.get_CurrentDefaultAction)
        CallbackFree(this.vtbl.get_CachedChildId)
        CallbackFree(this.vtbl.get_CachedName)
        CallbackFree(this.vtbl.get_CachedValue)
        CallbackFree(this.vtbl.get_CachedDescription)
        CallbackFree(this.vtbl.get_CachedRole)
        CallbackFree(this.vtbl.get_CachedState)
        CallbackFree(this.vtbl.get_CachedHelp)
        CallbackFree(this.vtbl.get_CachedKeyboardShortcut)
        CallbackFree(this.vtbl.GetCachedSelection)
        CallbackFree(this.vtbl.get_CachedDefaultAction)
        CallbackFree(this.vtbl.GetIAccessible)
    }
}
