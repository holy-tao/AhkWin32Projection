#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoDeviceController.ahk
#Include .\IMediaDeviceController.ahk
#Include .\IAdvancedVideoCaptureDeviceController.ahk
#Include .\IAdvancedVideoCaptureDeviceController2.ahk
#Include .\IAdvancedVideoCaptureDeviceController3.ahk
#Include .\IAdvancedVideoCaptureDeviceController4.ahk
#Include .\IAdvancedVideoCaptureDeviceController5.ahk
#Include .\IAdvancedVideoCaptureDeviceController6.ahk
#Include .\IAdvancedVideoCaptureDeviceController7.ahk
#Include .\IAdvancedVideoCaptureDeviceController8.ahk
#Include .\IAdvancedVideoCaptureDeviceController9.ahk
#Include .\IAdvancedVideoCaptureDeviceController10.ahk
#Include .\IAdvancedVideoCaptureDeviceController11.ahk
#Include ..\..\..\Guid.ahk

/**
 * Controls device settings on the camera.
  * <!--Note: In the method descriptions, I took the units from the documentation for PROPSETID_VIDCAP_VIDEOPROCAMP and PROPSETID_VIDCAP_CAMERACONTROL. As far as I can tell, the WinRT layer does no conversion of the values.-->
 * @remarks
 * To get an instance of this object, retrieve the [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md) property.
 * 
 * Some drivers may require that the camera device preview to be in a running state before it can determine which controls are supported by the [VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md). If you check whether a certain control is supported by the [VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md) before the preview stream is running, the control may be described as unsupported even though it is supported by the video device.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class VideoDeviceController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoDeviceController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoDeviceController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the brightness level on the camera.
     * @remarks
     * For NTSC sources, brightness is expressed in IRE units multiplied by 100. For non-NTSC sources, the units are arbitrary, with 0 representing blanking and 10000 representing pure white.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.brightness
     * @type {MediaDeviceControl} 
     */
    Brightness {
        get => this.get_Brightness()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the contrast level on the camera.
     * @remarks
     * Contrast is specified as a gain factor multiplied by 100.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.contrast
     * @type {MediaDeviceControl} 
     */
    Contrast {
        get => this.get_Contrast()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's hue setting.
     * @remarks
     * Hue is specified in degrees multiplied by 100.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.hue
     * @type {MediaDeviceControl} 
     */
    Hue {
        get => this.get_Hue()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the white balance on the camera.
     * @remarks
     * White balance is specified as a color temperature in degrees Kelvin.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.whitebalance
     * @type {MediaDeviceControl} 
     */
    WhiteBalance {
        get => this.get_WhiteBalance()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the whether back-light compensation is enabled on the camera.
     * @remarks
     * If the value is 1, back-light compensation is enabled. If the value is 0, back-light compensation is disabled.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.backlightcompensation
     * @type {MediaDeviceControl} 
     */
    BacklightCompensation {
        get => this.get_BacklightCompensation()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's pan setting.
     * @remarks
     * Pan is rotation around the base of the camera (the camera's Y axis). Pan is specified in degrees.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.pan
     * @type {MediaDeviceControl} 
     */
    Pan {
        get => this.get_Pan()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's tilt setting.
     * @remarks
     * Tilt points the camera's imaging plane up or down. Tilt is specified in degrees.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.tilt
     * @type {MediaDeviceControl} 
     */
    Tilt {
        get => this.get_Tilt()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's zoom setting.
     * @remarks
     * Zoom is specified in millimeters.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.zoom
     * @type {MediaDeviceControl} 
     */
    Zoom {
        get => this.get_Zoom()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's roll setting.
     * @remarks
     * Roll is rotation around the camera's image-viewing axis. Roll is specified in degrees.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.roll
     * @type {MediaDeviceControl} 
     */
    Roll {
        get => this.get_Roll()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's exposure time.
     * @remarks
     * Exposure is specified in log base 2 seconds. For values less than zero, the exposure time is 1/(2<sup>n</sup>) seconds. For values of zero and above, the exposure time is 2<sup>n</sup> seconds.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.exposure
     * @type {MediaDeviceControl} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * Gets a [MediaDeviceControl](mediadevicecontrol.md) object that can be used to get or set the camera's focus setting.
     * @remarks
     * Focus is specified in millimeters.
     * 
     * For more information on getting or setting this value, see [MediaDeviceControl](mediadevicecontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.focus
     * @type {MediaDeviceControl} 
     */
    Focus {
        get => this.get_Focus()
    }

    /**
     * Gets the low shutter lag photo sequence control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.lowlagphotosequence
     * @type {LowLagPhotoSequenceControl} 
     */
    LowLagPhotoSequence {
        get => this.get_LowLagPhotoSequence()
    }

    /**
     * Gets the low shutter lag photo control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.lowlagphoto
     * @type {LowLagPhotoControl} 
     */
    LowLagPhoto {
        get => this.get_LowLagPhoto()
    }

    /**
     * Gets the scene mode control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.scenemodecontrol
     * @type {SceneModeControl} 
     */
    SceneModeControl {
        get => this.get_SceneModeControl()
    }

    /**
     * Gets the torch control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.torchcontrol
     * @type {TorchControl} 
     */
    TorchControl {
        get => this.get_TorchControl()
    }

    /**
     * Gets the flash control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.flashcontrol
     * @type {FlashControl} 
     */
    FlashControl {
        get => this.get_FlashControl()
    }

    /**
     * Gets the white balance control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.whitebalancecontrol
     * @type {WhiteBalanceControl} 
     */
    WhiteBalanceControl {
        get => this.get_WhiteBalanceControl()
    }

    /**
     * Gets the exposure control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.exposurecontrol
     * @type {ExposureControl} 
     */
    ExposureControl {
        get => this.get_ExposureControl()
    }

    /**
     * Gets the focus control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.focuscontrol
     * @type {FocusControl} 
     */
    FocusControl {
        get => this.get_FocusControl()
    }

    /**
     * Gets the exposure compensation control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.exposurecompensationcontrol
     * @type {ExposureCompensationControl} 
     */
    ExposureCompensationControl {
        get => this.get_ExposureCompensationControl()
    }

    /**
     * Gets the ISO film speed control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.isospeedcontrol
     * @type {IsoSpeedControl} 
     */
    IsoSpeedControl {
        get => this.get_IsoSpeedControl()
    }

    /**
     * Gets the regions of interest control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.regionsofinterestcontrol
     * @type {RegionsOfInterestControl} 
     */
    RegionsOfInterestControl {
        get => this.get_RegionsOfInterestControl()
    }

    /**
     * Gets or sets the primary use for the device.
     * @remarks
     * This property enables device to make optimization based on the intended use for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.primaryuse
     * @type {Integer} 
     */
    PrimaryUse {
        get => this.get_PrimaryUse()
        set => this.put_PrimaryUse(value)
    }

    /**
     * Gets the VariablePhotoSequenceController associated with the [VideoDeviceController](videodevicecontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.variablephotosequencecontroller
     * @type {VariablePhotoSequenceController} 
     */
    VariablePhotoSequenceController {
        get => this.get_VariablePhotoSequenceController()
    }

    /**
     * Gets the photo confirmation control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.photoconfirmationcontrol
     * @type {PhotoConfirmationControl} 
     */
    PhotoConfirmationControl {
        get => this.get_PhotoConfirmationControl()
    }

    /**
     * Gets the [ZoomControl](zoomcontrol.md) associated with the [VideoDeviceController](videodevicecontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.zoomcontrol
     * @type {ZoomControl} 
     */
    ZoomControl {
        get => this.get_ZoomControl()
    }

    /**
     * Gets the [ExposurePriorityVideoControl](exposurepriorityvideocontrol.md) associated with the [VideoDeviceController](videodevicecontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.exposurepriorityvideocontrol
     * @type {ExposurePriorityVideoControl} 
     */
    ExposurePriorityVideoControl {
        get => this.get_ExposurePriorityVideoControl()
    }

    /**
     * Gets or sets a value that indicates the optimizations the capture device should use to prioritize high quality picture, low latency, or low power consumption during video capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.desiredoptimization
     * @type {Integer} 
     */
    DesiredOptimization {
        get => this.get_DesiredOptimization()
        set => this.put_DesiredOptimization(value)
    }

    /**
     * Gets the [HdrVideoControl](hdrvideocontrol.md) associated with the [VideoDeviceController](videodevicecontroller.md). This allows you to enable and disable High Dynamic Range (HDR) video capture mode on devices that support it.
     * @remarks
     * For how-to guidance and sample code for using HDR video capture, see [Manual camera controls for video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-video-capture).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.hdrvideocontrol
     * @type {HdrVideoControl} 
     */
    HdrVideoControl {
        get => this.get_HdrVideoControl()
    }

    /**
     * Gets the [OpticalImageStabilizationControl](opticalimagestabilizationcontrol.md) associated with the [VideoDeviceController](videodevicecontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.opticalimagestabilizationcontrol
     * @type {OpticalImageStabilizationControl} 
     */
    OpticalImageStabilizationControl {
        get => this.get_OpticalImageStabilizationControl()
    }

    /**
     * Gets the advanced photo capture control for this video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.advancedphotocontrol
     * @type {AdvancedPhotoControl} 
     */
    AdvancedPhotoControl {
        get => this.get_AdvancedPhotoControl()
    }

    /**
     * Gets a string containing the identifier for the video device controller.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the [VideoTemporalDenoisingControl](videotemporaldenoisingcontrol.md) associated with the [VideoDeviceController](videodevicecontroller.md). This allows you to enable and disable temporal denoising, which uses image data from adjacent frames to reduce the appearance of noise in captured video, on devices that support it.
     * @remarks
     * Temporal denoising can improve the visual quality of video to the human eye, but it also can reduce image consistency and details which can negatively impact the performance of registration, optical character recognition, and other computer vision tasks. This control allows you to enable and disable the feature depending on your app's current video capture scenario.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.videotemporaldenoisingcontrol
     * @type {VideoTemporalDenoisingControl} 
     */
    VideoTemporalDenoisingControl {
        get => this.get_VideoTemporalDenoisingControl()
    }

    /**
     * Gets the infrared torch control for selected video device.
     * @remarks
     * Use [InfraredTorchControl.IsSupported](infraredtorchcontrol_issupported.md) property to determine is this control actually supported by selected video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.infraredtorchcontrol
     * @type {InfraredTorchControl} 
     */
    InfraredTorchControl {
        get => this.get_InfraredTorchControl()
    }

    /**
     * Gets the [PanelBasedOptimizationControl](panelbasedoptimizationcontrol.md) that, when supported, allows an app to enable the capture device driver to optimize camera capture functionality based on the panel location of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.panelbasedoptimizationcontrol
     * @type {PanelBasedOptimizationControl} 
     */
    PanelBasedOptimizationControl {
        get => this.get_PanelBasedOptimizationControl()
    }

    /**
     * Gets a [DigitalWindowControl](digitalwindowcontrol.md) that allows apps to capture a subregion of the capture device's sensor.
     * @remarks
     * Determine if the controls is supported by the capture device by checking [DigitalWindowControl.IsSupported](digitalwindowcontrol_issupported.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.digitalwindowcontrol
     * @type {DigitalWindowControl} 
     */
    DigitalWindowControl {
        get => this.get_DigitalWindowControl()
    }

    /**
     * Gets a [CameraOcclusionInfo](videodevicecontroller_cameraocclusioninfo.md) object that can be used to get the current occlusion state of a camera and receive notifications when the occlusion state changes.
     * @remarks
     * You should only use the shutter state data obtained through this property while the camera is actively streaming. Apps should respond in a logical manner when they detect that the shutter is closed. This should include an in-app message to open the shutter. Applications must not automatically take an action (e.g., turning the camera off) or block the user from doing an action (e.g., turning on the camera) based on the shutter state, as not every camera will reliably report the shutter state when not streaming. Applications must not treat the reported shutter state as an absolute privacy indicator – it is only a notification that the camera believes the shutter is closed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.cameraocclusioninfo
     * @type {CameraOcclusionInfo} 
     */
    CameraOcclusionInfo {
        get => this.get_CameraOcclusionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Brightness() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Brightness()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Contrast() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Contrast()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Hue() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Hue()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_WhiteBalance() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_WhiteBalance()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_BacklightCompensation() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_BacklightCompensation()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Pan() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Pan()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Tilt() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Tilt()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Zoom() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Zoom()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Roll() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Roll()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Exposure() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Exposure()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Focus() {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.get_Focus()
    }

    /**
     * Sets the local power line frequency.
     * @remarks
     * You can use this method if the camera supports anti-flicker processing for fluorescent lights.
     * 
     * For how-to guidance for handling powerline frequency, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
     * @param {Integer} value The power line frequency.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.trysetpowerlinefrequency
     */
    TrySetPowerlineFrequency(value) {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.TrySetPowerlineFrequency(value)
    }

    /**
     * Gets the local power line frequency.
     * @remarks
     * You can use this method if the camera supports anti-flicker processing for fluorescent lights.
     * 
     * For how-to guidance for handling powerline frequency, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
     * @param {Pointer<Int32>} value The power line frequency.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.trygetpowerlinefrequency
     */
    TryGetPowerlineFrequency(value) {
        if (!this.HasProp("__IVideoDeviceController")) {
            if ((queryResult := this.QueryInterface(IVideoDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoDeviceController := IVideoDeviceController(outPtr)
        }

        return this.__IVideoDeviceController.TryGetPowerlineFrequency(value)
    }

    /**
     * Gets a list of the supported encoding properties for the video device.
     * @remarks
     * The encoding properties returned from this method can either be of type [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) or [ImageEncodingProperties](../windows.media.mediaproperties/imageencodingproperties.md), regardless of the stream type you specify. For this reason, you must check the type of each returned [IMediaEncodingProperties](../windows.media.mediaproperties/imediaencodingproperties.md) object and cast to the appropriate type before accessing the properties of the object. The article [Set media encoding properties for MediaCapture](/windows/uwp/audio-video-camera/set-media-encoding-properties) provides the complete code for a helper class that handles all necessary type-checking and casting for you.
     * @param {Integer} mediaStreamType_ The type of media stream for which to get the properties.
     * @returns {IVectorView<IMediaEncodingProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.getavailablemediastreamproperties
     */
    GetAvailableMediaStreamProperties(mediaStreamType_) {
        if (!this.HasProp("__IMediaDeviceController")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceController := IMediaDeviceController(outPtr)
        }

        return this.__IMediaDeviceController.GetAvailableMediaStreamProperties(mediaStreamType_)
    }

    /**
     * Gets the encoding properties for the specified media stream type for the video device.
     * @remarks
     * The encoding properties returned from this method can either be of type [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) or [ImageEncodingProperties](../windows.media.mediaproperties/imageencodingproperties.md), regardless of the stream type you specify. For this reason, you must check the type of each returned [IMediaEncodingProperties](../windows.media.mediaproperties/imediaencodingproperties.md) object and cast to the appropriate type before accessing the properties of the object. The article [Set media encoding properties for MediaCapture](/windows/uwp/audio-video-camera/set-media-encoding-properties) provides the complete code for a helper class that handles all necessary type-checking and casting for you.
     * @param {Integer} mediaStreamType_ The type of media stream for which to get the properties.
     * @returns {IMediaEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.getmediastreamproperties
     */
    GetMediaStreamProperties(mediaStreamType_) {
        if (!this.HasProp("__IMediaDeviceController")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceController := IMediaDeviceController(outPtr)
        }

        return this.__IMediaDeviceController.GetMediaStreamProperties(mediaStreamType_)
    }

    /**
     * Sets the encoding properties asynchronously for the specified media stream type for the video device.
     * @remarks
     * This method sets the properties on the media source, which is the video capture device. This is unlike [MediaCapture.SetEncodingPropertiesAsync](../windows.media.capture/mediacapture_setencodingpropertiesasync_1218555455.md), which changes the properties of the media encoding. For this reason, with **SetMediaStreamPropertiesAsync** you can only set properties and values that are supported natively by the capture device. Get a list of a capture device's supported resolutions, frame rates, and other properties by calling [GetAvailableMediaStreamProperties](videodevicecontroller_getavailablemediastreamproperties_946867392.md). The benefit of setting the capture device properties instead of the media encoding is that the device only needs to generate enough data for the specified resolution, which can provide better performance than capturing at a high resolution and then downscaling at another point in the media capture pipeline. For more information, see [Set format, resolution, and frame rate for MediaCapture](/windows/uwp/audio-video-camera/set-media-encoding-properties) and the [Camera Resolution Sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/CameraResolution).
     * @param {Integer} mediaStreamType_ The type of media stream for which to set the properties.
     * @param {IMediaEncodingProperties} mediaEncodingProperties The encoding properties to set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.setmediastreampropertiesasync
     */
    SetMediaStreamPropertiesAsync(mediaStreamType_, mediaEncodingProperties) {
        if (!this.HasProp("__IMediaDeviceController")) {
            if ((queryResult := this.QueryInterface(IMediaDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaDeviceController := IMediaDeviceController(outPtr)
        }

        return this.__IMediaDeviceController.SetMediaStreamPropertiesAsync(mediaStreamType_, mediaEncodingProperties)
    }

    /**
     * Sets the value of the property with the specified ID on the capture device driver. You can use this method to set properties that are specific to a particular camera.
     * @remarks
     * The property ID and expected data are determined by the hardware device manufacturer.
     * 
     * Common device properties are exposed as properties of the [VideoDeviceController](videodevicecontroller.md) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {HSTRING} propertyId The identifier of the property for which the value is set.
     * @param {IInspectable} propertyValue_ The new value of the property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.setdeviceproperty
     */
    SetDeviceProperty(propertyId, propertyValue_) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController := IAdvancedVideoCaptureDeviceController(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController.SetDeviceProperty(propertyId, propertyValue_)
    }

    /**
     * Gets the value of the property with the specified ID from the capture device driver. You can use this method to query properties that are specific to a particular camera.
     * @remarks
     * Common device properties are exposed as properties of the [VideoDeviceController](videodevicecontroller.md) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {HSTRING} propertyId The identifier of the property for which the value is retrieved.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.getdeviceproperty
     */
    GetDeviceProperty(propertyId) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController := IAdvancedVideoCaptureDeviceController(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController.GetDeviceProperty(propertyId)
    }

    /**
     * 
     * @returns {LowLagPhotoSequenceControl} 
     */
    get_LowLagPhotoSequence() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_LowLagPhotoSequence()
    }

    /**
     * 
     * @returns {LowLagPhotoControl} 
     */
    get_LowLagPhoto() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_LowLagPhoto()
    }

    /**
     * 
     * @returns {SceneModeControl} 
     */
    get_SceneModeControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_SceneModeControl()
    }

    /**
     * 
     * @returns {TorchControl} 
     */
    get_TorchControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_TorchControl()
    }

    /**
     * 
     * @returns {FlashControl} 
     */
    get_FlashControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_FlashControl()
    }

    /**
     * 
     * @returns {WhiteBalanceControl} 
     */
    get_WhiteBalanceControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_WhiteBalanceControl()
    }

    /**
     * 
     * @returns {ExposureControl} 
     */
    get_ExposureControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_ExposureControl()
    }

    /**
     * 
     * @returns {FocusControl} 
     */
    get_FocusControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_FocusControl()
    }

    /**
     * 
     * @returns {ExposureCompensationControl} 
     */
    get_ExposureCompensationControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_ExposureCompensationControl()
    }

    /**
     * 
     * @returns {IsoSpeedControl} 
     */
    get_IsoSpeedControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_IsoSpeedControl()
    }

    /**
     * 
     * @returns {RegionsOfInterestControl} 
     */
    get_RegionsOfInterestControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_RegionsOfInterestControl()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimaryUse() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.get_PrimaryUse()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrimaryUse(value) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController2 := IAdvancedVideoCaptureDeviceController2(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController2.put_PrimaryUse(value)
    }

    /**
     * 
     * @returns {VariablePhotoSequenceController} 
     */
    get_VariablePhotoSequenceController() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController3")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController3 := IAdvancedVideoCaptureDeviceController3(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController3.get_VariablePhotoSequenceController()
    }

    /**
     * 
     * @returns {PhotoConfirmationControl} 
     */
    get_PhotoConfirmationControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController3")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController3 := IAdvancedVideoCaptureDeviceController3(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController3.get_PhotoConfirmationControl()
    }

    /**
     * 
     * @returns {ZoomControl} 
     */
    get_ZoomControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController3")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController3 := IAdvancedVideoCaptureDeviceController3(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController3.get_ZoomControl()
    }

    /**
     * 
     * @returns {ExposurePriorityVideoControl} 
     */
    get_ExposurePriorityVideoControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController4")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController4 := IAdvancedVideoCaptureDeviceController4(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController4.get_ExposurePriorityVideoControl()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredOptimization() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController4")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController4 := IAdvancedVideoCaptureDeviceController4(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController4.get_DesiredOptimization()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredOptimization(value) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController4")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController4 := IAdvancedVideoCaptureDeviceController4(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController4.put_DesiredOptimization(value)
    }

    /**
     * 
     * @returns {HdrVideoControl} 
     */
    get_HdrVideoControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController4")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController4 := IAdvancedVideoCaptureDeviceController4(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController4.get_HdrVideoControl()
    }

    /**
     * 
     * @returns {OpticalImageStabilizationControl} 
     */
    get_OpticalImageStabilizationControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController4")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController4 := IAdvancedVideoCaptureDeviceController4(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController4.get_OpticalImageStabilizationControl()
    }

    /**
     * 
     * @returns {AdvancedPhotoControl} 
     */
    get_AdvancedPhotoControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController4")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController4 := IAdvancedVideoCaptureDeviceController4(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController4.get_AdvancedPhotoControl()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController5")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController5 := IAdvancedVideoCaptureDeviceController5(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController5.get_Id()
    }

    /**
     * Gets a the value of the property from the capture device driver with the ID with custom header information. You can use this method to query properties that are specific to a particular camera.
     * @remarks
     * Common device properties are exposed as properties of the [VideoDeviceController](videodevicecontroller.md) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {HSTRING} propertyId The identifier of the property for which the value is retrieved.
     * @param {IReference<Integer>} maxPropertyValueSize The size of the buffer that should be allocated to store the result of the operation. If the driver does not require that a size be specified for the returned property, set this value to null. If the size is required, and you do not provide a value, the [Status](videodevicecontrollergetdevicepropertyresult_status.md) property of the returned [VideoDeviceControllerGetDevicePropertyResult](videodevicecontrollergetdevicepropertyresult.md) object will be **MaxPropertyValueSizeRequired**. If the value supplied is too small to store the result of the operation, the returned **Status**  object will be **MaxPropertyValueSizeTooSmall**, which means that you can retry the call with a larger buffer size.
     * @returns {VideoDeviceControllerGetDevicePropertyResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.getdevicepropertybyid
     */
    GetDevicePropertyById(propertyId, maxPropertyValueSize) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController5")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController5 := IAdvancedVideoCaptureDeviceController5(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController5.GetDevicePropertyById(propertyId, maxPropertyValueSize)
    }

    /**
     * Sets the value of the property with the specified ID from the capture device driver, using an extended ID with custom header information and providing the value as an object.
     * @remarks
     * Common device properties are exposed as properties of the [VideoDeviceController](videodevicecontroller.md) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {HSTRING} propertyId A byte array containing the extended identifier data.
     * @param {IInspectable} propertyValue_ An object representing the data to be assigned to the specified property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.setdevicepropertybyid
     */
    SetDevicePropertyById(propertyId, propertyValue_) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController5")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController5 := IAdvancedVideoCaptureDeviceController5(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController5.SetDevicePropertyById(propertyId, propertyValue_)
    }

    /**
     * Gets the value of the property with the specified ID from the capture device driver, using an extended ID with custom header information and specifying the maximum buffer size required to store the result. You can use this method to query properties that are specific to a particular camera.
     * @remarks
     * Common device properties are exposed as properties of the [VideoDeviceController](videodevicecontroller.md) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId A byte array containing the extended identifier data.
     * @param {IReference<Integer>} maxPropertyValueSize The size of the buffer that should be allocated to store the result of the operation. If the driver does not require that a size be specified for the returned property, set this value to null. If the size is required, and you do not provide a value, the [Status](videodevicecontrollergetdevicepropertyresult_status.md) property of the returned [VideoDeviceControllerGetDevicePropertyResult](videodevicecontrollergetdevicepropertyresult.md) object will be **MaxPropertyValueSizeRequired**. If the value supplied is too small to store the result of the operation, the returned **Status**  object will be **MaxPropertyValueSizeTooSmall**, which means that you can retry the call with a larger buffer size.
     * @returns {VideoDeviceControllerGetDevicePropertyResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.getdevicepropertybyextendedid
     */
    GetDevicePropertyByExtendedId(extendedPropertyId_length, extendedPropertyId, maxPropertyValueSize) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController5")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController5 := IAdvancedVideoCaptureDeviceController5(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController5.GetDevicePropertyByExtendedId(extendedPropertyId_length, extendedPropertyId, maxPropertyValueSize)
    }

    /**
     * Sets the value of the property with the specified ID from the capture device driver, using an extended ID with custom header information and providing the value as a byte array.
     * @remarks
     * The property ID and expected data are determined by the hardware device manufacturer.
     * 
     * Common device properties are exposed as properties of the [VideoDeviceController](videodevicecontroller.md) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId A byte array containing the extended identifier data.
     * @param {Integer} propertyValue_length 
     * @param {Pointer<Integer>} propertyValue A byte array containing the data to be assigned to the specified property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.setdevicepropertybyextendedid
     */
    SetDevicePropertyByExtendedId(extendedPropertyId_length, extendedPropertyId, propertyValue_length, propertyValue) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController5")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController5 := IAdvancedVideoCaptureDeviceController5(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController5.SetDevicePropertyByExtendedId(extendedPropertyId_length, extendedPropertyId, propertyValue_length, propertyValue)
    }

    /**
     * 
     * @returns {VideoTemporalDenoisingControl} 
     */
    get_VideoTemporalDenoisingControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController6")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController6 := IAdvancedVideoCaptureDeviceController6(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController6.get_VideoTemporalDenoisingControl()
    }

    /**
     * 
     * @returns {InfraredTorchControl} 
     */
    get_InfraredTorchControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController7")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController7 := IAdvancedVideoCaptureDeviceController7(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController7.get_InfraredTorchControl()
    }

    /**
     * 
     * @returns {PanelBasedOptimizationControl} 
     */
    get_PanelBasedOptimizationControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController8")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController8 := IAdvancedVideoCaptureDeviceController8(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController8.get_PanelBasedOptimizationControl()
    }

    /**
     * 
     * @returns {DigitalWindowControl} 
     */
    get_DigitalWindowControl() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController9")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController9 := IAdvancedVideoCaptureDeviceController9(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController9.get_DigitalWindowControl()
    }

    /**
     * 
     * @returns {CameraOcclusionInfo} 
     */
    get_CameraOcclusionInfo() {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController10")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController10.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController10 := IAdvancedVideoCaptureDeviceController10(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController10.get_CameraOcclusionInfo()
    }

    /**
     * Requests exclusive control of the camera with the specified device ID.
     * @param {HSTRING} deviceId The device ID of the camera for which exclusive control is requested. The device ID can be obtained with the [DeviceInformation](/uwp/api/windows.devices.enumeration.deviceinformation) class.
     * @param {Integer} mode_ A value from the [MediaCaptureDeviceExclusiveControlReleaseMode](/uwp/api/windows.media.capture.mediacapturedeviceexclusivecontrolreleasemode) enumeration specifying the conditions under which exclusive control is released.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontroller.tryacquireexclusivecontrol
     */
    TryAcquireExclusiveControl(deviceId, mode_) {
        if (!this.HasProp("__IAdvancedVideoCaptureDeviceController11")) {
            if ((queryResult := this.QueryInterface(IAdvancedVideoCaptureDeviceController11.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedVideoCaptureDeviceController11 := IAdvancedVideoCaptureDeviceController11(outPtr)
        }

        return this.__IAdvancedVideoCaptureDeviceController11.TryAcquireExclusiveControl(deviceId, mode_)
    }

;@endregion Instance Methods
}
