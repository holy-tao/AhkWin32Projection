#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that change UI activation and process accelerators for a user input object contained in the Shell.
 * @remarks
 * 
 * Implement <b>IInputObject</b> if you are implementing a Shell object that takes user input.
 * 
 * You do not call this interface directly. <b>IInputObject</b> is used by the Shell or the browser to notify the object of UI activation changes and to translate keyboard accelerators.
 * 
 * <b>IInputObject</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed methods are specific to <b>IInputObject</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iinputobject
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputObject
     * @type {Guid}
     */
    static IID => Guid("{68284faa-6a48-11d0-8c78-00c04fd918b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UIActivateIO", "HasFocusIO", "TranslateAcceleratorIO"]

    /**
     * UI-activates or deactivates the object.
     * @param {BOOL} fActivate Type: <b>BOOL</b>
     * 
     * Indicates if the object is being activated or deactivated. If this value is nonzero, the object is being activated. If this value is zero, the object is being deactivated.
     * @param {Pointer<MSG>} pMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains the message that caused the activation change. This value may be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iinputobject-uiactivateio
     */
    UIActivateIO(fActivate, pMsg) {
        result := ComCall(3, this, "int", fActivate, "ptr", pMsg, "HRESULT")
        return result
    }

    /**
     * Determines if one of the object's windows has the keyboard focus.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if one of the object's windows has the keyboard focus, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iinputobject-hasfocusio
     */
    HasFocusIO() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Enables the object to process keyboard accelerators.
     * @param {Pointer<MSG>} pMsg Type: <b>LPMSG</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains the keyboard message that is being translated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the accelerator was translated, or <b>S_FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iinputobject-translateacceleratorio
     */
    TranslateAcceleratorIO(pMsg) {
        result := ComCall(5, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
