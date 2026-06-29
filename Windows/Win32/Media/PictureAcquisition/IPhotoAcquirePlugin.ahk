#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPhotoAcquireSource.ahk" { IPhotoAcquireSource }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPhotoAcquireItem.ahk" { IPhotoAcquireItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\IPhotoAcquireProgressCB.ahk" { IPhotoAcquireProgressCB }

/**
 * Implement the IPhotoAcquirePlugin interface when you want to create a plug-in to run alongside the Windows Vista user interface (UI) for image acquisition. Registry settings are required to enable the plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquireplugin
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoAcquirePlugin extends IUnknown {
    /**
     * The interface identifier for IPhotoAcquirePlugin
     * @type {Guid}
     */
    static IID := Guid("{00f2dceb-ecb8-4f77-8e47-e7a987c83dd0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoAcquirePlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize             : IntPtr
        ProcessItem            : IntPtr
        TransferComplete       : IntPtr
        DisplayConfigureDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoAcquirePlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method provides extended functionality when the plug-in is initialized. The application provides the implementation of the Initialize method.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource Specifies the source from which photos are being acquired.
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB Specifies the callback that will provide additional processing during acquisition.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-initialize
     */
    Initialize(pPhotoAcquireSource, pPhotoAcquireProgressCB) {
        result := ComCall(3, this, "ptr", pPhotoAcquireSource, "ptr", pPhotoAcquireProgressCB, "HRESULT")
        return result
    }

    /**
     * The ProcessItem method provides additional functionality each time an item is processed. The application provides the implementation of the ProcessItem method.
     * @param {Integer} dwAcquireStage Specifies a double word value indicating whether this method is being called before or after processing an item. Must be one of: PAPS_PRESAVE, PAPS_POSTSAVE, or PAPS_CLEANUP.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>PAPS_PRESAVE</td>
     * <td>Indicates that the method is being called before saving the acquired file. During PAPS_PRESAVE, <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireitem-getproperty">pPhotoAcquireItem::GetProperty</a> should be used to retrieve metadata from the original file, while new metadata to be written to the file should be added to <i>pPropertyStore</i>.</td>
     * </tr>
     * <tr>
     * <td>PAPS_POSTSAVE</td>
     * <td>Indicates that the method is being called after saving the acquired file.</td>
     * </tr>
     * <tr>
     * <td>PAPS_CLEANUP</td>
     * <td>Indicates that the user has canceled the acquire operation and any work done by the plug-in should be cleaned up.</td>
     * </tr>
     * </table>
     * @param {IPhotoAcquireItem} pPhotoAcquireItem Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object for the item being processed.
     * @param {IStream} pOriginalItemStream Pointer to an <b>IStream</b> object for the original item. <b>NULL</b> if <i>dwAcquireStage</i> is PAPS_POSTSAVE.
     * @param {PWSTR} pszFinalFilename The file name of the destination of the item. <b>NULL</b> if <i>dwAcquireStage</i> is PAPS_PRESAVE.
     * @param {IPropertyStore} pPropertyStore The item's property store. <b>NULL</b> if <i>dwAcquireStage</i> is PAPS_POSTSAVE.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-processitem
     */
    ProcessItem(dwAcquireStage, pPhotoAcquireItem, pOriginalItemStream, pszFinalFilename, pPropertyStore) {
        pszFinalFilename := pszFinalFilename is String ? StrPtr(pszFinalFilename) : pszFinalFilename

        result := ComCall(4, this, "uint", dwAcquireStage, "ptr", pPhotoAcquireItem, "ptr", pOriginalItemStream, "ptr", pszFinalFilename, "ptr", pPropertyStore, "HRESULT")
        return result
    }

    /**
     * Provides extended functionality when a transfer session is completed. The application provides the implementation of the TransferComplete method.
     * @param {HRESULT} hr Specifies the result of the transfer operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-transfercomplete
     */
    TransferComplete(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * The DisplayConfigureDialog method provides extended functionality when the configuration dialog is displayed. The application provides the implementation of the DisplayConfigureDialog method.
     * @param {HWND} hWndParent Specifies the handle to the configuration dialog window.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-displayconfiguredialog
     */
    DisplayConfigureDialog(hWndParent) {
        result := ComCall(6, this, HWND, hWndParent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPhotoAcquirePlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.ProcessItem := CallbackCreate(GetMethod(implObj, "ProcessItem"), flags, 6)
        this.vtbl.TransferComplete := CallbackCreate(GetMethod(implObj, "TransferComplete"), flags, 2)
        this.vtbl.DisplayConfigureDialog := CallbackCreate(GetMethod(implObj, "DisplayConfigureDialog"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.ProcessItem)
        CallbackFree(this.vtbl.TransferComplete)
        CallbackFree(this.vtbl.DisplayConfigureDialog)
    }
}
