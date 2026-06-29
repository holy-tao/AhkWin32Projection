#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WIAVIDEO_STATE.ahk" { WIAVIDEO_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWiaVideo interface provides methods that allow an application that uses Windows Image Acquisition (WIA) services to acquire still images from a streaming video device.Note  WIA does not support video devices in Windows Server 2003, Windows Vista, and later. For those versions of the Windows, use DirectShow to acquire images from video.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nn-wiavideo-iwiavideo
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaVideo extends IUnknown {
    /**
     * The interface identifier for IWiaVideo
     * @type {Guid}
     */
    static IID := Guid("{d52920aa-db88-41f0-946c-e00dc0a19cfa}")

    /**
     * The class identifier for WiaVideo
     * @type {Guid}
     */
    static CLSID := Guid("{3908c3cd-4478-4536-af2f-10c25d4ef89a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaVideo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PreviewVisible    : IntPtr
        put_PreviewVisible    : IntPtr
        get_ImagesDirectory   : IntPtr
        put_ImagesDirectory   : IntPtr
        CreateVideoByWiaDevID : IntPtr
        CreateVideoByDevNum   : IntPtr
        CreateVideoByName     : IntPtr
        DestroyVideo          : IntPtr
        Play                  : IntPtr
        Pause                 : IntPtr
        TakePicture           : IntPtr
        ResizeVideo           : IntPtr
        GetCurrentState       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaVideo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The IWiaVideo::PreviewVisible property specifies whether the video playback is visible in its parent window. This does not affect the WIAVIDEO_STATE of the video. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-get_previewvisible
     */
    get_PreviewVisible() {
        result := ComCall(3, this, BOOL.Ptr, &pbPreviewVisible := 0, "HRESULT")
        return pbPreviewVisible
    }

    /**
     * The IWiaVideo::PreviewVisible property specifies whether the video playback is visible in its parent window. This does not affect the WIAVIDEO_STATE of the video. (Put)
     * @param {BOOL} bPreviewVisible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-put_previewvisible
     */
    put_PreviewVisible(bPreviewVisible) {
        result := ComCall(4, this, BOOL, bPreviewVisible, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::ImagesDirectory property specifies the full path and directory where images are stored when calling the IWiaVideo::TakePicture method. (Get)
     * @remarks
     * This property should be set to the value of the video device's WIA_DPV_IMAGES_DIRECTORY property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-get_imagesdirectory
     */
    get_ImagesDirectory() {
        pbstrImageDirectory := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrImageDirectory, "HRESULT")
        return pbstrImageDirectory
    }

    /**
     * The IWiaVideo::ImagesDirectory property specifies the full path and directory where images are stored when calling the IWiaVideo::TakePicture method. (Put)
     * @remarks
     * This property should be set to the value of the video device's WIA_DPV_IMAGES_DIRECTORY property.
     * @param {BSTR} bstrImageDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-put_imagesdirectory
     */
    put_ImagesDirectory(bstrImageDirectory) {
        bstrImageDirectory := bstrImageDirectory is String ? BSTR.Alloc(bstrImageDirectory).Value : bstrImageDirectory

        result := ComCall(6, this, BSTR, bstrImageDirectory, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::CreateVideoByWiaDevID method creates a connection to a streaming video device from its WIA_DIP_DEV_ID property.
     * @remarks
     * By default, the video is displayed in the video device's default resolution. If <i>bStretchToFitParent</i> is set to <b>TRUE</b>, the video display fills the window.
     * 
     * In order for the function to succeed, the <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-get_imagesdirectory">IWiaVideo::ImagesDirectory</a> property must be specified first.  Thus, the caller must first call "put_ImagesDirectory" to specify the full path of the directory in which the captured still images will be stored.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-createvideobywiadevid
     */
    CreateVideoByWiaDevID(bstrWiaDeviceID, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        bstrWiaDeviceID := bstrWiaDeviceID is String ? BSTR.Alloc(bstrWiaDeviceID).Value : bstrWiaDeviceID

        result := ComCall(7, this, BSTR, bstrWiaDeviceID, HWND, hwndParent, BOOL, bStretchToFitParent, BOOL, bAutoBeginPlayback, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::CreateVideoByDevNum method creates a connection to a streaming video device with the device number obtained from a Directshow enumeration.
     * @remarks
     * By default, the video is displayed in the video device's default resolution. If <i>bStretchToFitParent</i> is set to <b>TRUE</b>, the video display fills the window.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-createvideobydevnum
     */
    CreateVideoByDevNum(uiDeviceNumber, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        result := ComCall(8, this, "uint", uiDeviceNumber, HWND, hwndParent, BOOL, bStretchToFitParent, BOOL, bAutoBeginPlayback, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::CreateVideoByName method creates a connection to a streaming video device with the friendly device name obtained from a Directshow enumeration.
     * @remarks
     * By default, the video is displayed in the video device's default resolution. If <i>bStretchToFitParent</i> is set to <b>TRUE</b>, the video display fills the window.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-createvideobyname
     */
    CreateVideoByName(bstrFriendlyName, hwndParent, bStretchToFitParent, bAutoBeginPlayback) {
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName

        result := ComCall(9, this, BSTR, bstrFriendlyName, HWND, hwndParent, BOOL, bStretchToFitParent, BOOL, bAutoBeginPlayback, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::DestroyVideo method shuts down the streaming video. To restart video playback, the application must call one of the IWiaVideo CreateVideo methods again.
     * @remarks
     * Call this method only after a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobywiadevid">IWiaVideo::CreateVideoByWiaDevID</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobydevnum">IWiaVideo::CreateVideoByDevNum</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobyname">IWiaVideo::CreateVideoByName</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-destroyvideo
     */
    DestroyVideo() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Begins playback of streaming video.
     * @remarks
     * Call this method only after a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobywiadevid">IWiaVideo::CreateVideoByWiaDevID</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobydevnum">IWiaVideo::CreateVideoByDevNum</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobyname">IWiaVideo::CreateVideoByName</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds or the video is already playing, this method returns S_OK. If the method fails, it returns a standard COM error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-play
     */
    Play() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::Pause method pauses video playback.
     * @remarks
     * Call this method only after a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobywiadevid">IWiaVideo::CreateVideoByWiaDevID</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobydevnum">IWiaVideo::CreateVideoByDevNum</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobyname">IWiaVideo::CreateVideoByName</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-pause
     */
    Pause() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::TakePicture method extracts a still image from the video stream, and saves the image as a JPEG file.
     * @remarks
     * The path and directory where the image file is saved are specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-get_imagesdirectory">IWiaVideo::ImagesDirectory</a> property.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives the full path and filename of the JPEG file that this method creates.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-takepicture
     */
    TakePicture() {
        pbstrNewImageFilename := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrNewImageFilename, "HRESULT")
        return pbstrNewImageFilename
    }

    /**
     * The IWiaVideo::ResizeVideo method resizes the video playback to the largest supported resolution that fits inside the parent window. Call this method whenever the parent window is moved or resized.
     * @remarks
     * By default, the video is displayed in a supported resolution smaller than the parent window. If <i>bStretchToFitParent</i> is set to <b>TRUE</b>, the video display fills the window.
     * @param {BOOL} bStretchToFitParent Type: <b>BOOL</b>
     * 
     * Specifies whether the video playback is stretched to fill the parent window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-resizevideo
     */
    ResizeVideo(bStretchToFitParent) {
        result := ComCall(14, this, BOOL, bStretchToFitParent, "HRESULT")
        return result
    }

    /**
     * The IWiaVideo::GetCurrentState method specifies the state of the video stream as a member of the WIAVIDEO_STATE enumeration.
     * @returns {WIAVIDEO_STATE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/wiavideo/ne-wiavideo-wiavideo_state">WIAVIDEO_STATE</a>*</b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/win32/api/wiavideo/ne-wiavideo-wiavideo_state">WIAVIDEO_STATE</a> enumeration that specifies the current state of the video stream.
     * @see https://learn.microsoft.com/windows/win32/api/wiavideo/nf-wiavideo-iwiavideo-getcurrentstate
     */
    GetCurrentState() {
        result := ComCall(15, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    Query(iid) {
        if (IWiaVideo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PreviewVisible := CallbackCreate(GetMethod(implObj, "get_PreviewVisible"), flags, 2)
        this.vtbl.put_PreviewVisible := CallbackCreate(GetMethod(implObj, "put_PreviewVisible"), flags, 2)
        this.vtbl.get_ImagesDirectory := CallbackCreate(GetMethod(implObj, "get_ImagesDirectory"), flags, 2)
        this.vtbl.put_ImagesDirectory := CallbackCreate(GetMethod(implObj, "put_ImagesDirectory"), flags, 2)
        this.vtbl.CreateVideoByWiaDevID := CallbackCreate(GetMethod(implObj, "CreateVideoByWiaDevID"), flags, 5)
        this.vtbl.CreateVideoByDevNum := CallbackCreate(GetMethod(implObj, "CreateVideoByDevNum"), flags, 5)
        this.vtbl.CreateVideoByName := CallbackCreate(GetMethod(implObj, "CreateVideoByName"), flags, 5)
        this.vtbl.DestroyVideo := CallbackCreate(GetMethod(implObj, "DestroyVideo"), flags, 1)
        this.vtbl.Play := CallbackCreate(GetMethod(implObj, "Play"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.TakePicture := CallbackCreate(GetMethod(implObj, "TakePicture"), flags, 2)
        this.vtbl.ResizeVideo := CallbackCreate(GetMethod(implObj, "ResizeVideo"), flags, 2)
        this.vtbl.GetCurrentState := CallbackCreate(GetMethod(implObj, "GetCurrentState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PreviewVisible)
        CallbackFree(this.vtbl.put_PreviewVisible)
        CallbackFree(this.vtbl.get_ImagesDirectory)
        CallbackFree(this.vtbl.put_ImagesDirectory)
        CallbackFree(this.vtbl.CreateVideoByWiaDevID)
        CallbackFree(this.vtbl.CreateVideoByDevNum)
        CallbackFree(this.vtbl.CreateVideoByName)
        CallbackFree(this.vtbl.DestroyVideo)
        CallbackFree(this.vtbl.Play)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.TakePicture)
        CallbackFree(this.vtbl.ResizeVideo)
        CallbackFree(this.vtbl.GetCurrentState)
    }
}
