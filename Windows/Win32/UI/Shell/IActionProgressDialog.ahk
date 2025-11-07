#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that initialize and stop a progress dialog.
 * @remarks
 * 
 * To instantiate an object that implements this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> using the class identifier (CLSID) CLSID_ProgressDialog.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iactionprogressdialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IActionProgressDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionProgressDialog
     * @type {Guid}
     */
    static IID => Guid("{49ff1172-eadc-446d-9285-156453a6431c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Stop"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} flags 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszCancel 
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
    Initialize(flags, pszTitle, pszCancel) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszCancel := pszCancel is String ? StrPtr(pszCancel) : pszCancel

        result := ComCall(3, this, "uint", flags, "ptr", pszTitle, "ptr", pszCancel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogressdialog-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
