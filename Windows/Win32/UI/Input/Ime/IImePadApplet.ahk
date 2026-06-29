#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\IMEAPPLETCFG.ahk" { IMEAPPLETCFG }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMEAPPLETUI.ahk" { IMEAPPLETUI }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * The IImePadApplet interface inputs strings into apps through the IImePad interface.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/nn-imepad-iimepadapplet
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IImePadApplet extends IUnknown {
    /**
     * The interface identifier for IImePadApplet
     * @type {Guid}
     */
    static IID := Guid("{5d8e643b-c3a9-11d1-afef-00805f0c8b6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImePadApplet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize      : IntPtr
        Terminate       : IntPtr
        GetAppletConfig : IntPtr
        CreateUI        : IntPtr
        Notify          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImePadApplet.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(5, this, IMEAPPLETCFG.Ptr, lpAppletCfg, "HRESULT")
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
        result := ComCall(6, this, HWND, hwndParent, IMEAPPLETUI.Ptr, lpImeAppletUI, "HRESULT")
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
     * @param {WPARAM} _wParam Additional information specific to <i>notify</i>.
     * @param {LPARAM} _lParam Additional information specific to <i>notify</i>.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-notify
     */
    Notify(lpImePad, notify, _wParam, _lParam) {
        result := ComCall(7, this, "ptr", lpImePad, "int", notify, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImePadApplet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 1)
        this.vtbl.GetAppletConfig := CallbackCreate(GetMethod(implObj, "GetAppletConfig"), flags, 2)
        this.vtbl.CreateUI := CallbackCreate(GetMethod(implObj, "CreateUI"), flags, 3)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Terminate)
        CallbackFree(this.vtbl.GetAppletConfig)
        CallbackFree(this.vtbl.CreateUI)
        CallbackFree(this.vtbl.Notify)
    }
}
