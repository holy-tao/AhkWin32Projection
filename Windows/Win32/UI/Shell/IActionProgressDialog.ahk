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
     * Provides details about the action progress dialog.
     * @param {Integer} flags Type: <b>SPINITF</b>
     * @param {PWSTR} pszTitle Type: <b>LPCWSTR</b>
     * 
     * The title of the progress dialog.
     * @param {PWSTR} pszCancel Type: <b>LPCWSTR</b>
     * 
     * The string displayed when a user closes the dialog before completion.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iactionprogressdialog-initialize
     */
    Initialize(flags, pszTitle, pszCancel) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszCancel := pszCancel is String ? StrPtr(pszCancel) : pszCancel

        result := ComCall(3, this, "uint", flags, "ptr", pszTitle, "ptr", pszCancel, "HRESULT")
        return result
    }

    /**
     * Stops a progress dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iactionprogressdialog-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
