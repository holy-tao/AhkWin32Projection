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
     * 
     * @param {Integer} flagsSelect 
     * @returns {HRESULT} 
     */
    Select(flagsSelect) {
        result := ComCall(3, this, "int", flagsSelect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DoDefaultAction() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szValue 
     * @returns {HRESULT} 
     */
    SetValue(szValue) {
        szValue := szValue is String ? StrPtr(szValue) : szValue

        result := ComCall(5, this, "ptr", szValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CurrentChildId(pRetVal) {
        result := ComCall(6, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszName 
     * @returns {HRESULT} 
     */
    get_CurrentName(pszName) {
        result := ComCall(7, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszValue 
     * @returns {HRESULT} 
     */
    get_CurrentValue(pszValue) {
        result := ComCall(8, this, "ptr", pszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     */
    get_CurrentDescription(pszDescription) {
        result := ComCall(9, this, "ptr", pszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRole 
     * @returns {HRESULT} 
     */
    get_CurrentRole(pdwRole) {
        result := ComCall(10, this, "uint*", pdwRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwState 
     * @returns {HRESULT} 
     */
    get_CurrentState(pdwState) {
        result := ComCall(11, this, "uint*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelp 
     * @returns {HRESULT} 
     */
    get_CurrentHelp(pszHelp) {
        result := ComCall(12, this, "ptr", pszHelp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszKeyboardShortcut 
     * @returns {HRESULT} 
     */
    get_CurrentKeyboardShortcut(pszKeyboardShortcut) {
        result := ComCall(13, this, "ptr", pszKeyboardShortcut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} pvarSelectedChildren 
     * @returns {HRESULT} 
     */
    GetCurrentSelection(pvarSelectedChildren) {
        result := ComCall(14, this, "ptr", pvarSelectedChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDefaultAction 
     * @returns {HRESULT} 
     */
    get_CurrentDefaultAction(pszDefaultAction) {
        result := ComCall(15, this, "ptr", pszDefaultAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CachedChildId(pRetVal) {
        result := ComCall(16, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszName 
     * @returns {HRESULT} 
     */
    get_CachedName(pszName) {
        result := ComCall(17, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszValue 
     * @returns {HRESULT} 
     */
    get_CachedValue(pszValue) {
        result := ComCall(18, this, "ptr", pszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     */
    get_CachedDescription(pszDescription) {
        result := ComCall(19, this, "ptr", pszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRole 
     * @returns {HRESULT} 
     */
    get_CachedRole(pdwRole) {
        result := ComCall(20, this, "uint*", pdwRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwState 
     * @returns {HRESULT} 
     */
    get_CachedState(pdwState) {
        result := ComCall(21, this, "uint*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelp 
     * @returns {HRESULT} 
     */
    get_CachedHelp(pszHelp) {
        result := ComCall(22, this, "ptr", pszHelp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszKeyboardShortcut 
     * @returns {HRESULT} 
     */
    get_CachedKeyboardShortcut(pszKeyboardShortcut) {
        result := ComCall(23, this, "ptr", pszKeyboardShortcut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} pvarSelectedChildren 
     * @returns {HRESULT} 
     */
    GetCachedSelection(pvarSelectedChildren) {
        result := ComCall(24, this, "ptr", pvarSelectedChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDefaultAction 
     * @returns {HRESULT} 
     */
    get_CachedDefaultAction(pszDefaultAction) {
        result := ComCall(25, this, "ptr", pszDefaultAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} ppAccessible 
     * @returns {HRESULT} 
     */
    GetIAccessible(ppAccessible) {
        result := ComCall(26, this, "ptr", ppAccessible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
