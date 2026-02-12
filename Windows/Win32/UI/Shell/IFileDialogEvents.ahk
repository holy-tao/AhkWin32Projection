#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow notification of events within a common file dialog.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileDialogEvents</b> is implemented by an application that is a client of the common file dialog browser. Methods that are not implemented should return E_NOTIMPL. An example of <b>IFileDialogEvents</b> can be found in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940349(v=vs.85)">Common File Dialog</a> SDK sample.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ifiledialogevents
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
     * @remarks
     * When this method is called, the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getresult">IFileDialog::GetResult</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileopendialog-getresults">GetResults</a> methods can be called.
     * 
     * The application can use this callback method to perform additional validation before the dialog closes, or to prevent the dialog from closing. If the application prevents the dialog from closing, it should display a UI to indicate a cause. To obtain a parent <b>HWND</b> for the UI, obtain the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a> interface through <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IFileDialog::QueryInterface</a> and call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-getwindow">IOleWindow::GetWindow</a>.
     * 
     * An application can also use this method to perform all of its work surrounding the opening or saving of files.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Implementations should return <b>S_OK</b> to accept the current result in the dialog or <b>S_FALSE</b> to refuse it. In the case of <b>S_FALSE</b>, the dialog should remain open.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfileok
     */
    OnFileOk(pfd) {
        result := ComCall(3, this, "ptr", pfd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called before IFileDialogEvents::OnFolderChange. This allows the implementer to stop navigation to a particular location.
     * @remarks
     * The calling application can call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfolder">IFileDialog::SetFolder</a> during this callback to redirect navigation to an alternate folder. The actual navigation does not occur until <b>IFileDialogEvents::OnFolderChanging</b> has returned.
     * 
     * If the calling application simply prevents navigation to a particular folder, UI should be displayed with an explanation of the restriction. To obtain a parent <b>HWND</b> for the UI, obtain the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a> interface through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> and call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-getwindow">IOleWindow::GetWindow</a>.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @param {IShellItem} psiFolder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an interface that represents the folder to which the dialog is about to navigate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. A return value of S_OK or E_NOTIMPL indicates that the folder change can proceed.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfolderchanging
     */
    OnFolderChanging(pfd, psiFolder) {
        result := ComCall(4, this, "ptr", pfd, "ptr", psiFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the user navigates to a new folder.
     * @remarks
     * <b>IFileDialogEvents::OnFolderChange</b> is called when the dialog is opened.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfolderchange
     */
    OnFolderChange(pfd) {
        result := ComCall(5, this, "ptr", pfd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the user changes the selection in the dialog's view.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onselectionchange
     */
    OnSelectionChange(pfd) {
        result := ComCall(6, this, "ptr", pfd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables an application to respond to sharing violations that arise from Open or Save operations.
     * @remarks
     * The <b>FOS_SHAREAWARE</b> flag must be set through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions">IFileDialog::SetOptions</a> before this method is called.
     * 
     * A sharing violation could possibly arise when the application attempts to open a file, because the file could have been locked between the time that the dialog tested it and the application opened it.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the item that has the sharing violation.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response">FDE_SHAREVIOLATION_RESPONSE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response">FDE_SHAREVIOLATION_RESPONSE</a> enumeration indicating the response to the sharing violation.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onshareviolation
     */
    OnShareViolation(pfd, psi) {
        result := ComCall(7, this, "ptr", pfd, "ptr", psi, "int*", &pResponse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResponse
    }

    /**
     * Called when the dialog is opened to notify the application of the initial chosen filetype.
     * @remarks
     * This method is called when the dialog is opened to notify the application of the initially chosen filetype. If the application has code in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogevents">IFileDialogEvents</a> that responds to type changes, it can respond to the type. For example, it could hide certain controls. The application controls the initial file type and could do its own checks, so this method is provided as a convenience.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-ontypechange
     */
    OnTypeChange(pfd) {
        result := ComCall(8, this, "ptr", pfd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called from the save dialog when the user chooses to overwrite a file.
     * @remarks
     * The <b>FOS_OVERWRITEPROMPT</b> flag must be set through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions">IFileDialog::SetOptions</a> before this method is called.
     * @param {IFileDialog} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a>*</b>
     * 
     * A pointer to the interface that represents the dialog.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the item that will be overwritten.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_overwrite_response">FDE_OVERWRITE_RESPONSE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fde_overwrite_response">FDE_OVERWRITE_RESPONSE</a> enumeration indicating the response to the potential overwrite action.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onoverwrite
     */
    OnOverwrite(pfd, psi) {
        result := ComCall(9, this, "ptr", pfd, "ptr", psi, "int*", &pResponse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResponse
    }
}
