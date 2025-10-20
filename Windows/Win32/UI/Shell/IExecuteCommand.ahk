#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that set a given state or parameter related to the command verb, as well as a method to invoke that verb.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement this interface when you choose it as your method to invoke the verb to perform an action on selected items. The items are passed as a Shell item array through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iobjectwithselection-setselection">IObjectWithSelection::SetSelection</a>, so the object must also implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iobjectwithselection">IObjectWithSelection</a>.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Do not call the methods of <b>IExecuteCommand</b> directly. Windows Explorer calls your <b>IExecuteCommand</b> methods when the user wants to perform an action on the items.
  * 
  * Note that, apart from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexecutecommand-execute">Execute</a>, the methods of this interface pass system information to the handler. The system itself calls these methods, setting the parameters appropriately based on system settings and conditions.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iexecutecommand
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExecuteCommand extends IUnknown{
    /**
     * The interface identifier for IExecuteCommand
     * @type {Guid}
     */
    static IID => Guid("{7f9185b0-cb92-43c5-80a9-92277a4f7b54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} grfKeyState 
     * @returns {HRESULT} 
     */
    SetKeyState(grfKeyState) {
        result := ComCall(3, this, "uint", grfKeyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszParameters 
     * @returns {HRESULT} 
     */
    SetParameters(pszParameters) {
        pszParameters := pszParameters is String ? StrPtr(pszParameters) : pszParameters

        result := ComCall(4, this, "ptr", pszParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} pt 
     * @returns {HRESULT} 
     */
    SetPosition(pt) {
        result := ComCall(5, this, "ptr", pt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nShow 
     * @returns {HRESULT} 
     */
    SetShowWindow(nShow) {
        result := ComCall(6, this, "int", nShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fNoShowUI 
     * @returns {HRESULT} 
     */
    SetNoShowUI(fNoShowUI) {
        result := ComCall(7, this, "int", fNoShowUI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDirectory 
     * @returns {HRESULT} 
     */
    SetDirectory(pszDirectory) {
        pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

        result := ComCall(8, this, "ptr", pszDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Execute() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
