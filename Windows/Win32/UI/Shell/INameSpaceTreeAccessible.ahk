#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnGetDefaultAccessibilityAction", "OnDoDefaultAccessibilityAction", "OnGetAccessibilityRole"]

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreeaccessible-ongetdefaultaccessibilityaction
     */
    OnGetDefaultAccessibilityAction(psi) {
        pbstrDefaultAction := BSTR()
        result := ComCall(3, this, "ptr", psi, "ptr", pbstrDefaultAction, "HRESULT")
        return pbstrDefaultAction
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreeaccessible-ondodefaultaccessibilityaction
     */
    OnDoDefaultAccessibilityAction(psi) {
        result := ComCall(4, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreeaccessible-ongetaccessibilityrole
     */
    OnGetAccessibilityRole(psi) {
        pvarRole := VARIANT()
        result := ComCall(5, this, "ptr", psi, "ptr", pvarRole, "HRESULT")
        return pvarRole
    }
}
