#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraOptionsUIStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a method for displaying a UI, by which the UI contains options for the capture of photos, audio recordings and videos.
 * @remarks
 * This object is not instantiated directly. Simply use the static [Show](cameraoptionsui_show_30375942.md) method to display the options.
 * 
 * > [!NOTE]
 * > This API is in the **Desktop** device family which means it can only be used on devices that support that family. To use this API, you must add a reference to the **Windows Desktop Extensions for the UWP** to your app. For more information on device families, see Intro to the [Universal Windows Platform](/windows/uwp/get-started/universal-application-platform-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameraoptionsui
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraOptionsUI extends IInspectable {
;@region Static Methods
    /**
     * Displays a UI that contains options for the capture of photos, audio recordings and videos.
     * @param {MediaCapture} mediaCapture_ The [MediaCapture](mediacapture.md) object that provides methods for the capture of photos, audio recordings and videos.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameraoptionsui.show
     */
    static Show(mediaCapture_) {
        if (!CameraOptionsUI.HasProp("__ICameraOptionsUIStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.CameraOptionsUI")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICameraOptionsUIStatics.IID)
            CameraOptionsUI.__ICameraOptionsUIStatics := ICameraOptionsUIStatics(factoryPtr)
        }

        return CameraOptionsUI.__ICameraOptionsUIStatics.Show(mediaCapture_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
