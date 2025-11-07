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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentchildid
     */
    get_CurrentChildId() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentname
     */
    get_CurrentName() {
        pszName := BSTR()
        result := ComCall(7, this, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentvalue
     */
    get_CurrentValue() {
        pszValue := BSTR()
        result := ComCall(8, this, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdescription
     */
    get_CurrentDescription() {
        pszDescription := BSTR()
        result := ComCall(9, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentrole
     */
    get_CurrentRole() {
        result := ComCall(10, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentstate
     */
    get_CurrentState() {
        result := ComCall(11, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currenthelp
     */
    get_CurrentHelp() {
        pszHelp := BSTR()
        result := ComCall(12, this, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentkeyboardshortcut
     */
    get_CurrentKeyboardShortcut() {
        pszKeyboardShortcut := BSTR()
        result := ComCall(13, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(14, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return IUIAutomationElementArray(pvarSelectedChildren)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_currentdefaultaction
     */
    get_CurrentDefaultAction() {
        pszDefaultAction := BSTR()
        result := ComCall(15, this, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedchildid
     */
    get_CachedChildId() {
        result := ComCall(16, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedname
     */
    get_CachedName() {
        pszName := BSTR()
        result := ComCall(17, this, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedvalue
     */
    get_CachedValue() {
        pszValue := BSTR()
        result := ComCall(18, this, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddescription
     */
    get_CachedDescription() {
        pszDescription := BSTR()
        result := ComCall(19, this, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedrole
     */
    get_CachedRole() {
        result := ComCall(20, this, "uint*", &pdwRole := 0, "HRESULT")
        return pdwRole
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedstate
     */
    get_CachedState() {
        result := ComCall(21, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedhelp
     */
    get_CachedHelp() {
        pszHelp := BSTR()
        result := ComCall(22, this, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cachedkeyboardshortcut
     */
    get_CachedKeyboardShortcut() {
        pszKeyboardShortcut := BSTR()
        result := ComCall(23, this, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getcachedselection
     */
    GetCachedSelection() {
        result := ComCall(24, this, "ptr*", &pvarSelectedChildren := 0, "HRESULT")
        return IUIAutomationElementArray(pvarSelectedChildren)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-get_cacheddefaultaction
     */
    get_CachedDefaultAction() {
        pszDefaultAction := BSTR()
        result := ComCall(25, this, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * 
     * @returns {IAccessible} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationlegacyiaccessiblepattern-getiaccessible
     */
    GetIAccessible() {
        result := ComCall(26, this, "ptr*", &ppAccessible := 0, "HRESULT")
        return IAccessible(ppAccessible)
    }
}
