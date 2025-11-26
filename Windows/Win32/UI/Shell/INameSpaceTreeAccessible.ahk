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
     * Gets the default accessibility action for a Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> that specifies the default, accessibility action.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreeaccessible-ongetdefaultaccessibilityaction
     */
    OnGetDefaultAccessibilityAction(psi) {
        pbstrDefaultAction := BSTR()
        result := ComCall(3, this, "ptr", psi, "ptr", pbstrDefaultAction, "HRESULT")
        return pbstrDefaultAction
    }

    /**
     * Invokes the default accessibility action on a Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreeaccessible-ondodefaultaccessibilityaction
     */
    OnDoDefaultAccessibilityAction(psi) {
        result := ComCall(4, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Gets the accessibility role for a Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that specifies the role.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreeaccessible-ongetaccessibilityrole
     */
    OnGetAccessibilityRole(psi) {
        pvarRole := VARIANT()
        result := ComCall(5, this, "ptr", psi, "ptr", pvarRole, "HRESULT")
        return pvarRole
    }
}
