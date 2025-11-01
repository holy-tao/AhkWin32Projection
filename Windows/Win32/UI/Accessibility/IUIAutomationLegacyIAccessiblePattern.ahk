#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} flagsSelect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-select
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-dodefaultaction
     */
    DoDefaultAction() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-setvalue
     */
    SetValue(szValue) {
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(5, this, "ptr", szValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentchildid
     */
    get_CurrentChildId(pRetVal) {
        result := ComCall(6, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentname
     */
    get_CurrentName(pszName) {
        result := ComCall(7, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentvalue
     */
    get_CurrentValue(pszValue) {
        result := ComCall(8, this, "ptr", pszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdescription
     */
    get_CurrentDescription(pszDescription) {
        result := ComCall(9, this, "ptr", pszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentrole
     */
    get_CurrentRole(pdwRole) {
        result := ComCall(10, this, "uint*", pdwRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentstate
     */
    get_CurrentState(pdwState) {
        result := ComCall(11, this, "uint*", pdwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currenthelp
     */
    get_CurrentHelp(pszHelp) {
        result := ComCall(12, this, "ptr", pszHelp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszKeyboardShortcut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentkeyboardshortcut
     */
    get_CurrentKeyboardShortcut(pszKeyboardShortcut) {
        result := ComCall(13, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} pvarSelectedChildren 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcurrentselection
     */
    GetCurrentSelection(pvarSelectedChildren) {
        result := ComCall(14, this, "ptr*", pvarSelectedChildren, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDefaultAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdefaultaction
     */
    get_CurrentDefaultAction(pszDefaultAction) {
        result := ComCall(15, this, "ptr", pszDefaultAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedchildid
     */
    get_CachedChildId(pRetVal) {
        result := ComCall(16, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedname
     */
    get_CachedName(pszName) {
        result := ComCall(17, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedvalue
     */
    get_CachedValue(pszValue) {
        result := ComCall(18, this, "ptr", pszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddescription
     */
    get_CachedDescription(pszDescription) {
        result := ComCall(19, this, "ptr", pszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedrole
     */
    get_CachedRole(pdwRole) {
        result := ComCall(20, this, "uint*", pdwRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedstate
     */
    get_CachedState(pdwState) {
        result := ComCall(21, this, "uint*", pdwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedhelp
     */
    get_CachedHelp(pszHelp) {
        result := ComCall(22, this, "ptr", pszHelp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszKeyboardShortcut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedkeyboardshortcut
     */
    get_CachedKeyboardShortcut(pszKeyboardShortcut) {
        result := ComCall(23, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} pvarSelectedChildren 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcachedselection
     */
    GetCachedSelection(pvarSelectedChildren) {
        result := ComCall(24, this, "ptr*", pvarSelectedChildren, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDefaultAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddefaultaction
     */
    get_CachedDefaultAction(pszDefaultAction) {
        result := ComCall(25, this, "ptr", pszDefaultAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} ppAccessible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getiaccessible
     */
    GetIAccessible(ppAccessible) {
        result := ComCall(26, this, "ptr*", ppAccessible, "HRESULT")
        return result
    }
}
