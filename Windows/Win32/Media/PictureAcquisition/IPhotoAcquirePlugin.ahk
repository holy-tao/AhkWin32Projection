#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IPhotoAcquirePlugin interface when you want to create a plug-in to run alongside the Windows Vista user interface (UI) for image acquisition. Registry settings are required to enable the plug-in.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquireplugin
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquirePlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquirePlugin
     * @type {Guid}
     */
    static IID => Guid("{00f2dceb-ecb8-4f77-8e47-e7a987c83dd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "ProcessItem", "TransferComplete", "DisplayConfigureDialog"]

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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireplugin-initialize
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireplugin-processitem
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireplugin-transfercomplete
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireplugin-displayconfiguredialog
     */
    DisplayConfigureDialog(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(6, this, "ptr", hWndParent, "HRESULT")
        return result
    }
}
