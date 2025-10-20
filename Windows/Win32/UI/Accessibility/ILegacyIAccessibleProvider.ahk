#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IAccessible>} ppAccessible 
     * @returns {HRESULT} 
     */
    GetIAccessible(ppAccessible) {
        result := ComCall(6, this, "ptr", ppAccessible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ChildId(pRetVal) {
        result := ComCall(7, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszName 
     * @returns {HRESULT} 
     */
    get_Name(pszName) {
        result := ComCall(8, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszValue 
     * @returns {HRESULT} 
     */
    get_Value(pszValue) {
        result := ComCall(9, this, "ptr", pszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     */
    get_Description(pszDescription) {
        result := ComCall(10, this, "ptr", pszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRole 
     * @returns {HRESULT} 
     */
    get_Role(pdwRole) {
        result := ComCall(11, this, "uint*", pdwRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwState 
     * @returns {HRESULT} 
     */
    get_State(pdwState) {
        result := ComCall(12, this, "uint*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelp 
     * @returns {HRESULT} 
     */
    get_Help(pszHelp) {
        result := ComCall(13, this, "ptr", pszHelp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszKeyboardShortcut 
     * @returns {HRESULT} 
     */
    get_KeyboardShortcut(pszKeyboardShortcut) {
        result := ComCall(14, this, "ptr", pszKeyboardShortcut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pvarSelectedChildren 
     * @returns {HRESULT} 
     */
    GetSelection(pvarSelectedChildren) {
        result := ComCall(15, this, "ptr", pvarSelectedChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDefaultAction 
     * @returns {HRESULT} 
     */
    get_DefaultAction(pszDefaultAction) {
        result := ComCall(16, this, "ptr", pszDefaultAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
