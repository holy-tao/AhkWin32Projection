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
     * 
     * @param {Pointer<SMDATA>} psmd 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenucallback-callbacksm
     */
    CallbackSM(psmd, uMsg, wParam, lParam) {
        result := ComCall(3, this, "ptr", psmd, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
