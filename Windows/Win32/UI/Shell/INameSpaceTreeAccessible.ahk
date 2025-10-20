#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that perform accessibility actions on a Shell item from a namespace tree control.
 * @remarks
 * 
  * This interface is used only by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol">INameSpaceTreeControl</a> (CLSID_NameSpaceTreeControl).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-inamespacetreeaccessible
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeAccessible extends IUnknown{
    /**
     * The interface identifier for INameSpaceTreeAccessible
     * @type {Guid}
     */
    static IID => Guid("{71f312de-43ed-4190-8477-e9536b82350b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<BSTR>} pbstrDefaultAction 
     * @returns {HRESULT} 
     */
    OnGetDefaultAccessibilityAction(psi, pbstrDefaultAction) {
        result := ComCall(3, this, "ptr", psi, "ptr", pbstrDefaultAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    OnDoDefaultAccessibilityAction(psi) {
        result := ComCall(4, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Pointer<VARIANT>} pvarRole 
     * @returns {HRESULT} 
     */
    OnGetAccessibilityRole(psi, pvarRole) {
        result := ComCall(5, this, "ptr", psi, "ptr", pvarRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
