#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraCaptureUI.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a full window UI for capturing audio, video, and photos from a camera. As well as controls for trimming video, time delayed capture, and camera settings.
 * @remarks
 * CameraCaptureUI provides a full window UI experience for capturing audio, video, and images. It provides controls for setting a time delay on photo captures, trimming video, and for adjusting the camera's settings such as video resolution, the audio device, brightness, and contrast.
 * 
 * Call [CaptureFileAsync](cameracaptureui_capturefileasync_1903527183.md) to launch the UI. The user has control over when to start the capture. When the asynchronous [CaptureFileAsync](cameracaptureui_capturefileasync_1903527183.md) operation completes, a [StorageFile](../windows.storage/storagefile.md) object is returned. For how-to guidance for using **CameraCaptureUI**, see [Capture photos and video in a desktop app with the Windows built-in camera UI](/windows/apps/develop/camera/cameracaptureui)
 * 
 * > [!NOTE]
 * > You should not specify the **webcam** or **microphone** capabilities in your app manifest file if you are using **CameraCaptureUI**. If you do so, your app will be displayed in the device's camera privacy settings, but even if the user denies camera access to your app, it will not prevent the **CameraCaptureUI** from capturing media. This is because the Windows built-in camera app is a trusted first-party app that requires the user to initiate photo, audio, and video capture with a button press. Your app may fail Windows Application Certification Kit certification when submitted to the Store if you specify the **webcam** or **microphone** capabilities when using **CameraCaptureUI**.
 * 
 * You must specify the **webcam** or **microphone** capabilities in your app manifest file if you are using [MediaCapture](mediacapture.md) to capture audio, photos, or video programmatically.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureui
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraCaptureUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraCaptureUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides settings for capturing photos. The settings include aspect ratio, image size, format, resolution, and whether or not cropping is allowed by the user interface (UI).
     * @remarks
     * For information on the available photo capture settings, see [CameraCaptureUIPhotoCaptureSettings](cameracaptureuiphotocapturesettings.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureui.photosettings
     * @type {CameraCaptureUIPhotoCaptureSettings} 
     */
    PhotoSettings {
        get => this.get_PhotoSettings()
    }

    /**
     * Provides settings for capturing videos. The settings include format, maximum resolution, maximum duration, and whether or not to allow trimming.
     * @remarks
     * For information on the available video capture settings, see [CameraCaptureUIVideoCaptureSettings](cameracaptureuivideocapturesettings.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureui.videosettings
     * @type {CameraCaptureUIVideoCaptureSettings} 
     */
    VideoSettings {
        get => this.get_VideoSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Create a new [CameraCaptureUI](cameracaptureui.md) object.
     * @remarks
     * After you create a new [CameraCaptureUI](cameracaptureui.md) object, you may want to set the [PhotoSettings](cameracaptureui_photosettings.md) or [VideoSettings](cameracaptureui_videosettings.md) property of the object before calling [CaptureFileAsync](cameracaptureui_capturefileasync_1903527183.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.CameraCaptureUI")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {CameraCaptureUIPhotoCaptureSettings} 
     */
    get_PhotoSettings() {
        if (!this.HasProp("__ICameraCaptureUI")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUI := ICameraCaptureUI(outPtr)
        }

        return this.__ICameraCaptureUI.get_PhotoSettings()
    }

    /**
     * 
     * @returns {CameraCaptureUIVideoCaptureSettings} 
     */
    get_VideoSettings() {
        if (!this.HasProp("__ICameraCaptureUI")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUI := ICameraCaptureUI(outPtr)
        }

        return this.__ICameraCaptureUI.get_VideoSettings()
    }

    /**
     * Launches the [CameraCaptureUI](cameracaptureui.md) user interface.
     * @remarks
     * Call CaptureFileAsync to launch the UI. The user has control over when to start the capture. When the asynchronous operation completes, a [StorageFile](../windows.storage/storagefile.md) object is returned.
     * @param {Integer} mode_ Specifies whether the user interface that will be shown allows the user to capture a photo, capture a video, or capture both photos and videos.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureui.capturefileasync
     */
    CaptureFileAsync(mode_) {
        if (!this.HasProp("__ICameraCaptureUI")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUI := ICameraCaptureUI(outPtr)
        }

        return this.__ICameraCaptureUI.CaptureFileAsync(mode_)
    }

;@endregion Instance Methods
}
