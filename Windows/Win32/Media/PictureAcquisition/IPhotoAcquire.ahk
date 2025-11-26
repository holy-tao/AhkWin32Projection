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
     * The CreatePhotoSource method initializes an IPhotoAcquireSource object to pass to IPhotoAcquire::Acquire.
     * @param {PWSTR} pszDevice Pointer to a null-terminated string containing the device name.
     * @returns {IPhotoAcquireSource} Returns the initialized photo source to acquire photos from.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquire-createphotosource
     */
    CreatePhotoSource(pszDevice) {
        pszDevice := pszDevice is String ? StrPtr(pszDevice) : pszDevice

        result := ComCall(3, this, "ptr", pszDevice, "ptr*", &ppPhotoAcquireSource := 0, "HRESULT")
        return IPhotoAcquireSource(ppPhotoAcquireSource)
    }

    /**
     * The Acquire method acquires photos from a device.
     * @param {IPhotoAcquireSource} pPhotoAcquireSource Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquiresource">IPhotoAcquireSource</a> object representing the device from which to acquire photos. Initialize this object by calling <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-createphotosource">CreatePhotoSource</a>.
     * @param {BOOL} fShowProgress Flag that, when set to <b>TRUE</b>, indicates that a progress dialog will be shown.
     * @param {HWND} hWndParent Handle to a parent window.
     * @param {PWSTR} pszApplicationName Pointer to a null-terminated string containing the application name.
     * @param {IPhotoAcquireProgressCB} pPhotoAcquireProgressCB Pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iphotoacquireprogresscb">IPhotoAcquireProgressCB</a> object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-<b>NULL</b> pointer was expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquire-acquire
     */
    Acquire(pPhotoAcquireSource, fShowProgress, hWndParent, pszApplicationName, pPhotoAcquireProgressCB) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent
        pszApplicationName := pszApplicationName is String ? StrPtr(pszApplicationName) : pszApplicationName

        result := ComCall(4, this, "ptr", pPhotoAcquireSource, "int", fShowProgress, "ptr", hWndParent, "ptr", pszApplicationName, "ptr", pPhotoAcquireProgressCB, "HRESULT")
        return result
    }

    /**
     * The EnumResults method retrieves an enumeration containing the paths of all files successfully transferred during the most recent call to Acquire.
     * @returns {IEnumString} Returns an enumeration containing the paths to all the transferred files.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquire-enumresults
     */
    EnumResults() {
        result := ComCall(5, this, "ptr*", &ppEnumFilePaths := 0, "HRESULT")
        return IEnumString(ppEnumFilePaths)
    }
}
