#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireOptionsDialog interface is used to display an options dialog box in which the user can select photo acquisition settings such as file name formats, as well as whether or not to rotate images, to prompt for a tag name, or to erase photos from the camera after importing.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquireoptionsdialog
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireOptionsDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireOptionsDialog
     * @type {Guid}
     */
    static IID => Guid("{00f2b3ee-bf64-47ee-89f4-4dedd79643f2}")

    /**
     * The class identifier for PhotoAcquireOptionsDialog
     * @type {Guid}
     */
    static CLSID => Guid("{00f210a1-62f0-438b-9f7e-9618d72a1831}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Create", "Destroy", "DoModal", "SaveData"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszRegistryRoot 
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
    Initialize(pszRegistryRoot) {
        pszRegistryRoot := pszRegistryRoot is String ? StrPtr(pszRegistryRoot) : pszRegistryRoot

        result := ComCall(3, this, "ptr", pszRegistryRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<HWND>} phWndDialog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-create
     */
    Create(hWndParent, phWndDialog) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(4, this, "ptr", hWndParent, "ptr", phWndDialog, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-destroy
     */
    Destroy() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<Pointer>} ppnReturnCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-domodal
     */
    DoModal(hWndParent, ppnReturnCode) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(6, this, "ptr", hWndParent, "ptr*", ppnReturnCode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-savedata
     */
    SaveData() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
