#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include .\IModalWindow.ahk

/**
 * Exposes methods that initialize, show, and get results from the common file dialog.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileDialog</b> is implemented by the common file open dialog (CLSID_FileOpenDialog) and
 * file save dialog (CLSID_FileSaveDialog).
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifiledialog
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
     * @remarks
     * When using the <b>Open</b> dialog, the file types declared there are used to filter the view. When using the <b>Save</b> dialog, these values determine which file name extension is appended to the file name.
     * 
     * This method must be called before the dialog is shown and can only be called once for each dialog instance. File types cannot be modified once the Common Item dialog box is displayed.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">SetFileTypes</a> has already been called.
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
     * The <b>FOS_PICKFOLDERS</b> flag was set in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions">IFileDialog::SetOptions</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes
     */
    SetFileTypes(cFileTypes, rgFilterSpec) {
        result := ComCall(4, this, "uint", cFileTypes, "ptr", rgFilterSpec, "HRESULT")
        return result
    }

    /**
     * Sets the file type that appears as selected in the dialog.
     * @remarks
     * This method must be called before the dialog is showing.
     * @param {Integer} iFileType Type: <b>UINT</b>
     * 
     * The index of the file type in the file type array passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">IFileDialog::SetFileTypes</a> in its <i>cFileTypes</i> parameter. Note that this is a one-based index, not zero-based.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypeindex
     */
    SetFileTypeIndex(iFileType) {
        result := ComCall(5, this, "uint", iFileType, "HRESULT")
        return result
    }

    /**
     * Gets the currently selected file type.
     * @remarks
     * <b>IFileDialog::GetFileTypeIndex</b> can be called either while the dialog is open or after it has closed.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a <b>UINT</b> value that receives the index of the selected file type in the file type array passed to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">IFileDialog::SetFileTypes</a> in its <i>cFileTypes</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  This is a one-based index rather than zero-based.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getfiletypeindex
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
     * A pointer to a <b>DWORD</b> that receives a value identifying this event handler. When the client is finished with the dialog, that client must call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-unadvise">IFileDialog::Unadvise</a> method with this value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-advise
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Sets flags to control the behavior of the dialog.
     * @remarks
     * Generally, this method should take the value that was retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getoptions">IFileDialog::GetOptions</a> and modify it to include or exclude options by setting the appropriate flags.
     * @param {Integer} fos Type: <b>FILEOPENDIALOGOPTIONS</b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_fileopendialogoptions">FILEOPENDIALOGOPTIONS</a> values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getoptions
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultfolder
     */
    SetDefaultFolder(psi) {
        result := ComCall(11, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Sets a folder that is always selected when the dialog is opened, regardless of previous user action.
     * @remarks
     * This folder overrides any "most recently used" folder. If this method is called while the dialog is displayed, it causes the dialog to navigate to the specified folder.
     * 
     * In general, we do not recommended the use of this method. If you call <b>SetFolder</b> before you display the dialog box, the most recent location that the user saved to or opened from is not shown. Unless there is a very specific reason for this behavior, it is not a good or expected user experience and should therefore be avoided. In almost all instances, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultfolder">IFileDialog::SetDefaultFolder</a> is the better method.
     * 
     * As of Windows 7, if the path of the folder specified through <i>psi</i> is the default path of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776911(v=vs.85)">known folder</a>, the known folder's current path is used in the dialog. That path might not be the same as the path specified in <i>psi</i>; for instance, if the known folder has been redirected. If the known folder is a library (virtual folders Documents, Music, Pictures, and Videos), the library's path is used in the dialog. If the specified library is hidden (as they are by default as of Windows 8.1), the library's default save location is used in the dialog, such as the Microsoft OneDrive Documents folder for the Documents library. Because of these mappings, the folder location used in the dialog might not be exactly as you specified when you called this method.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the interface that represents the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfolder
     */
    SetFolder(psi) {
        result := ComCall(12, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Gets either the folder currently selected in the dialog, or, if the dialog is not currently displayed, the folder that is to be selected when the dialog is opened.
     * @remarks
     * The calling application is responsible for releasing the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> when it is no longer needed.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the interface that represents the folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getfolder
     */
    GetFolder() {
        result := ComCall(13, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Gets the user's current selection in the dialog.
     * @remarks
     * The calling application is responsible for releasing the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> when it is no longer needed.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the interface that represents the item currently selected in the dialog. This item can be a file or folder selected in the view window, or something that the user has entered into the dialog's edit box. The latter case may require a parsing operation (cancelable by the user) that blocks the current thread.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getcurrentselection
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilename
     */
    SetFileName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(15, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Retrieves the text currently entered in the dialog's File name edit box.
     * @remarks
     * The text in the <b>File name</b> edit box does not necessarily reflect the item the user chose.  To get the item the user chose, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getresult">IFileDialog::GetResult</a>.
     * 
     * The calling application is responsible for releasing the retrieved buffer by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {PWSTR} Type: <b>WCHAR**</b>
     * 
     * The address of a pointer to a buffer that, when this method returns successfully, receives the text.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getfilename
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-settitle
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setokbuttonlabel
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilenamelabel
     */
    SetFileNameLabel(pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * Gets the choice that the user made in the dialog.
     * @remarks
     * <b>IFileDialog::GetResult</b> can be called after the dialog has closed or during the handling of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-onfileok">OnFileOk</a> event. Calling this method at any other time will fail. If multiple items were chosen, this method will fail. In the case of multiple items, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileopendialog-getresults">GetResults</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show">Show</a> must return a success code for a result to be available to <b>IFileDialog::GetResult</b>.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the user's choice.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getresult
     */
    GetResult() {
        result := ComCall(20, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * Adds a folder to the list of places available for the user to open or save items.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsettemporarypropertyforitem">SHSetTemporaryPropertyForItem</a> can be used to set a temporary <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-itemnamedisplay">PKEY_ItemNameDisplay</a> property on the item represented by the <i>psi</i> parameter. The value for this property will be used in place of the item's UI name.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the folder to be made available to the user. This can only be a folder.
     * @param {Integer} _fdap 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-addplace
     */
    AddPlace(psi, _fdap) {
        result := ComCall(21, this, "ptr", psi, "int", _fdap, "HRESULT")
        return result
    }

    /**
     * Sets the default extension to be added to file names.
     * @remarks
     * If this method is called before showing the dialog, the dialog will update the default extension automatically when the user chooses a new file type (see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">SetFileTypes</a>).
     * @param {PWSTR} pszDefaultExtension Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the extension text. This string should not include a leading period. For example, "jpg" is correct, while ".jpg" is not.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultextension
     */
    SetDefaultExtension(pszDefaultExtension) {
        pszDefaultExtension := pszDefaultExtension is String ? StrPtr(pszDefaultExtension) : pszDefaultExtension

        result := ComCall(22, this, "ptr", pszDefaultExtension, "HRESULT")
        return result
    }

    /**
     * Closes the dialog.
     * @remarks
     * An application can call this method from a callback method or function while the dialog is open. The dialog will close and the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show">Show</a> method will return with the <b>HRESULT</b> specified in <i>hr</i>.
     * 
     * If this method is called, there is no result available for the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getresult">IFileDialog::GetResult</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifileopendialog-getresults">GetResults</a> methods, and they will fail if called.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * The code that will be returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show">Show</a> to indicate that the dialog was closed before a selection was made.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-close
     */
    Close(hr) {
        result := ComCall(23, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Enables a calling application to associate a GUID with a dialog's persisted state.
     * @remarks
     * A dialog's state can include factors such as the last visited folder and the position and size of the dialog.
     * 
     * Typically, this state is persisted based on the name of the executable file. By specifying a GUID, an application can have different persisted states for different versions of the dialog within the same application (for example, an import dialog and an open dialog).
     *             
     * 
     * <b>IFileDialog::SetClientGuid</b> should be called immediately after creation of the dialog object.
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * The GUID to associate with this dialog state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setclientguid
     */
    SetClientGuid(guid) {
        result := ComCall(24, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * Instructs the dialog to clear all persisted state information.
     * @remarks
     * Persisted information can be associated with an application or a GUID. If a GUID was set by using <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setclientguid">IFileDialog::SetClientGuid</a>, that GUID is used to clear persisted information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-clearclientdata
     */
    ClearClientData() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * SetFilter is no longer available for use as of Windows 7.
     * @remarks
     * This method can be used if the application needs to perform special filtering to remove some items from the dialog box's view.  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitemfilter-includeitem">IncludeItem</a> will be called for each item that would normally be included in the view. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitemfilter-getenumflagsforitem">GetEnumFlagsForItem</a> is not used.
     * To filter by file type, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes">IFileDialog::SetFileTypes</a> should be used, because in folders with a large number of items it may offer better performance than applying an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a>.
     * @param {IShellItemFilter} pFilter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a> that is to be set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilter
     */
    SetFilter(pFilter) {
        result := ComCall(26, this, "ptr", pFilter, "HRESULT")
        return result
    }
}
