#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback interface that exposes a method that receives messages from a menu band.
 * @remarks
 * 
 * Once you have created the menu band object, pass a pointer to this interface to the menu band object by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>. You receive messages from the menu band through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenucallback-callbacksm">IShellMenuCallback::CallbackSM</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellmenucallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellMenuCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellMenuCallback
     * @type {Guid}
     */
    static IID => Guid("{4ca300a1-9b8d-11d1-8b22-00c04fd918d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CallbackSM"]

    /**
     * Receives messages from a menu band object.
     * @param {Pointer<SMDATA>} psmd Type: <b>LPSMDATA</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-smdata">SMDATA</a> structure that contains information about the menu.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * A message ID. This will be one of the SMC_XXX values. See <a href="https://docs.microsoft.com/windows/desktop/shell/control-panel-applications">Shell Messages and Notifications</a> for a complete list.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * A WPARAM value that contains additional information. See the specific SMC_XXX message reference for details.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * An LPARAM value that contains additional information. See the specific SMC_XXX message reference for details.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenucallback-callbacksm
     */
    CallbackSM(psmd, uMsg, wParam, lParam) {
        result := ComCall(3, this, "ptr", psmd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
