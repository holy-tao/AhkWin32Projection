#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow notification of events within a common file dialog.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileDialogEvents</b> is implemented by an application that is a client of the common file dialog browser. Methods that are not implemented should return E_NOTIMPL. An example of <b>IFileDialogEvents</b> can be found in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940349(v=vs.85)">Common File Dialog</a> SDK sample.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifiledialogevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialogEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileDialogEvents
     * @type {Guid}
     */
    static IID => Guid("{973510db-7d7f-452b-8975-74a85828d354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnFileOk", "OnFolderChanging", "OnFolderChange", "OnSelectionChange", "OnShareViolation", "OnTypeChange", "OnOverwrite"]

    /**
     * Called just before the dialog is about to return with a result.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Implementations should return <b>S_OK</b> to accept the current result in the dialog or <b>S_FALSE</b> to refuse it. In the case of <b>S_FALSE</b>, the dialog should remain open.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfileok
     */
    OnFileOk(pfd) {
        result := ComCall(3, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * Called before IFileDialogEvents::OnFolderChange. This allows the implementer to stop navigation to a particular location.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @param {IShellItem} psiFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an interface that represents the folder to which the dialog is about to navigate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. A return value of S_OK or E_NOTIMPL indicates that the folder change can proceed.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfolderchanging
     */
    OnFolderChanging(pfd, psiFolder) {
        result := ComCall(4, this, "ptr", pfd, "ptr", psiFolder, "HRESULT")
        return result
    }

    /**
     * Called when the user navigates to a new folder.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfolderchange
     */
    OnFolderChange(pfd) {
        result := ComCall(5, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * Called when the user changes the selection in the dialog's view.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-onselectionchange
     */
    OnSelectionChange(pfd) {
        result := ComCall(6, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * Enables an application to respond to sharing violations that arise from Open or Save operations.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the item that has the sharing violation.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response">FDE_SHAREVIOLATION_RESPONSE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response">FDE_SHAREVIOLATION_RESPONSE</a> enumeration indicating the response to the sharing violation.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-onshareviolation
     */
    OnShareViolation(pfd, psi) {
        result := ComCall(7, this, "ptr", pfd, "ptr", psi, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }

    /**
     * Called when the dialog is opened to notify the application of the initial chosen filetype.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-ontypechange
     */
    OnTypeChange(pfd) {
        result := ComCall(8, this, "ptr", pfd, "HRESULT")
        return result
    }

    /**
     * Called from the save dialog when the user chooses to overwrite a file.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the item that will be overwritten.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response">FDE_SHAREVIOLATION_RESPONSE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_overwrite_response">FDE_OVERWRITE_RESPONSE</a> enumeration indicating the response to the potential overwrite action.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialogevents-onoverwrite
     */
    OnOverwrite(pfd, psi) {
        result := ComCall(9, this, "ptr", pfd, "ptr", psi, "int*", &pResponse := 0, "HRESULT")
        return pResponse
    }
}
