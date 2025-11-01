#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IImePadApplet interface inputs strings into apps through the IImePad interface.
 * @see https://docs.microsoft.com/windows/win32/api//imepad/nn-imepad-iimepadapplet
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} lpIImePad 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(lpIImePad) {
        result := ComCall(3, this, "ptr", lpIImePad, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
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
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<IMEAPPLETUI>} lpImeAppletUI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-createui
     */
    CreateUI(hwndParent, lpImeAppletUI) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", lpImeAppletUI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} lpImePad 
     * @param {Integer} notify 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepadapplet-notify
     */
    Notify(lpImePad, notify, wParam, lParam) {
        result := ComCall(7, this, "ptr", lpImePad, "int", notify, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
