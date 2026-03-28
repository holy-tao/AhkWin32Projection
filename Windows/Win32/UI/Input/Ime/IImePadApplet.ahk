#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IImePadApplet interface inputs strings into apps through the IImePad interface.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/nn-imepad-iimepadapplet
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IImePadApplet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImePadApplet
     * @type {Guid}
     */
    static IID => Guid("{5d8e643b-c3a9-11d1-afef-00805f0c8b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Terminate", "GetAppletConfig", "CreateUI", "Notify"]

    /**
     * Called from IImePad interface to initialize IImePadApplet.
     * @remarks
     * When the ImePad user interface is created, <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepad">IImePad</a> calls this method and sets the IImePad interface pointer as an argument. The applet can save and use this pointer to call the <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nf-imepad-iimepad-request">pIImePad->IImePad::Request</a> method.
     * @param {IUnknown} lpIImePad Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepad">IImePad</a> (<b>IUnknown</b> *)
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-initialize
     */
    Initialize(lpIImePad) {
        result := ComCall(3, this, "ptr", lpIImePad, "HRESULT")
        return result
    }

    /**
     * Called from IImePad to terminate IImePadApplet when the IMEPad instance exits.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-terminate
     */
    Terminate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEAPPLETCFG>} lpAppletCfg 
     * @returns {HRESULT} 
     */
    GetAppletConfig(lpAppletCfg) {
        result := ComCall(5, this, "ptr", lpAppletCfg, "HRESULT")
        return result
    }

    /**
     * Called from IImePad to get the applet's window handle, style, and size.
     * @param {HWND} hwndParent Window handle of the <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepad">IImePad</a> GUI. The applet can create the window as its child window.
     * @param {Pointer<IMEAPPLETUI>} lpImeAppletUI Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/imepad/ns-imepad-imeappletui">IMEAPPLETUI</a> structure. The applet can set its window style.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-createui
     */
    CreateUI(hwndParent, lpImeAppletUI) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", lpImeAppletUI, "HRESULT")
        return result
    }

    /**
     * Called from IImePad to pass information with a notify code.
     * @remarks
     * <h3><a id="Possible_notify_codes__IMEPN___values_"></a><a id="possible_notify_codes__imepn___values_"></a><a id="POSSIBLE_NOTIFY_CODES__IMEPN___VALUES_"></a>Possible notify codes (<b>IMEPN_*</b> values)</h3>
     * 
     * <table>
     * <tr>
     * <th>Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>IMEPN_ACTIVATE</b></td>
     * <td>The applet is activated.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_INACTIVATE</b></td>
     * <td>The applet is inactivate.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_SHOW</b></td>
     * <td>IMEPad and the applet are shown.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_HIDE</b></td>
     * <td>IMEPad and the applet are hidden.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_SIZECHANGING</b></td>
     * <td>The applet size is changing.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_SIZECHANGED</b></td>
     * <td>The applet size has changed.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_CONFIG</b></td>
     * <td>The applet setting is selected in IMEPad menu.</td>
     * </tr>
     * <tr>
     * <td><b>IMEPN_HELP</b></td>
     * <td>The applet help is selected in IMEPad menu.</td>
     * </tr>
     * </table>
     * @param {IUnknown} lpImePad Pointer of IUnknown interface. To get the <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepad">IImePad</a> interface pointer, use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>.
     * @param {Integer} notify The <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepadapplet">IImePadApplet</a> notify code. See Remarks for the possible codes.
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-notify
     */
    Notify(lpImePad, notify, _wParam, _lParam) {
        result := ComCall(7, this, "ptr", lpImePad, "int", notify, "ptr", _wParam, "ptr", _lParam, "HRESULT")
        return result
    }
}
