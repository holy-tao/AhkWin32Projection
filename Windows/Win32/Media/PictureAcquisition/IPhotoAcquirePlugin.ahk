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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource 
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pPhotoAcquireSource, pPhotoAcquireProgressCB) {
        result := ComCall(3, this, "ptr", pPhotoAcquireSource, "ptr", pPhotoAcquireProgressCB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAcquireStage 
     * @param {IPhotoAcquireItem} pPhotoAcquireItem 
     * @param {IStream} pOriginalItemStream 
     * @param {PWSTR} pszFinalFilename 
     * @param {IPropertyStore} pPropertyStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-processitem
     */
    ProcessItem(dwAcquireStage, pPhotoAcquireItem, pOriginalItemStream, pszFinalFilename, pPropertyStore) {
        pszFinalFilename := pszFinalFilename is String ? StrPtr(pszFinalFilename) : pszFinalFilename

        result := ComCall(4, this, "uint", dwAcquireStage, "ptr", pPhotoAcquireItem, "ptr", pOriginalItemStream, "ptr", pszFinalFilename, "ptr", pPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-transfercomplete
     */
    TransferComplete(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireplugin-displayconfiguredialog
     */
    DisplayConfigureDialog(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(6, this, "ptr", hWndParent, "HRESULT")
        return result
    }
}
