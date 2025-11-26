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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreviewVisible", "put_PreviewVisible", "get_ImagesDirectory", "put_ImagesDirectory", "CreateVideoByWiaDevID", "CreateVideoByDevNum", "CreateVideoByName", "DestroyVideo", "Play", "Pause", "TakePicture", "ResizeVideo", "GetCurrentState"]

    /**
     * @type {BOOL} 
     */
    PreviewVisible {
        get => this.get_PreviewVisible()
        set => this.put_PreviewVisible(value)
    }

    /**
     * @type {BSTR} 
     */
    ImagesDirectory {
        get => this.get_ImagesDirectory()
        set => this.put_ImagesDirectory(value)
    }

    /**
     * The IWiaVideo::PreviewVisible property specifies whether the video playback is visible in its parent window. This does not affect the WIAVIDEO_STATE of the video.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-get_previewvisible
     */
    get_PreviewVisible() {
        result := ComCall(3, this, "int*", &pbPreviewVisible := 0, "HRESULT")
        return pbPreviewVisible
    }

    /**
     * The IWiaVideo::PreviewVisible property specifies whether the video playback is visible in its parent window. This does not affect the WIAVIDEO_STATE of the video.
     * @param {BOOL} bPreviewVisible 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-put_previewvisible
     */
    put_PreviewVisible(bPreviewVisible) {
        result := ComCall(4, this, "int", bPreviewVisible, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::ImagesDirectory property specifies the full path and directory where images are stored when calling the IWiaVideo::TakePicture method.
     * @remarks
     * 
     * This property should be set to the value of the video device's WIA_DPV_IMAGES_DIRECTORY property.
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-get_imagesdirectory
     */
    get_ImagesDirectory() {
        pbstrImageDirectory := BSTR()
        result := ComCall(5, this, "ptr", pbstrImageDirectory, "HRESULT")
        return pbstrImageDirectory
    }

    /**
     * The IWiaVideo::ImagesDirectory property specifies the full path and directory where images are stored when calling the IWiaVideo::TakePicture method.
     * @remarks
     * 
     * This property should be set to the value of the video device's WIA_DPV_IMAGES_DIRECTORY property.
     * 
     * @param {BSTR} bstrImageDirectory 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-put_imagesdirectory
     */
    put_ImagesDirectory(bstrImageDirectory) {
        bstrImageDirectory := bstrImageDirectory is String ? BSTR.Alloc(bstrImageDirectory).Value : bstrImageDirectory

        result := ComCall(6, this, "ptr", bstrImageDirectory, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::CreateVideoByWiaDevID method creates a connection to a streaming video device from its WIA_DIP_DEV_ID property.
     * @param {BSTR} bstrWiaDeviceID Type: <b>BSTR</b>
     * 
     * Specifies the value of the video device's WIA_DIP_DEV_ID property.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Specifies the window in which to display the streaming video.
     * @param {BOOL} bStretchToFitParent Type: <b>BOOL</b>
     * 
     * Specifies whether the video display is stretched to fit the parent window. Set this parameter to <b>TRUE</b> if the display should be stretched to fit the parent window; otherwise, set to <b>FALSE</b>.
     * @param {BOOL} bAutoBeginPlayback Type: <b>BOOL</b>
     * 
     * Specifies whether the streaming video begins playback as soon as this method returns. Set this parameter to <b>TRUE</b> to cause immediate playback; set it to <b>FALSE</b> to require a call to <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-play">IWiaVideo::Play</a> before video playback begins.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-createvideobywiadevid
     */
    CreateVideoByWiaDevID(bstrWiaDeviceID, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        bstrWiaDeviceID := bstrWiaDeviceID is String ? BSTR.Alloc(bstrWiaDeviceID).Value : bstrWiaDeviceID
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(7, this, "ptr", bstrWiaDeviceID, "ptr", hwndParent, "int", bStretchToFitParent, "int", bAutoBeginPlayback, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::CreateVideoByDevNum method creates a connection to a streaming video device with the device number obtained from a Directshow enumeration.
     * @param {Integer} uiDeviceNumber Type: <b>UINT</b>
     * 
     * Specifies the video device's Directshow device number.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Specifies the window in which to display the streaming video.
     * @param {BOOL} bStretchToFitParent Type: <b>BOOL</b>
     * 
     * Specifies whether the video display is stretched to fit the parent window. Set this parameter to <b>TRUE</b> if the display should be stretched to fit the parent window; otherwise, set to <b>FALSE</b>.
     * @param {BOOL} bAutoBeginPlayback Type: <b>BOOL</b>
     * 
     * Specifies whether the streaming video begins playback as soon as this method returns. Set this parameter to <b>TRUE</b> to cause immediate playback; set it to <b>FALSE</b> to require a call to <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-play">IWiaVideo::Play</a> before video playback begins.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-createvideobydevnum
     */
    CreateVideoByDevNum(uiDeviceNumber, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(8, this, "uint", uiDeviceNumber, "ptr", hwndParent, "int", bStretchToFitParent, "int", bAutoBeginPlayback, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::CreateVideoByName method creates a connection to a streaming video device with the friendly device name obtained from a Directshow enumeration.
     * @param {BSTR} bstrFriendlyName Type: <b>BSTR</b>
     * 
     * Specifies the video device's friendly name obtained from a Directshow device enumeration.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Specifies the window in which to display the streaming video.
     * @param {BOOL} bStretchToFitParent Type: <b>BOOL</b>
     * 
     * Specifies whether the video display is stretched to fit the parent window. Set this parameter to <b>TRUE</b> if the display should be stretched to fit the parent window; otherwise, set to <b>FALSE</b>.
     * @param {BOOL} bAutoBeginPlayback Type: <b>BOOL</b>
     * 
     * Specifies whether the streaming video begins playback as soon as this method returns. Set this parameter to <b>TRUE</b> to cause immediate playback; set it to <b>FALSE</b> to require a call to <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-play">IWiaVideo::Play</a> before video playback begins.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-createvideobyname
     */
    CreateVideoByName(bstrFriendlyName, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(9, this, "ptr", bstrFriendlyName, "ptr", hwndParent, "int", bStretchToFitParent, "int", bAutoBeginPlayback, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::DestroyVideo method shuts down the streaming video. To restart video playback, the application must call one of the IWiaVideo CreateVideo methods again.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-destroyvideo
     */
    DestroyVideo() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Begins playback of streaming video.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds or the video is already playing, this method returns S_OK. If the method fails, it returns a standard COM error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-play
     */
    Play() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::Pause method pauses video playback.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-pause
     */
    Pause() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::TakePicture method extracts a still image from the video stream, and saves the image as a JPEG file.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives the full path and filename of the JPEG file that this method creates.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-takepicture
     */
    TakePicture() {
        pbstrNewImageFilename := BSTR()
        result := ComCall(13, this, "ptr", pbstrNewImageFilename, "HRESULT")
        return pbstrNewImageFilename
    }

    /**
     * The IWiaVideo::ResizeVideo method resizes the video playback to the largest supported resolution that fits inside the parent window. Call this method whenever the parent window is moved or resized.
     * @param {BOOL} bStretchToFitParent Type: <b>BOOL</b>
     * 
     * Specifies whether the video playback is stretched to fill the parent window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-resizevideo
     */
    ResizeVideo(bStretchToFitParent) {
        result := ComCall(14, this, "int", bStretchToFitParent, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::GetCurrentState method specifies the state of the video stream as a member of the WIAVIDEO_STATE enumeration.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wiavideo/ne-wiavideo-wiavideo_state">WIAVIDEO_STATE</a>*</b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/win32/api/wiavideo/ne-wiavideo-wiavideo_state">WIAVIDEO_STATE</a> enumeration that specifies the current state of the video stream.
     * @see https://docs.microsoft.com/windows/win32/api//wiavideo/nf-wiavideo-iwiavideo-getcurrentstate
     */
    GetCurrentState() {
        result := ComCall(15, this, "int*", &pState := 0, "HRESULT")
        return pState
    }
}
