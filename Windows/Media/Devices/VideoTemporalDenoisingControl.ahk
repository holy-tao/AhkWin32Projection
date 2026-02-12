#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoTemporalDenoisingControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * When supported, allows an app to enable temporal denoising for video capture.
 * @remarks
 * Temporal denoising can improve the visual quality of video to the human eye, but it also can reduce image consistency and details which can negatively impact the performance of registration, optical character recognition, and other computer vision tasks. This control allows you to enable and disable the feature depending on your app's current video capture scenario.
 * 
 * Get an instance of this class by accessing the VideoDeviceController.VideoTemporalDenoisingControl property. 
 * 
 * For how-to guidance for using manual video capture controls, see [Manual camera controls for video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videotemporaldenoisingcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class VideoTemporalDenoisingControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoTemporalDenoisingControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoTemporalDenoisingControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the [VideoTemporalDenoisingControl](videotemporaldenoisingcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videotemporaldenoisingcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the list of [VideoTemporalDenoisingMode](videotemporaldenoisingmode.md) values indicating the modes supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videotemporaldenoisingcontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets or sets a value indicating the current video temporal denoising mode of the capture device.
     * @remarks
     * The **Mode** property can be safely changed while capturing is in progress.
     * 
     * Temporal denoising can improve the visual quality of video to the human eye, but it also can reduce image consistency and details which can negatively impact the performance of registration, optical character recognition, and other computer vision tasks. You may want to enable and disable the feature depending on your app's current video capture scenario.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videotemporaldenoisingcontrol.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
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
        if (!this.HasProp("__IVideoTemporalDenoisingControl")) {
            if ((queryResult := this.QueryInterface(IVideoTemporalDenoisingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTemporalDenoisingControl := IVideoTemporalDenoisingControl(outPtr)
        }

        return this.__IVideoTemporalDenoisingControl.get_Supported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__IVideoTemporalDenoisingControl")) {
            if ((queryResult := this.QueryInterface(IVideoTemporalDenoisingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTemporalDenoisingControl := IVideoTemporalDenoisingControl(outPtr)
        }

        return this.__IVideoTemporalDenoisingControl.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IVideoTemporalDenoisingControl")) {
            if ((queryResult := this.QueryInterface(IVideoTemporalDenoisingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTemporalDenoisingControl := IVideoTemporalDenoisingControl(outPtr)
        }

        return this.__IVideoTemporalDenoisingControl.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IVideoTemporalDenoisingControl")) {
            if ((queryResult := this.QueryInterface(IVideoTemporalDenoisingControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTemporalDenoisingControl := IVideoTemporalDenoisingControl(outPtr)
        }

        return this.__IVideoTemporalDenoisingControl.put_Mode(value)
    }

;@endregion Instance Methods
}
