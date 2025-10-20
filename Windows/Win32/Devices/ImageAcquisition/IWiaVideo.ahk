#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaVideo interface provides methods that allow an application that uses Windows Image Acquisition (WIA) services to acquire still images from a streaming video device.Note  WIA does not support video devices in Windows Server 2003, Windows Vista, and later. For those versions of the Windows, use DirectShow to acquire images from video.
 * @remarks
 * 
  * The <b>IWiaVideo</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
  * 
  * <table class="clsStd">
  * <tr>
  * <th>IUnknown Methods</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
  * </td>
  * <td>Returns pointers to supported interfaces.</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
  * </td>
  * <td>Increments reference count.</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
  * </td>
  * <td>Decrements reference count.</td>
  * </tr>
  * </table>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nn-wiavideo-iwiavideo
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaVideo extends IUnknown{
    /**
     * The interface identifier for IWiaVideo
     * @type {Guid}
     */
    static IID => Guid("{d52920aa-db88-41f0-946c-e00dc0a19cfa}")

    /**
     * The class identifier for WiaVideo
     * @type {Guid}
     */
    static CLSID => Guid("{3908c3cd-4478-4536-af2f-10c25d4ef89a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pbPreviewVisible 
     * @returns {HRESULT} 
     */
    get_PreviewVisible(pbPreviewVisible) {
        result := ComCall(3, this, "ptr", pbPreviewVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bPreviewVisible 
     * @returns {HRESULT} 
     */
    put_PreviewVisible(bPreviewVisible) {
        result := ComCall(4, this, "int", bPreviewVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrImageDirectory 
     * @returns {HRESULT} 
     */
    get_ImagesDirectory(pbstrImageDirectory) {
        result := ComCall(5, this, "ptr", pbstrImageDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrImageDirectory 
     * @returns {HRESULT} 
     */
    put_ImagesDirectory(bstrImageDirectory) {
        bstrImageDirectory := bstrImageDirectory is String ? BSTR.Alloc(bstrImageDirectory).Value : bstrImageDirectory

        result := ComCall(6, this, "ptr", bstrImageDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrWiaDeviceID 
     * @param {HWND} hwndParent 
     * @param {BOOL} bStretchToFitParent 
     * @param {BOOL} bAutoBeginPlayback 
     * @returns {HRESULT} 
     */
    CreateVideoByWiaDevID(bstrWiaDeviceID, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        bstrWiaDeviceID := bstrWiaDeviceID is String ? BSTR.Alloc(bstrWiaDeviceID).Value : bstrWiaDeviceID
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", bstrWiaDeviceID, "ptr", hwndParent, "int", bStretchToFitParent, "int", bAutoBeginPlayback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiDeviceNumber 
     * @param {HWND} hwndParent 
     * @param {BOOL} bStretchToFitParent 
     * @param {BOOL} bAutoBeginPlayback 
     * @returns {HRESULT} 
     */
    CreateVideoByDevNum(uiDeviceNumber, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(8, this, "uint", uiDeviceNumber, "ptr", hwndParent, "int", bStretchToFitParent, "int", bAutoBeginPlayback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFriendlyName 
     * @param {HWND} hwndParent 
     * @param {BOOL} bStretchToFitParent 
     * @param {BOOL} bAutoBeginPlayback 
     * @returns {HRESULT} 
     */
    CreateVideoByName(bstrFriendlyName, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(9, this, "ptr", bstrFriendlyName, "ptr", hwndParent, "int", bStretchToFitParent, "int", bAutoBeginPlayback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DestroyVideo() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Play() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNewImageFilename 
     * @returns {HRESULT} 
     */
    TakePicture(pbstrNewImageFilename) {
        result := ComCall(13, this, "ptr", pbstrNewImageFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bStretchToFitParent 
     * @returns {HRESULT} 
     */
    ResizeVideo(bStretchToFitParent) {
        result := ComCall(14, this, "int", bStretchToFitParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetCurrentState(pState) {
        result := ComCall(15, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
