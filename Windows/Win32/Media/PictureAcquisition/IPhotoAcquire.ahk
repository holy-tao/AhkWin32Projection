#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquire interface provides methods for acquiring photos from a device.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquire
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquire extends IUnknown{
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
     * 
     * @param {PWSTR} pszDevice 
     * @param {Pointer<IPhotoAcquireSource>} ppPhotoAcquireSource 
     * @returns {HRESULT} 
     */
    CreatePhotoSource(pszDevice, ppPhotoAcquireSource) {
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

        result := ComCall(3, this, "ptr", pszDevice, "ptr", ppPhotoAcquireSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPhotoAcquireSource>} pPhotoAcquireSource 
     * @param {BOOL} fShowProgress 
     * @param {HWND} hWndParent 
     * @param {PWSTR} pszApplicationName 
     * @param {Pointer<IPhotoAcquireProgressCB>} pPhotoAcquireProgressCB 
     * @returns {HRESULT} 
     */
    Acquire(pPhotoAcquireSource, fShowProgress, hWndParent, pszApplicationName, pPhotoAcquireProgressCB) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent
        pszApplicationName := pszApplicationName is String ? StrPtr(pszApplicationName) : pszApplicationName

        result := ComCall(4, this, "ptr", pPhotoAcquireSource, "int", fShowProgress, "ptr", hWndParent, "ptr", pszApplicationName, "ptr", pPhotoAcquireProgressCB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} ppEnumFilePaths 
     * @returns {HRESULT} 
     */
    EnumResults(ppEnumFilePaths) {
        result := ComCall(5, this, "ptr", ppEnumFilePaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
