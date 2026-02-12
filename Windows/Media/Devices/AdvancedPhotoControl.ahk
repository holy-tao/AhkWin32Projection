#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdvancedPhotoControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the advanced photo capture behavior on a capture device.
 * @remarks
 * Get an instance of this class by accessing the [VideoDeviceController.AdvancedPhotoControl](videodevicecontroller_advancedphotocontrol.md) property.
 * 
 * For how-to guidance on using [AdvancedPhotoCapture](../windows.media.capture/advancedphotocapture.md), see [High dynamic range (HDR) and low-light photo capture](/windows/uwp/audio-video-camera/high-dynamic-range-hdr-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AdvancedPhotoControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdvancedPhotoControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdvancedPhotoControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the [AdvancedPhotoControl](advancedphotocontrol.md) is supported on the current capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets a list of the advanced capture modes supported by the current capture device.
     * @remarks
     * > [!NOTE] 
     * > Starting with Windows 10, version 1709, recording video and using AdvancedPhotoCapture concurrently is supported.  This is not supported in previous versions. This change means that you can have a prepared **[LowLagMediaRecording](/uwp/api/windows.media.capture.lowlagmediarecording)** and **[AdvancedPhotoCapture](/uwp/api/windows.media.capture.advancedphotocapture)** at the same time. You can start or stop video recording between calls to **[MediaCapture.PrepareAdvancedPhotoCaptureAsync](/uwp/api/windows.media.capture.mediacapture#Windows_Media_Capture_MediaCapture_PrepareAdvancedPhotoCaptureAsync_Windows_Media_MediaProperties_ImageEncodingProperties_)** and **[AdvancedPhotoCapture.FinishAsync](/uwp/api/windows.media.capture.advancedphotocapture.FinishAsync)**. You can also call **[AdvancedPhotoCapture.CaptureAsync](/uwp/api/windows.media.capture.advancedphotocapture.CaptureAsync)** while video is recording. However, some **AdvancedPhotoCapture** scenarios, like capturing an HDR photo while recording video would cause some video frames to be altered by the HDR capture, resulting in a negative user experience. For this reason, the list of modes returned by the **[AdvancedPhotoControl.SupportedModes](/uwp/api/windows.media.devices.advancedphotocontrol.SupportedModes)** will be different while video is recording. You should check this value immediately after starting or stopping video recording to ensure that the desired mode is supported in the current video recording state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets the current advanced capture mode of the [AdvancedPhotoControl](advancedphotocontrol.md).
     * @remarks
     * Set the advanced capture mode of the [AdvancedPhotoControl](advancedphotocontrol.md) by calling the [Configure](advancedphotocontrol_configure_232907878.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocontrol.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        if (!this.HasProp("__IAdvancedPhotoControl")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoControl := IAdvancedPhotoControl(outPtr)
        }

        return this.__IAdvancedPhotoControl.get_Supported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__IAdvancedPhotoControl")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoControl := IAdvancedPhotoControl(outPtr)
        }

        return this.__IAdvancedPhotoControl.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IAdvancedPhotoControl")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoControl := IAdvancedPhotoControl(outPtr)
        }

        return this.__IAdvancedPhotoControl.get_Mode()
    }

    /**
     * Configures the [AdvancedPhotoControl](advancedphotocontrol.md) object with the specified settings.
     * @param {AdvancedPhotoCaptureSettings} settings The object defining the configuration settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocontrol.configure
     */
    Configure(settings) {
        if (!this.HasProp("__IAdvancedPhotoControl")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoControl := IAdvancedPhotoControl(outPtr)
        }

        return this.__IAdvancedPhotoControl.Configure(settings)
    }

;@endregion Instance Methods
}
