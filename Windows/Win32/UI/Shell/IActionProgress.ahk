#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the abstract base class from which progress-driven operations can inherit.
 * @remarks
 * 
  * This class is an abstract class that may not be instantiated. It provides a framework that derived classes can use to implement a progress callback. This callback can be used by applications to report progress of actions to the UI. Here, "Actions" refers to operations that may take a significant amount of time, such as downloading or copying files, and during which a visible progress indication would be appropriate.
  * 
  * Applications typically do not implement this interface. Much of the functionality that users interact with during actions is provided by the CProgressDialog class (CLSID_ProgressDialog) that implements <b>IActionProgress</b> and displays progress in a dialog box. If a solution requiring a mechanism other than a dialog box is required, <b>IActionProgress</b> can be used to provide basic progress indicator functionality.
  * 
  * Once implemented, classes should call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iactionprogress-begin">IActionProgress::Begin</a> when an action is started. Periodically, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iactionprogress-updateprogress">IActionProgress::UpdateProgress</a> should be called to update the UI with progress information, and detailed textual information should be conveyed to the UI by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iactionprogress-updatetext">IActionProgress::UpdateText</a>. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iactionprogress-querycancel">IActionProgress::QueryCancel</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iactionprogress-resetcancel">IActionProgress::ResetCancel</a> should be called to handle cancellation requests. Once the operation ends, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iactionprogress-end">IActionProgress::End</a> should be called.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iactionprogress
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IActionProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionProgress
     * @type {Guid}
     */
    static IID => Guid("{49ff1173-eadc-446d-9285-156453a6431c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "UpdateProgress", "UpdateText", "QueryCancel", "ResetCancel", "End"]

    /**
     * 
     * @param {Integer} action 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogress-begin
     */
    Begin(action, flags) {
        result := ComCall(3, this, "int", action, "uint", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCompleted 
     * @param {Integer} ulTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogress-updateprogress
     */
    UpdateProgress(ulCompleted, ulTotal) {
        result := ComCall(4, this, "uint", ulCompleted, "uint", ulTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sptext 
     * @param {PWSTR} pszText 
     * @param {BOOL} fMayCompact 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogress-updatetext
     */
    UpdateText(sptext, pszText, fMayCompact) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(5, this, "int", sptext, "ptr", pszText, "int", fMayCompact, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCancelled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogress-querycancel
     */
    QueryCancel(pfCancelled) {
        result := ComCall(6, this, "ptr", pfCancelled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogress-resetcancel
     */
    ResetCancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iactionprogress-end
     */
    End() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
