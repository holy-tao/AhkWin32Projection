#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPhotoAcquireSource.ahk" { IPhotoAcquireSource }
#Import ".\ERROR_ADVISE_RESULT.ahk" { ERROR_ADVISE_RESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPhotoAcquireItem.ahk" { IPhotoAcquireItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ERROR_ADVISE_MESSAGE_TYPE.ahk" { ERROR_ADVISE_MESSAGE_TYPE }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * The IPhotoAcquireProgressCB interface may be implemented if you wish to do extra processing at various stages in the acquisition process.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquireprogresscb
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
export default struct IPhotoAcquireProgressCB extends IUnknown {
    /**
     * The interface identifier for IPhotoAcquireProgressCB
     * @type {Guid}
     */
    static IID := Guid("{00f2ce1e-935e-4248-892c-130f32c45cb4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPhotoAcquireProgressCB interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancelled             : IntPtr
        StartEnumeration      : IntPtr
        FoundItem             : IntPtr
        EndEnumeration        : IntPtr
        StartTransfer         : IntPtr
        StartItemTransfer     : IntPtr
        DirectoryCreated      : IntPtr
        UpdateTransferPercent : IntPtr
        EndItemTransfer       : IntPtr
        EndTransfer           : IntPtr
        StartDelete           : IntPtr
        StartItemDelete       : IntPtr
        UpdateDeletePercent   : IntPtr
        EndItemDelete         : IntPtr
        EndDelete             : IntPtr
        EndSession            : IntPtr
        GetDeleteAfterAcquire : IntPtr
        ErrorAdvise           : IntPtr
        GetUserInput          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPhotoAcquireProgressCB.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Cancelled method provides extended functionality when a cancellation occurs during an acquisition session. The application provides the implementation of the Cancelled method.
     * @returns {BOOL} Pointer to a flag that, when set to <b>TRUE</b>, indicates that the operation was canceled.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-cancelled
     */
    Cancelled() {
        result := ComCall(3, this, BOOL.Ptr, &pfCancelled := 0, "HRESULT")
        return pfCancelled
    }

    /**
     * The StartEnumeration method provides extended functionality when the enumeration of items to acquire begins.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquiresource">IPhotoAcquireSource</a> object that items are being enumerated from.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startenumeration
     */
    StartEnumeration(pPhotoAcquireSource) {
        result := ComCall(4, this, "ptr", pPhotoAcquireSource, "HRESULT")
        return result
    }

    /**
     * The FoundItem method provides extended functionality each time an item is found during enumeration of items from the device.
     * @remarks
     * Return S_FALSE to exclude the item from the results of the enumeration. This would allow the caller to exclude videos or camera raw files, for instance.
     * @param {IPhotoAcquireItem} pPhotoAcquireItem Pointer to the found <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Exclude this item from the list of files to acquire.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-founditem
     */
    FoundItem(pPhotoAcquireItem) {
        result := ComCall(5, this, "ptr", pPhotoAcquireItem, "HRESULT")
        return result
    }

    /**
     * The EndEnumeration method provides extended functionality when enumeration of files from the image source is complete. The application provides the implementation of the EndEnumeration method.
     * @param {HRESULT} hr Specifies the result of the enumeration operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endenumeration
     */
    EndEnumeration(hr) {
        result := ComCall(6, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * The StartTransfer method provides additional processing when transfer of items from the device begins. The application provides the implementation of the StartTransfer method.
     * @remarks
     * Returning an error HRESULT other than E_NOTIMPL will cause acquisition to be aborted.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource Pointer to the IPhotoAcquireSource from which items are being retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any Failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-starttransfer
     */
    StartTransfer(pPhotoAcquireSource) {
        result := ComCall(7, this, "ptr", pPhotoAcquireSource, "HRESULT")
        return result
    }

    /**
     * The StartItemTransfer method provides extended functionality each time the transfer of an item begins. The application provides the implementation of the StartItemTransfer method.
     * @param {Integer} nItemIndex Integer value containing the item index in the list of items to transfer.
     * @param {IPhotoAcquireItem} pPhotoAcquireItem Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object that is to be transferred.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startitemtransfer
     */
    StartItemTransfer(nItemIndex, pPhotoAcquireItem) {
        result := ComCall(8, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "HRESULT")
        return result
    }

    /**
     * The DirectoryCreated method provides extended functionality when a destination directory is created during the acquisition process. The application provides the implementation of the DirectoryCreated method.
     * @param {PWSTR} pszDirectory Pointer to a null-terminated string containing the directory.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-directorycreated
     */
    DirectoryCreated(pszDirectory) {
        pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

        result := ComCall(9, this, "ptr", pszDirectory, "HRESULT")
        return result
    }

    /**
     * The UpdateTransferPercent method provides extended functionality when the percentage of items transferred changes. The application provides the implementation of the UpdateTransferPercent method.
     * @param {BOOL} fOverall Flag that, when set to <b>TRUE</b>, indicates that the value contained in <i>nPercent</i> is a percentage of the overall transfer progress, rather than a percentage of an individual item's progress.
     * @param {Integer} nPercent Integer value containing the percentage of items transferred.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-updatetransferpercent
     */
    UpdateTransferPercent(fOverall, nPercent) {
        result := ComCall(10, this, BOOL, fOverall, "uint", nPercent, "HRESULT")
        return result
    }

    /**
     * The EndItemTransfer method provides extended functionality each time a file is transferred from the image source. The application provides the implementation of the EndItemTransfer method.
     * @param {Integer} nItemIndex Integer value containing the item index.
     * @param {IPhotoAcquireItem} pPhotoAcquireItem Pointer to a photo acquire item object.
     * @param {HRESULT} hr Specifies the result of the transfer operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-enditemtransfer
     */
    EndItemTransfer(nItemIndex, pPhotoAcquireItem, hr) {
        result := ComCall(11, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int", hr, "HRESULT")
        return result
    }

    /**
     * The EndTransfer method provides extended functionality when the transfer of all files is complete. The application provides the implementation of the EndTransfer method.
     * @param {HRESULT} hr Specifies the result of the transfer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endtransfer
     */
    EndTransfer(hr) {
        result := ComCall(12, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * The StartDelete method provides extended functionality when deletion of items from the device begins.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquiresource">IPhotoAcquireSource</a> that items are being deleted from.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startdelete
     */
    StartDelete(pPhotoAcquireSource) {
        result := ComCall(13, this, "ptr", pPhotoAcquireSource, "HRESULT")
        return result
    }

    /**
     * The StartItemDelete method provides extended functionality each time the deletion of an individual item from the device begins. The application provides the implementation of the StartItemDelete method.
     * @param {Integer} nItemIndex Integer value containing the item index in the list of items to delete.
     * @param {IPhotoAcquireItem} pPhotoAcquireItem Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object that is being deleted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-startitemdelete
     */
    StartItemDelete(nItemIndex, pPhotoAcquireItem) {
        result := ComCall(14, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "HRESULT")
        return result
    }

    /**
     * The UpdateDeletePercent method provides extended functionality when the percentage of items deleted changes. The application provides the implementation of the UpdateDeletePercent method.
     * @param {Integer} nPercent Integer value containing the percentage of items deleted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-updatedeletepercent
     */
    UpdateDeletePercent(nPercent) {
        result := ComCall(15, this, "uint", nPercent, "HRESULT")
        return result
    }

    /**
     * The EndItemDelete method provides extended functionality each time a file is deleted from the image source. The application provides the implementation of the EndItemDelete method.
     * @param {Integer} nItemIndex Integer value containing the item index.
     * @param {IPhotoAcquireItem} pPhotoAcquireItem Pointer to the deleted <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireitem">IPhotoAcquireItem</a> object.
     * @param {HRESULT} hr Specifies the result of the delete operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * This method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-enditemdelete
     */
    EndItemDelete(nItemIndex, pPhotoAcquireItem, hr) {
        result := ComCall(16, this, "uint", nItemIndex, "ptr", pPhotoAcquireItem, "int", hr, "HRESULT")
        return result
    }

    /**
     * The EndDelete method provides extended functionality when deletion of files from the image source is complete. The application provides the implementation of the EndDelete method.
     * @param {HRESULT} hr Specifies the result of the delete operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-enddelete
     */
    EndDelete(hr) {
        result := ComCall(17, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * The EndSession method provides extended functionality when an acquisition session is completed. The application provides the implementation of the EndSession method.
     * @param {HRESULT} hr Specifies the result of the acquisition.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Your implementation is not limited to the following return values. Any failing HRESULT other than E_NOTIMPL is fatal and will cause the transfer to abort.
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
     * The method is not yet implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-endsession
     */
    EndSession(hr) {
        result := ComCall(18, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * The GetDeleteAfterAcquire method returns a value indicating whether photos should be deleted after acquisition.
     * @returns {BOOL} Pointer to a flag that, when set to <b>TRUE</b>, indicates that photos should be deleted after acquisition.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-getdeleteafteracquire
     */
    GetDeleteAfterAcquire() {
        result := ComCall(19, this, BOOL.Ptr, &pfDeleteAfterAcquire := 0, "HRESULT")
        return pfDeleteAfterAcquire
    }

    /**
     * The ErrorAdvise method provides custom error handling for errors that occur during acquisition. The application provides the implementation of the ErrorAdvise method.
     * @remarks
     * Normally, a message is displayed when an error occurs during image acquisition. If suppression of this message is desired, implement <c>ErrorAdvise</c>.
     * @param {HRESULT} hr Specifies the error that occurred.
     * @param {PWSTR} pszErrorMessage Pointer to a null-terminated string containing the error message.
     * @param {ERROR_ADVISE_MESSAGE_TYPE} nMessageType Integer value containing the message type. May be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL
     *                 </b></td>
     * <td>Specifies that the error that occurred requires a Skip, Retry, or Cancel response. The <i>pnErrorAdviseResult</i> parameter must be set to one of the following: <b>PHOTOACQUIRE_RESULT_SKIP</b>, <b>PHOTOACQUIRE_RESULT_SKIP_ALL</b>, <b>PHOTOACQUIRE_RESULT_RETRY</b>, or <b>PHOTOACQUIRE_RESULT_ABORT</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_ERROR_RETRYCANCEL</b></td>
     * <td>Specifies that the error that occurred requires a Retry or Cancel response. The <i>pnErrorAdviseResult</i> parameter must be set to one of the following: <b>PHOTOACQUIRE_RESULT_RETRY</b> or <b>PHOTOACQUIRE_RESULT_ABORT</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_ERROR_YESNO</b></td>
     * <td>Specifies that the error that occurred requires a Yes or No response. The <i>pnErrorAdviseResult</i> parameter must be set to one of the following: <b>PHOTOACQUIRE_RESULT_YES</b> or <b>PHOTOACQUIRE_RESULT_NO</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_ERROR_OK</b></td>
     * <td>Specifies that the error that occurred requires an OK response. The <i>pnErrorAdviseResult</i> parameter must be set to <b>PHOTOACQUIRE_RESULT_OK</b>.</td>
     * </tr>
     * </table>
     * @returns {ERROR_ADVISE_RESULT} Pointer to an integer value containing the error advise result. The result should be one of the acceptable types indicated by the <i>nMessageType</i> parameter, and must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_YES</b></td>
     * <td>Specifies a Yes response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_YESNO</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_NO</b></td>
     * <td>Specifies a No response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_YESNO</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_OK</b></td>
     * <td>Specifies an OK response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_OK</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_SKIP</b></td>
     * <td>Specifies a Skip response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_SKIP_ALL</b></td>
     * <td>Specifies a Skip All response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_RETRY</b></td>
     * <td>Specifies a Retry response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL</b> or <b>PHOTOACQUIRE_ERROR_RETRYCANCEL</b>.</td>
     * </tr>
     * <tr>
     * <td><b>PHOTOACQUIRE_RESULT_ABORT</b></td>
     * <td>Specifies a Cancel response. Valid if <i>nMessageType</i> is <b>PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL</b> or <b>PHOTOACQUIRE_ERROR_RETRYCANCEL</b>.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-erroradvise
     */
    ErrorAdvise(hr, pszErrorMessage, nMessageType) {
        pszErrorMessage := pszErrorMessage is String ? StrPtr(pszErrorMessage) : pszErrorMessage

        result := ComCall(20, this, "int", hr, "ptr", pszErrorMessage, ERROR_ADVISE_MESSAGE_TYPE, nMessageType, "int*", &pnErrorAdviseResult := 0, "HRESULT")
        return pnErrorAdviseResult
    }

    /**
     * The GetUserInput method overrides the default functionality that displays a message prompting the user for string input during acquisition. The application provides the implementation of the GetUserInput method.
     * @remarks
     * If this method is implemented, the implementation should copy the value of the <i>pPropVarDefault</i> argument to the <i>pPropVarResult</i> parameter.
     * 
     * If this method returns an HRESULT other than E_NOTIMPL, the default dialog box that prompts the user will not be displayed.
     * 
     * If the progress dialog box is suppressed in <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-acquire">IPhotoAcquire::Acquire</a>, this method must be implemented in order to assign a default value to the <i>pPropVarResult</i> parameter. Normally a value is supplied to <i>pPropVarResult</i> in the course of prompting the user with the default dialog, but when the dialog is suppressed, the application must copy the value of the <i>pPropVarDefault</i> argument to the <i>pPropVarResult</i> parameter.
     * @param {Pointer<Guid>} riidType Specifies the interface ID of the prompt type. This may only be IID_IUserInputString.
     * @param {IUnknown} pUnknown Pointer to an object of the prompt class. Currently, this must be an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iuserinputstring">IUserInputString</a> object.
     * @param {Pointer<PROPVARIANT>} pPropVarDefault Pointer to a property variant object representing the default value of the input being requested.
     * @returns {PROPVARIANT} Pointer to a property variant object representing the descriptive input to be obtained. Must be freed by the caller using PropVariantClear.
     * 
     * If the application's implementation of <c>GetUserInput</c> returns a value other than E_NOTIMPL, the value of <i>pPropVarDefault</i> must be copied to the <i>pPropVarResult</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-getuserinput
     */
    GetUserInput(riidType, pUnknown, pPropVarDefault) {
        pPropVarResult := PROPVARIANT()
        result := ComCall(21, this, Guid.Ptr, riidType, "ptr", pUnknown, PROPVARIANT.Ptr, pPropVarResult, PROPVARIANT.Ptr, pPropVarDefault, "HRESULT")
        return pPropVarResult
    }

    Query(iid) {
        if (IPhotoAcquireProgressCB.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancelled := CallbackCreate(GetMethod(implObj, "Cancelled"), flags, 2)
        this.vtbl.StartEnumeration := CallbackCreate(GetMethod(implObj, "StartEnumeration"), flags, 2)
        this.vtbl.FoundItem := CallbackCreate(GetMethod(implObj, "FoundItem"), flags, 2)
        this.vtbl.EndEnumeration := CallbackCreate(GetMethod(implObj, "EndEnumeration"), flags, 2)
        this.vtbl.StartTransfer := CallbackCreate(GetMethod(implObj, "StartTransfer"), flags, 2)
        this.vtbl.StartItemTransfer := CallbackCreate(GetMethod(implObj, "StartItemTransfer"), flags, 3)
        this.vtbl.DirectoryCreated := CallbackCreate(GetMethod(implObj, "DirectoryCreated"), flags, 2)
        this.vtbl.UpdateTransferPercent := CallbackCreate(GetMethod(implObj, "UpdateTransferPercent"), flags, 3)
        this.vtbl.EndItemTransfer := CallbackCreate(GetMethod(implObj, "EndItemTransfer"), flags, 4)
        this.vtbl.EndTransfer := CallbackCreate(GetMethod(implObj, "EndTransfer"), flags, 2)
        this.vtbl.StartDelete := CallbackCreate(GetMethod(implObj, "StartDelete"), flags, 2)
        this.vtbl.StartItemDelete := CallbackCreate(GetMethod(implObj, "StartItemDelete"), flags, 3)
        this.vtbl.UpdateDeletePercent := CallbackCreate(GetMethod(implObj, "UpdateDeletePercent"), flags, 2)
        this.vtbl.EndItemDelete := CallbackCreate(GetMethod(implObj, "EndItemDelete"), flags, 4)
        this.vtbl.EndDelete := CallbackCreate(GetMethod(implObj, "EndDelete"), flags, 2)
        this.vtbl.EndSession := CallbackCreate(GetMethod(implObj, "EndSession"), flags, 2)
        this.vtbl.GetDeleteAfterAcquire := CallbackCreate(GetMethod(implObj, "GetDeleteAfterAcquire"), flags, 2)
        this.vtbl.ErrorAdvise := CallbackCreate(GetMethod(implObj, "ErrorAdvise"), flags, 5)
        this.vtbl.GetUserInput := CallbackCreate(GetMethod(implObj, "GetUserInput"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancelled)
        CallbackFree(this.vtbl.StartEnumeration)
        CallbackFree(this.vtbl.FoundItem)
        CallbackFree(this.vtbl.EndEnumeration)
        CallbackFree(this.vtbl.StartTransfer)
        CallbackFree(this.vtbl.StartItemTransfer)
        CallbackFree(this.vtbl.DirectoryCreated)
        CallbackFree(this.vtbl.UpdateTransferPercent)
        CallbackFree(this.vtbl.EndItemTransfer)
        CallbackFree(this.vtbl.EndTransfer)
        CallbackFree(this.vtbl.StartDelete)
        CallbackFree(this.vtbl.StartItemDelete)
        CallbackFree(this.vtbl.UpdateDeletePercent)
        CallbackFree(this.vtbl.EndItemDelete)
        CallbackFree(this.vtbl.EndDelete)
        CallbackFree(this.vtbl.EndSession)
        CallbackFree(this.vtbl.GetDeleteAfterAcquire)
        CallbackFree(this.vtbl.ErrorAdvise)
        CallbackFree(this.vtbl.GetUserInput)
    }
}
