#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItemArray.ahk
#Include .\IFileDialog.ahk

/**
 * Extends the IFileDialog interface by adding methods specific to the open dialog.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileOpenDialog</b> is implemented by the common file open dialog (CLSID_FileOpenDialog).
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ifileopendialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileOpenDialog extends IFileDialog{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenDialog
     * @type {Guid}
     */
    static IID => Guid("{d57c7288-d4ad-4768-be02-9d969532d960}")

    /**
     * The class identifier for FileOpenDialog
     * @type {Guid}
     */
    static CLSID => Guid("{dc1c5a9c-e88a-4dde-a5a1-60f82a20aef7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResults", "GetSelectedItems"]

    /**
     * Gets the user's choices in a dialog that allows multiple selection.
     * @remarks
     * This method can be used whether the selection consists of a single item or multiple items.
     * 
     * <b>IFileOpenDialog::GetResults</b> can be called after the dialog has closed or during the handling of an IFileDialogEvents::OnFileOk event. Calling this method at any other time will fail.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show">Show</a> must return a success code for a result to be available to <b>IFileOpenDialog::GetResults</b>.
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * The address of a pointer to an <b>IShellItemArray</b> through which the items selected in the dialog can be accessed.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifileopendialog-getresults
     */
    GetResults() {
        result := ComCall(27, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IShellItemArray(ppenum)
    }

    /**
     * Gets the currently selected items in the dialog. These items may be items selected in the view, or text selected in the file name edit box.
     * @remarks
     * This method can be used for single item or multiple item selections. If the user has entered new text in the file name field, this can be a time-consuming operation. When the application calls this method, the application parses the text in the <c>filename</c> field. For example, if this is a network share, the operation could take some time. However, this operation will not block the UI, since the user should able to stop the operation, which will result in <b>IFileOpenDialog::GetSelectedItems</b> returning a failure code).
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a> through which the selected items can be accessed.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifileopendialog-getselecteditems
     */
    GetSelectedItems() {
        result := ComCall(28, this, "ptr*", &ppsai := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IShellItemArray(ppsai)
    }
}
