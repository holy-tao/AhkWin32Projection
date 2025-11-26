#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include .\IModalWindow.ahk

/**
 * Exposes methods that initialize, show, and get results from the common file dialog.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileDialog</b> is implemented by the common file open dialog (CLSID_FileOpenDialog) and
 * file save dialog (CLSID_FileSaveDialog).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifiledialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialog extends IModalWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileDialog
     * @type {Guid}
     */
    static IID => Guid("{42f85136-db7e-439c-85f1-e4075d135fc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFileTypes", "SetFileTypeIndex", "GetFileTypeIndex", "Advise", "Unadvise", "SetOptions", "GetOptions", "SetDefaultFolder", "SetFolder", "GetFolder", "GetCurrentSelection", "SetFileName", "GetFileName", "SetTitle", "SetOkButtonLabel", "SetFileNameLabel", "GetResult", "AddPlace", "SetDefaultExtension", "Close", "SetClientGuid", "ClearClientData", "SetFilter"]

    /**
     * Sets the file types that the dialog can open or save.
     * @param {Integer} cFileTypes Type: <b>UINT</b>
     * 
     * The number of elements in the array specified by <i>rgFilterSpec</i>.
     * @param {Pointer<COMDLG_FILTERSPEC>} rgFilterSpec Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-comdlg_filterspec">COMDLG_FILTERSPEC</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-comdlg_filterspec">COMDLG_FILTERSPEC</a> structures, each representing a file type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">SetFileTypes</a> has already been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>FOS_PICKFOLDERS</b> flag was set in the <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions">IFileDialog::SetOptions</a> method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>rgFilterSpec</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes
     */
    SetFileTypes(cFileTypes, rgFilterSpec) {
        result := ComCall(4, this, "uint", cFileTypes, "ptr", rgFilterSpec, "HRESULT")
        return result
    }

    /**
     * Sets the file type that appears as selected in the dialog.
     * @param {Integer} iFileType Type: <b>UINT</b>
     * 
     * The index of the file type in the file type array passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">IFileDialog::SetFileTypes</a> in its <i>cFileTypes</i> parameter. Note that this is a one-based index, not zero-based.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypeindex
     */
    SetFileTypeIndex(iFileType) {
        result := ComCall(5, this, "uint", iFileType, "HRESULT")
        return result
    }

    /**
     * Gets the currently selected file type.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a <b>UINT</b> value that receives the index of the selected file type in the file type array passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">IFileDialog::SetFileTypes</a> in its <i>cFileTypes</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This is a one-based index rather than zero-based.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-getfiletypeindex
     */
    GetFileTypeIndex() {
        result := ComCall(6, this, "uint*", &piFileType := 0, "HRESULT")
        return piFileType
    }

    /**
     * Assigns an event handler that listens for events coming from the dialog.
     * @param {IFileDialogEvents} pfde Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogevents">IFileDialogEvents</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogevents">IFileDialogEvents</a> implementation that will receive events from the dialog.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a <b>DWORD</b> that receives a value identiying this event handler. When the client is finished with the dialog, that client must call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-unadvise">IFileDialog::Unadvise</a> method with this value.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-advise
     */
    Advise(pfde) {
        result := ComCall(7, this, "ptr", pfde, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Removes an event handler that was attached through the IFileDialog::Advise method.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * The <b>DWORD</b> value that represents the event handler. This value is obtained through the <i>pdwCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-advise">IFileDialog::Advise</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Sets flags to control the behavior of the dialog.
     * @param {Integer} fos Type: <b>FILEOPENDIALOGOPTIONS</b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_fileopendialogoptions">FILEOPENDIALOGOPTIONS</a> values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions
     */
    SetOptions(fos) {
        result := ComCall(9, this, "uint", fos, "HRESULT")
        return result
    }

    /**
     * Gets the current flags that are set to control dialog behavior.
     * @returns {Integer} Type: <b>FILEOPENDIALOGOPTIONS*</b>
     * 
     * When this method returns successfully, points to a value made up of one or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_fileopendialogoptions">FILEOPENDIALOGOPTIONS</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-getoptions
     */
    GetOptions() {
        result := ComCall(10, this, "uint*", &pfos := 0, "HRESULT")
        return pfos
    }

    /**
     * Sets the folder used as a default if there is not a recently used folder value available.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultfolder
     */
    SetDefaultFolder(psi) {
        result := ComCall(11, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Sets a folder that is always selected when the dialog is opened, regardless of previous user action.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setfolder
     */
    SetFolder(psi) {
        result := ComCall(12, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Gets either the folder currently selected in the dialog, or, if the dialog is not currently displayed, the folder that is to be selected when the dialog is opened.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the interface that represents the folder.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-getfolder
     */
    GetFolder() {
        result := ComCall(13, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Gets the user's current selection in the dialog.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the interface that represents the item currently selected in the dialog. This item can be a file or folder selected in the view window, or something that the user has entered into the dialog's edit box. The latter case may require a parsing operation (cancelable by the user) that blocks the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(14, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Sets the file name that appears in the File name edit box when that dialog box is opened.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the name of the file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setfilename
     */
    SetFileName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(15, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Retrieves the text currently entered in the dialog's File name edit box.
     * @returns {PWSTR} Type: <b>WCHAR**</b>
     * 
     * The address of a pointer to a buffer that, when this method returns successfully, receives the text.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-getfilename
     */
    GetFileName() {
        result := ComCall(16, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Sets the title of the dialog.
     * @param {PWSTR} pszTitle Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the title text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(17, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * Sets the text of the Open or Save button.
     * @param {PWSTR} pszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the button text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setokbuttonlabel
     */
    SetOkButtonLabel(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(18, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Sets the text of the label next to the file name edit box.
     * @param {PWSTR} pszLabel Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the label text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setfilenamelabel
     */
    SetFileNameLabel(pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Gets the choice that the user made in the dialog.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the user's choice.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-getresult
     */
    GetResult() {
        result := ComCall(20, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Adds a folder to the list of places available for the user to open or save items.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the folder to be made available to the user. This can only be a folder.
     * @param {Integer} fdap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fdap">FDAP</a></b>
     * 
     * Specifies where the folder is placed within the list. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-fdap">FDAP</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-addplace
     */
    AddPlace(psi, fdap) {
        result := ComCall(21, this, "ptr", psi, "int", fdap, "HRESULT")
        return result
    }

    /**
     * Sets the default extension to be added to file names.
     * @param {PWSTR} pszDefaultExtension Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the extension text. This string should not include a leading period. For example, "jpg" is correct, while ".jpg" is not.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultextension
     */
    SetDefaultExtension(pszDefaultExtension) {
        pszDefaultExtension := pszDefaultExtension is String ? StrPtr(pszDefaultExtension) : pszDefaultExtension

        result := ComCall(22, this, "ptr", pszDefaultExtension, "HRESULT")
        return result
    }

    /**
     * Closes the dialog.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * The code that will be returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show">Show</a> to indicate that the dialog was closed before a selection was made.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-close
     */
    Close(hr) {
        result := ComCall(23, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Enables a calling application to associate a GUID with a dialog's persisted state.
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * The GUID to associate with this dialog state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setclientguid
     */
    SetClientGuid(guid) {
        result := ComCall(24, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * Instructs the dialog to clear all persisted state information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-clearclientdata
     */
    ClearClientData() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * SetFilter is no longer available for use as of Windows 7.
     * @param {IShellItemFilter} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a> that is to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifiledialog-setfilter
     */
    SetFilter(pFilter) {
        result := ComCall(26, this, "ptr", pFilter, "HRESULT")
        return result
    }
}
