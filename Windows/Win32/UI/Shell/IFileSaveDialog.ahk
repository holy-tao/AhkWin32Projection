#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include PropertiesSystem\IPropertyStore.ahk
#Include .\IFileDialog.ahk

/**
 * Extends the IFileDialog interface by adding methods specific to the save dialog, which include those that provide support for the collection of metadata to be persisted with the file.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * <b>IFileSaveDialog</b> is implemented by the common file save dialog (CLSID_FileSaveDialog).
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ifilesavedialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSaveDialog extends IFileDialog{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSaveDialog
     * @type {Guid}
     */
    static IID => Guid("{84bccd23-5fde-4cdb-aea4-af64b83d78ab}")

    /**
     * The class identifier for FileSaveDialog
     * @type {Guid}
     */
    static CLSID => Guid("{c0b4e2f3-ba21-4773-8dba-335ec946eb8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSaveAsItem", "SetProperties", "SetCollectedProperties", "GetProperties", "ApplyProperties"]

    /**
     * Sets an item to be used as the initial entry in a Save As dialog.
     * @remarks
     * The name of the item is displayed in the file name edit box, and the containing folder is opened in the view. This would generally be used when the application is saving an item that already exists. For new items, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilename">IFileDialog::SetFileName</a>.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setsaveasitem
     */
    SetSaveAsItem(psi) {
        result := ComCall(27, this, "ptr", psi, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides a property store that defines the default values to be used for the item being saved.
     * @remarks
     * This method can be called at any time before the dialog is opened or while the dialog is showing. If an item has inherent properties, this method should be called with those properties before showing the dialog.
     * 
     * When using <b>Save As</b>, the application should provide the properties of the item being saved to the <b>Save</b> dialog. Those properties should be retreived from the original item by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">GetPropertyStore</a> with the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GPS_HANDLERPROPERTIESONLY</a> flag.
     * 
     * To retrieve the properties of the saved item (which may have been modified by the user) after the dialog closes, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-getproperties">IFileSaveDialog::GetProperties</a>.
     * 
     * To turn on property collection and indicate which properties should be displayed in the <b>Save</b> dialog, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setcollectedproperties">IFileSaveDialog::SetCollectedProperties</a>.
     * @param {IPropertyStore} pStore Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to the interface that represents the property store that contains the associated metadata.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setproperties
     */
    SetProperties(pStore) {
        result := ComCall(28, this, "ptr", pStore, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies which properties will be collected in the save dialog.
     * @remarks
     * The calling application can use the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a> function to construct an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> from a string such as "prop:Comments;Subject;".
     * 
     * For more information about property schemas, see 
     *             <a href="https://docs.microsoft.com/windows/desktop/properties/building-property-handlers-property-schemas">Property Schemas</a>.
     * 
     * <b>IFileSaveDialog::SetCollectedProperties</b> can be called at any time before the dialog is displayed or while it is visible. If different properties are to be collected depending on the chosen filetype, then <b>IFileSaveDialog::SetCollectedProperties</b> can be called in response to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialogevents-ontypechange">OnTypeChange</a>.
     * 
     * <div class="alert"><b>Note</b>  By default, no properties are collected in the save dialog.</div>
     * <div> </div>
     * @param {IPropertyDescriptionList} pList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>*</b>
     * 
     * Pointer to the interface that represents the list of properties to collect. This parameter can be <b>NULL</b>.
     * @param {BOOL} fAppendDefault Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to show default properties for the currently selected filetype in addition to the properties specified by <i>pList</i>. <b>FALSE</b> to show only properties specified by <i>pList</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setcollectedproperties
     */
    SetCollectedProperties(pList, fAppendDefault) {
        result := ComCall(29, this, "ptr", pList, "int", fAppendDefault, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the set of property values for a saved item or an item in the process of being saved.
     * @remarks
     * This method can be called while the dialog is showing to retrieve the current set of values in the metadata collection pane. It can also be called after the dialog has closed, to retrieve the final set of values.
     * 
     * The call to this method will fail unless property collection has been turned on with a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setcollectedproperties">IFileSaveDialog::SetCollectedProperties</a>.
     * @returns {IPropertyStore} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> that receives the property values.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifilesavedialog-getproperties
     */
    GetProperties() {
        result := ComCall(30, this, "ptr*", &ppStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStore(ppStore)
    }

    /**
     * Applies a set of properties to an item using the Shell's copy engine.
     * @remarks
     * This method should be used when the application has turned on property collection (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setcollectedproperties">IFileSaveDialog::SetCollectedProperties</a>), but does not persist the properties themselves into the saved file.
     * 
     * <div class="alert"><b>Note</b>  The file represented by the item specified in <i>psi</i> must exist in physical storage before making the call to <b>IFileSaveDialog::ApplyProperties</b>, so it must have been previously saved at some point.</div>
     * <div> </div>
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that represents the file being saved. This is usually the item retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getresult">GetResult</a>.
     * @param {IPropertyStore} pStore Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> that represents the property values to be applied to the file. This can be the property store returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-getproperties">IFileSaveDialog::GetProperties</a>.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * The handle of the application window.
     * @param {IFileOperationProgressSink} pSink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink">IFileOperationProgressSink</a>*</b>
     * 
     * Pointer to an optional <b>IFileOperationProgressSink</b> that the calling application can use if they want to be notified of the progress of the property stamping. This value may be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ifilesavedialog-applyproperties
     */
    ApplyProperties(psi, pStore, hwnd_, pSink) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(31, this, "ptr", psi, "ptr", pStore, "ptr", hwnd_, "ptr", pSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
