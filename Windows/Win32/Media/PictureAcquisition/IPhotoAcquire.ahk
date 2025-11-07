#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPhotoAcquireSource.ahk
#Include ..\..\System\Com\IEnumString.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquire interface provides methods for acquiring photos from a device.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquire
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquire extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquire
     * @type {Guid}
     */
    static IID => Guid("{00f23353-e31b-4955-a8ad-ca5ebf31e2ce}")

    /**
     * The class identifier for PhotoAcquire
     * @type {Guid}
     */
    static CLSID => Guid("{00f26e02-e9f2-4a9f-9fdd-5a962fb26a98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePhotoSource", "Acquire", "EnumResults"]

    /**
     * 
     * @param {PWSTR} pszDevice 
     * @returns {IPhotoAcquireSource} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquire-createphotosource
     */
    CreatePhotoSource(pszDevice) {
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

        result := ComCall(3, this, "ptr", pszDevice, "ptr*", &ppPhotoAcquireSource := 0, "HRESULT")
        return IPhotoAcquireSource(ppPhotoAcquireSource)
    }

    /**
     * 
     * @param {IPhotoAcquireSource} pPhotoAcquireSource 
     * @param {BOOL} fShowProgress 
     * @param {HWND} hWndParent 
     * @param {PWSTR} pszApplicationName 
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquire-acquire
     */
    Acquire(pPhotoAcquireSource, fShowProgress, hWndParent, pszApplicationName, pPhotoAcquireProgressCB) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent
        pszApplicationName := pszApplicationName is String ? StrPtr(pszApplicationName) : pszApplicationName

        result := ComCall(4, this, "ptr", pPhotoAcquireSource, "int", fShowProgress, "ptr", hWndParent, "ptr", pszApplicationName, "ptr", pPhotoAcquireProgressCB, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquire-enumresults
     */
    EnumResults() {
        result := ComCall(5, this, "ptr*", &ppEnumFilePaths := 0, "HRESULT")
        return IEnumString(ppEnumFilePaths)
    }
}
