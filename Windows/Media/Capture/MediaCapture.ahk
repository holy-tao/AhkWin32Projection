#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCapture.ahk
#Include .\IMediaCaptureVideoPreview.ahk
#Include .\IMediaCapture2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMediaCapture3.ahk
#Include .\IMediaCapture4.ahk
#Include .\IMediaCapture5.ahk
#Include .\IMediaCapture6.ahk
#Include .\IMediaCapture7.ahk
#Include .\IMediaCaptureStatics.ahk
#Include .\MediaCaptureFailedEventHandler.ahk
#Include .\MediaCapture.ahk
#Include .\MediaCaptureFailedEventArgs.ahk
#Include .\RecordLimitationExceededEventHandler.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaCaptureFocusChangedEventArgs.ahk
#Include .\PhotoConfirmationCapturedEventArgs.ahk
#Include .\MediaCaptureDeviceExclusiveControlStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides functionality for capturing photos, audio, and videos from a capture device, such as a webcam.
 * @remarks
 * The MediaCapture class is used to capture audio, video, and images from a camera. For how-to guidance for displaying the camera preview, see [Show the camera preview in a WinUI 3 app](/windows/apps/develop/camera/camera-quickstart-winui3). To quickly get started capturing photos, audio, or video, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
 * 
 * The [Camera](/windows/uwp/audio-video-camera/camera) page is the main hub for how-to guidance for using **MediaCapture** in your app. In addition to the basic camera tasks, this page links to how-to articles for advanced scenarios including:
 * 
 * + Using the hardware camera button on devices that have one
 * + Handling device and screen orientation
 * + Using camera profiles to determine device capabilities
 * + Setting the format, resolution, and frame rate of captured video
 * + Using [AdvancedPhotoCapture](advancedphotocapture.md) to capture HDR or low-light photos
 * + Using the [VideoDeviceController](../windows.media.devices/videodevicecontroller.md) to access manual camera controls like exposure, white balance, auto-focus, and flash
 * + Using effects while capturing video
 * + Capturing photo sequences
 * + Using [MediaFrameReader](../windows.media.capture.frames/mediaframereader.md) to get a stream of frames from one or more cameras, including rgb, infrared, and depth cameras
 * + Getting a frame from the preview stream
 * 
 * The [Camera](/windows/uwp/audio-video-camera/camera) article also links to all of the UWP SDK samples for camera, such as the [Camera starter kit](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/CameraStarterKit?amp;clcid=0x409) sample.
 * 
 * The [InitializeAsync](mediacapture_initializeasync_315323248.md) method, which initializes the **MediaCapture** object, must be called before you can start previewing or capturing from the device. In C# or C++ apps, the first use of the **MediaCapture** object to call **InitializeAsync** should be on the STA thread. Calls from an MTA thread may result in undefined behavior. [InitializeAsync](mediacapture_initializeasync_315323248.md) will launch a consent prompt to get the user's permission for the app to access the microphone or camera. **InitializeAsync** should be called from the main UI thread of your app. Apps must handle app suspension or termination by properly cleaning up media capture resources. For information on shutting down the **MediaCapture** object properly, see [Basic photo, video, and audio capture with MediaCapture](/windows/uwp/audio-video-camera/basic-photo-video-and-audio-capture-with-mediacapture).
 * 
 * > On Windows, music and media capture apps should monitor the [SystemMediaTransportControls.SoundLevel](../windows.media/systemmediatransportcontrols_soundlevel.md) to determine whether the audio streams on the app have been [Muted](../windows.media/soundlevel.md). For apps using the MediaCapture object, capture will be automatically stopped when the capture streams of the app are muted. Capture is not re-started automatically when the audio streams are unmuted, so the [SoundLevel](../windows.media/systemmediatransportcontrols_soundlevel.md) changed notification can be used to restart capture. Use the [SystemMediaTransportControls.PropertyChanged](../windows.media/systemmediatransportcontrols_propertychanged.md) event to determine when the [SoundLevel](../windows.media/systemmediatransportcontrols_soundlevel.md) property changes.
 * 
 * > For Windows Phone 8.x apps, music and media apps should clean up the MediaCapture object and associated resources in the [Suspending](../windows.applicationmodel.core/coreapplication_suspending.md) event handler and recreate them in the [Resuming](../windows.applicationmodel.core/coreapplication_resuming.md) event handler.
 * 
 * In Windows 8.1 audio only apps, if the [MediaCategory](mediacapturesettings_mediacategory.md) setting is [Other](mediacategory.md), then high latency mode is used. For low latency, set the [MediaCategory](mediacapturesettings_mediacategory.md) setting to [Communications](mediacategory.md).
 * 
 * Adding an in-place editing Media Foundation Transform effect into the capture preview will have no effect on the stream.
 * 
 * Windows 8 UWP apps that have declared both the webcam and microphone capabilities will not function in Windows 8.1 if the user has not enabled both the webcam and microphone privacy settings.
 * 
 * MediaCapture only supports one pass CBR encoding.
 * 
 * **Notes on JPEG:** JPEG types are passthrough only. To capture an image, the image encoding profile can be set to Auto or you need to specify an encoding profile that matches the native type. To add an effect, you need to switch to an uncompressed video native media type, such as NV12 or RGB32.
 * 
 * **Notes on H.264:** If the native type is H.264, you can record using a video media type with type identical to the native type. You cannot add an effect to an H.264 native type stream. To capture video, the image encoding profile can be set to Auto or you need to specify an encoding profile that matches the native type.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCapture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCapture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCapture.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a boolean value indicating whether video profiles are supported by the specified video capture device.
     * @param {HSTRING} videoDeviceId The identifier of the video device for which supported video profile support is queried. For information on getting the video device ID, see [DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.isvideoprofilesupported
     */
    static IsVideoProfileSupported(videoDeviceId) {
        if (!MediaCapture.HasProp("__IMediaCaptureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.MediaCapture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaCaptureStatics.IID)
            MediaCapture.__IMediaCaptureStatics := IMediaCaptureStatics(factoryPtr)
        }

        return MediaCapture.__IMediaCaptureStatics.IsVideoProfileSupported(videoDeviceId)
    }

    /**
     * Retrieves the list of all video profiles supported by the specified video capture device.
     * @remarks
     * Before calling this method, call [IsVideoProfileSupported](mediacapture_isvideoprofilesupported_190014579.md) to make sure that the capture device supports video profiles.
     * 
     * Use [FindKnownVideoProfiles](mediacapture_findknownvideoprofiles_875917242.md) to request profiles with specific functionality using one of the [KnownVideoProfile](knownvideoprofile.md) values.
     * 
     * For how-to guidance for working with camera profiles, see [Discover and select camera capabilities with camera profiles](/windows/apps/develop/camera/camera-profiles).
     * @param {HSTRING} videoDeviceId The identifier of the video device for which supported video profiles are queried. For information on getting the video device ID, see [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md).
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.findallvideoprofiles
     */
    static FindAllVideoProfiles(videoDeviceId) {
        if (!MediaCapture.HasProp("__IMediaCaptureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.MediaCapture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaCaptureStatics.IID)
            MediaCapture.__IMediaCaptureStatics := IMediaCaptureStatics(factoryPtr)
        }

        return MediaCapture.__IMediaCaptureStatics.FindAllVideoProfiles(videoDeviceId)
    }

    /**
     * Retrieves the list of video profiles supported by the specified video capture device that can be used while another profile is used on a different capture device.
     * @remarks
     * Before calling this method, call [IsVideoProfileSupported](mediacapture_isvideoprofilesupported_190014579.md) to make sure that the capture device supports video profiles.
     * 
     * This method supports the scenario where you capture video from two capture devices at the same time, such as a device's front camera and rear camera. Call the [GetConcurrency](mediacapturevideoprofile_getconcurrency_2045494455.md) method of one of the [MediaCaptureVideoProfile](mediacapturevideoprofile.md) objects in the returned list to get a list of profiles that can be used concurrently with that profile.
     * 
     * For how-to guidance for working with camera profiles, see [Discover and select camera capabilities with camera profiles](/windows/apps/develop/camera/camera-profiles).
     * @param {HSTRING} videoDeviceId The identifier of the video device for which supported video profiles are queried. For information on getting the video device ID, see [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md).
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.findconcurrentprofiles
     */
    static FindConcurrentProfiles(videoDeviceId) {
        if (!MediaCapture.HasProp("__IMediaCaptureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.MediaCapture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaCaptureStatics.IID)
            MediaCapture.__IMediaCaptureStatics := IMediaCaptureStatics(factoryPtr)
        }

        return MediaCapture.__IMediaCaptureStatics.FindConcurrentProfiles(videoDeviceId)
    }

    /**
     * Retrieves the list of all video profiles supported by the specified video capture device that match the specified [KnownVideoProfile](knownvideoprofile.md) value.
     * @remarks
     * Before calling this method, call [IsVideoProfileSupported](mediacapture_isvideoprofilesupported_190014579.md) to make sure that the capture device supports video profiles.
     * 
     * This method allows you to request profiles with specific functionality by using one of the [KnownVideoProfile](knownvideoprofile.md) values. Some hardware may support additional profiles that do not correspond to any of the known profile names. Use [FindAllVideoProfiles](mediacapture_findallvideoprofiles_690787568.md) to retrieve all video profiles supported by the video capture device.
     * 
     * For how-to guidance for working with camera profiles, see [Discover and select camera capabilities with camera profiles](/windows/apps/develop/camera/camera-profiles).
     * @param {HSTRING} videoDeviceId The identifier of the video device for which supported video profiles are queried. For information on getting the video device ID, see [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md).
     * @param {Integer} name A value specifying one of the profile names known by the system.
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.findknownvideoprofiles
     */
    static FindKnownVideoProfiles(videoDeviceId, name) {
        if (!MediaCapture.HasProp("__IMediaCaptureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.MediaCapture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaCaptureStatics.IID)
            MediaCapture.__IMediaCaptureStatics := IMediaCaptureStatics(factoryPtr)
        }

        return MediaCapture.__IMediaCaptureStatics.FindKnownVideoProfiles(videoDeviceId, name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the configuration settings for the [MediaCapture](mediacapture.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.mediacapturesettings
     * @type {MediaCaptureSettings} 
     */
    MediaCaptureSettings {
        get => this.get_MediaCaptureSettings()
    }

    /**
     * Gets an object that controls settings for the microphone.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.audiodevicecontroller
     * @type {AudioDeviceController} 
     */
    AudioDeviceController {
        get => this.get_AudioDeviceController()
    }

    /**
     * Gets an object that controls settings for the video camera.
     * @remarks
     * Some drivers may require that the camera device preview to be in a running state before it can determine which controls are supported by the VideoDeviceController. If you check whether a certain control is supported by the VideoDeviceController before the preview stream is running, the control may be described as unsupported even though it is supported by the video device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.videodevicecontroller
     * @type {VideoDeviceController} 
     */
    VideoDeviceController {
        get => this.get_VideoDeviceController()
    }

    /**
     * Gets the current stream state of the camera stream.
     * @remarks
     * The state of the camera stream will change when recording is paused or resumed, when the system drops frames for privacy reasons, or when the camera stream is lost. To be notified when the camera stream state changes, handle the [CameraStreamStateChanged](mediacapture_camerastreamstatechanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.camerastreamstate
     * @type {Integer} 
     */
    CameraStreamState {
        get => this.get_CameraStreamState()
    }

    /**
     * Gets a value that indicates the current thermal status of the capture device.
     * @remarks
     * Media capture scenarios that are extremely processor-intensive, such as high-resolution, high-frame rate, and real-time image processing can cause the capture hardware to overheat. On devices where the camera driver supports reporting of thermal status, you can check the **ThermalStatus** property to get the current thermal status of the capture device. You can also subscribe to the [ThermalStatusChanged](mediacapture_thermalstatuschanged.md) event to receive a notification when the thermal status changes. If the thermal status is [Overheated](mediacapturethermalstatus.md) , you should stop the current capture session and save any captured media. Once the thermal status has returned to normal, you can begin capturing again.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.thermalstatus
     * @type {Integer} 
     */
    ThermalStatus {
        get => this.get_ThermalStatus()
    }

    /**
     * Gets a read-only dictionary of [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) objects that can be used simultaneously to acquire media frames.
     * @remarks
     * Initialize a [MediaCapture](mediacapturememorypreference.md) object to use media frame sources by setting the [SourceGroup](mediacaptureinitializationsettings_sourcegroup.md) property of the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object to a [MediaFrameSourceGroup](../windows.media.capture.frames/mediaframesourcegroup.md) returned by [FindAllAsync](../windows.media.capture.frames/mediaframesourcegroup_findallasync_326280522.md) and then calling [MediaCapture.InitializeAsync](mediacapture_initializeasync_315323248.md). The key for each entry in the dictionary is the [Id](../windows.media.capture.frames/mediaframesourceinfo_id.md) property of the [MediaFrameSourceInfo](../windows.media.capture.frames/mediaframesourceinfo.md) associated with each frame source in the group.
     * 
     * For more information on using frame sources, see [Process media frames with MediaFrameReader](/windows/apps/develop/camera/process-media-frames-with-mediaframereader).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.framesources
     * @type {IMapView<HSTRING, MediaFrameSource>} 
     */
    FrameSources {
        get => this.get_FrameSources()
    }

    /**
     * Raised when an error occurs during media capture.
     * @type {MediaCaptureFailedEventHandler}
    */
    OnFailed {
        get {
            if(!this.HasProp("__OnFailed")){
                this.__OnFailed := WinRTEventHandler(
                    MediaCaptureFailedEventHandler,
                    MediaCaptureFailedEventHandler.IID,
                    MediaCapture,
                    MediaCaptureFailedEventArgs
                )
                this.__OnFailedToken := this.add_Failed(this.__OnFailed.iface)
            }
            return this.__OnFailed
        }
    }

    /**
     * Occurs when the record limit is exceeded.
     * @remarks
     * If an app receives a RecordLimitationExceeded event, it is expected to finalize the file it is recording. If it does not finalize, the capture engine will stop sending samples to the file that the app was recording to.
     * 
     * In the current release, the record limit is three hours.
     * @type {RecordLimitationExceededEventHandler}
    */
    OnRecordLimitationExceeded {
        get {
            if(!this.HasProp("__OnRecordLimitationExceeded")){
                this.__OnRecordLimitationExceeded := WinRTEventHandler(
                    RecordLimitationExceededEventHandler,
                    RecordLimitationExceededEventHandler.IID,
                    MediaCapture
                )
                this.__OnRecordLimitationExceededToken := this.add_RecordLimitationExceeded(this.__OnRecordLimitationExceeded.iface)
            }
            return this.__OnRecordLimitationExceeded
        }
    }

    /**
     * Occurs when the capture device changes focus.
     * @type {TypedEventHandler<MediaCapture, MediaCaptureFocusChangedEventArgs>}
    */
    OnFocusChanged {
        get {
            if(!this.HasProp("__OnFocusChanged")){
                this.__OnFocusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0561d9e8-0290-5332-b15e-b0d51abe737c}"),
                    MediaCapture,
                    MediaCaptureFocusChangedEventArgs
                )
                this.__OnFocusChangedToken := this.add_FocusChanged(this.__OnFocusChanged.iface)
            }
            return this.__OnFocusChanged
        }
    }

    /**
     * Occurs when a photo confirmation frame is captured.
     * @remarks
     * The [CapturedFrame](capturedframe.md) object passed to this event contains raw pixel data and therefore must be manually copied into the pixel buffer of a bitmap. For information on how to do this, see the Remarks section of the [Frame](photoconfirmationcapturedeventargs_frame.md) property.
     * @type {TypedEventHandler<MediaCapture, PhotoConfirmationCapturedEventArgs>}
    */
    OnPhotoConfirmationCaptured {
        get {
            if(!this.HasProp("__OnPhotoConfirmationCaptured")){
                this.__OnPhotoConfirmationCaptured := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{37dc3b13-b096-5f43-8104-f0dc4302e2b5}"),
                    MediaCapture,
                    PhotoConfirmationCapturedEventArgs
                )
                this.__OnPhotoConfirmationCapturedToken := this.add_PhotoConfirmationCaptured(this.__OnPhotoConfirmationCaptured.iface)
            }
            return this.__OnPhotoConfirmationCaptured
        }
    }

    /**
     * Occurs when the state of the camera stream changes.
     * @remarks
     * The state of the camera stream will change when recording is paused or resumed, when the system drops frames for privacy reasons, or when the camera stream is lost.
     * @type {TypedEventHandler<MediaCapture, IInspectable>}
    */
    OnCameraStreamStateChanged {
        get {
            if(!this.HasProp("__OnCameraStreamStateChanged")){
                this.__OnCameraStreamStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{44c588f1-1bb7-5e12-8413-3cf0373c0bc8}"),
                    MediaCapture,
                    IInspectable
                )
                this.__OnCameraStreamStateChangedToken := this.add_CameraStreamStateChanged(this.__OnCameraStreamStateChanged.iface)
            }
            return this.__OnCameraStreamStateChanged
        }
    }

    /**
     * Occurs when the thermal status of the capture device changes.
     * @remarks
     * Media capture scenarios that are extremely processor-intensive, such as high-resolution, high-frame rate, and real-time image processing can cause the capture hardware to overheat. On devices where the camera driver supports reporting of thermal status, you can check the [MediaCaptureThermalStatus](mediacapture_thermalstatus.md) property to get the current thermal status of the capture device. You can also subscribe to the ThermalStatusChanged event to receive a notification when the thermal status changes. If the thermal status is [Overheated](mediacapturethermalstatus.md) , you should stop the current capture session and save any captured media. Once the thermal status has returned to normal, you can begin capturing again.
     * @type {TypedEventHandler<MediaCapture, IInspectable>}
    */
    OnThermalStatusChanged {
        get {
            if(!this.HasProp("__OnThermalStatusChanged")){
                this.__OnThermalStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{44c588f1-1bb7-5e12-8413-3cf0373c0bc8}"),
                    MediaCapture,
                    IInspectable
                )
                this.__OnThermalStatusChangedToken := this.add_ThermalStatusChanged(this.__OnThermalStatusChanged.iface)
            }
            return this.__OnThermalStatusChanged
        }
    }

    /**
     * Occurs when the exclusive control status of the capture device changes.
     * @remarks
     * When an app has exclusive control of the capture device, it can modify the settings of the device. An app that does not have exclusive control of the capture device can still capture media, but it can't change the capture settings. Request exclusive control by setting the [MediaCaptureInitializationSettings.SharingMode](mediacaptureinitializationsettings_sharingmode.md) property to **ExclusiveControl** before passing the structure into [InitializeAsync](mediacapture_initializeasync_315323248.md). The call to **InitializeAsync** will fail if you request exclusive control when another app already has exclusive access to the device. In this case, you can listen for **CaptureDeviceExclusiveControlStatusChanged**, and if the value of [MediaCaptureDeviceExclusiveControlStatusChangedEventArgs.Status](mediacapturedeviceexclusivecontrolstatuschangedeventargs_status.md) is **ExclusiveControlAvailable**, then you can attempt to reinitialize the **MediaCapture** with exclusive control.
     * 
     * If the **CaptureDeviceExclusiveControlStatusChanged** event is raised and the value of **MediaCaptureDeviceExclusiveControlStatusChangedEventArgs.Status** is **SharedReadOnlyAvailable**, then another app has acquired exclusive control of the device. In this case, you may want to update your UI to alert the user that another app may adjust the capture device settings.
     * @type {TypedEventHandler<MediaCapture, MediaCaptureDeviceExclusiveControlStatusChangedEventArgs>}
    */
    OnCaptureDeviceExclusiveControlStatusChanged {
        get {
            if(!this.HasProp("__OnCaptureDeviceExclusiveControlStatusChanged")){
                this.__OnCaptureDeviceExclusiveControlStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5c91f8ba-b379-53ff-a288-24e7883bf592}"),
                    MediaCapture,
                    MediaCaptureDeviceExclusiveControlStatusChangedEventArgs
                )
                this.__OnCaptureDeviceExclusiveControlStatusChangedToken := this.add_CaptureDeviceExclusiveControlStatusChanged(this.__OnCaptureDeviceExclusiveControlStatusChanged.iface)
            }
            return this.__OnCaptureDeviceExclusiveControlStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [MediaCapture](mediacapture.md) object.
     * @remarks
     * You must call [InitializeAsync](mediacapture_initializeasync_315323248.md) before using the **MediaCapture** object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.MediaCapture")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFailedToken")) {
            this.remove_Failed(this.__OnFailedToken)
            this.__OnFailed.iface.Dispose()
        }

        if(this.HasProp("__OnRecordLimitationExceededToken")) {
            this.remove_RecordLimitationExceeded(this.__OnRecordLimitationExceededToken)
            this.__OnRecordLimitationExceeded.iface.Dispose()
        }

        if(this.HasProp("__OnFocusChangedToken")) {
            this.remove_FocusChanged(this.__OnFocusChangedToken)
            this.__OnFocusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPhotoConfirmationCapturedToken")) {
            this.remove_PhotoConfirmationCaptured(this.__OnPhotoConfirmationCapturedToken)
            this.__OnPhotoConfirmationCaptured.iface.Dispose()
        }

        if(this.HasProp("__OnCameraStreamStateChangedToken")) {
            this.remove_CameraStreamStateChanged(this.__OnCameraStreamStateChangedToken)
            this.__OnCameraStreamStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnThermalStatusChangedToken")) {
            this.remove_ThermalStatusChanged(this.__OnThermalStatusChangedToken)
            this.__OnThermalStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCaptureDeviceExclusiveControlStatusChangedToken")) {
            this.remove_CaptureDeviceExclusiveControlStatusChanged(this.__OnCaptureDeviceExclusiveControlStatusChangedToken)
            this.__OnCaptureDeviceExclusiveControlStatusChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Initializes the [MediaCapture](mediacapture.md) object.
     * @remarks
     * InitializeAsync will launch a consent prompt to get the user's permission for the app to access the microphone or camera. InitializeAsync should be called from the main UI thread of your app. In apps that use C# or C++, the first use of the [MediaCapture](mediacapture.md) object to call [InitializeAsync](mediacapture_initializeasync_315323248.md) should be on the STA thread. Calls from an MTA thread may result in undefined behavior.
     * 
     * For how-to guidance on initializing and shutting down the **MediaCapture** object, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
     * 
     * Starting with Windows, version 1803, **InitializeAsync** will return an error or throw an exception with an error code of 0xC00DAFC8 (MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT) when an unsupported capture device is detected. You can check for this error code and update your UI to alert to the user.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.initializeasync
     */
    InitializeAsync() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.InitializeAsync()
    }

    /**
     * Initializes the [MediaCapture](mediacapture.md) object, using default settings.
     * @remarks
     * InitializeAsync will launch a consent prompt to get the user's permission for the app to access the microphone or camera. InitializeAsync should be called from the main UI thread of your app. In apps that use C# or C++, the first use of the [MediaCapture](mediacapture.md) object to call InitializeAsync should be on the STA thread. Calls from an MTA thread may result in undefined behavior.
     * 
     * For how-to guidance on initializing and shutting down the **MediaCapture** object, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
     * 
     * Starting with Windows, version 1803, **InitializeAsync** will return an error or throw an exception with an error code of 0xC00DAFC8 (MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT) when an unsupported capture device is detected. You can check for this error code and update your UI to alert to the user.
     * @param {MediaCaptureInitializationSettings} mediaCaptureInitializationSettings_ 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.initializeasync
     */
    InitializeWithSettingsAsync(mediaCaptureInitializationSettings_) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.InitializeWithSettingsAsync(mediaCaptureInitializationSettings_)
    }

    /**
     * Starts recording asynchronously to a storage file.
     * @remarks
     * For how-to guidance on recording to a file, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
     * @param {MediaEncodingProfile} encodingProfile The encoding profile for the recording.
     * @param {IStorageFile} file_ The storage file where the image is saved.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startrecordtostoragefileasync
     */
    StartRecordToStorageFileAsync(encodingProfile, file_) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.StartRecordToStorageFileAsync(encodingProfile, file_)
    }

    /**
     * Starts recording to a random-access stream.
     * @remarks
     * For how-to guidance on recording to a file, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
     * @param {MediaEncodingProfile} encodingProfile The encoding profile for the recording.
     * @param {IRandomAccessStream} stream The stream where the image data is written.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startrecordtostreamasync
     */
    StartRecordToStreamAsync(encodingProfile, stream) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.StartRecordToStreamAsync(encodingProfile, stream)
    }

    /**
     * Start recording to a custom media sink using the specified encoding profile and sink settings.
     * @remarks
     * A [RecordLimitationExceeded](mediacapture_recordlimitationexceeded.md) event is raised if the record limit is exceeded. In the current release, the record limit is three hours.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile to use for the recording.
     * @param {IMediaExtension} customMediaSink 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startrecordtocustomsinkasync
     */
    StartRecordToCustomSinkAsync(encodingProfile, customMediaSink) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.StartRecordToCustomSinkAsync(encodingProfile, customMediaSink)
    }

    /**
     * Start recording to a custom media sink using the specified encoding profile.
     * @remarks
     * A [RecordLimitationExceeded](mediacapture_recordlimitationexceeded.md) event is raised if the record limit is exceeded. In the current release, record limit is three hours.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile to use for the recording.
     * @param {HSTRING} customSinkActivationId 
     * @param {IPropertySet} customSinkSettings 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startrecordtocustomsinkasync
     */
    StartRecordToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.StartRecordToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings)
    }

    /**
     * Stops recording.
     * @remarks
     * Before playing back a video, the [RandomAccessStream](../windows.storage.streams/randomaccessstream.md) should be closed when StopRecordAsync completes.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.stoprecordasync
     */
    StopRecordAsync() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.StopRecordAsync()
    }

    /**
     * Captures a photo to a storage file.
     * @remarks
     * For how-to guidance on capturing a photo to a storage file, see Basic [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
     * @param {ImageEncodingProperties} type The encoding properties for the output image.
     * @param {IStorageFile} file_ The storage file where the image is saved.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.capturephototostoragefileasync
     */
    CapturePhotoToStorageFileAsync(type, file_) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.CapturePhotoToStorageFileAsync(type, file_)
    }

    /**
     * Captures a photo to a random-access stream.
     * @param {ImageEncodingProperties} type The encoding properties for the output image.
     * @param {IRandomAccessStream} stream The stream where the image data is written.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.capturephototostreamasync
     */
    CapturePhotoToStreamAsync(type, stream) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.CapturePhotoToStreamAsync(type, stream)
    }

    /**
     * Adds an audio or video effect.
     * @remarks
     * As of Windows 10, this method is deprecated. Use [AddAudioEffectAsync](mediacapture_addaudioeffectasync_182168147.md) or [AddVideoEffectAsync](mediacapture_addvideoeffectasync_1410216019.md) instead. For how-to guidance on adding effects to the camera capture and preview streams, see [Effects for video capture](/windows/apps/develop/camera/effects-for-video-capture).
     * @param {Integer} mediaStreamType_ Specifies the streams to which the effect will be applied.
     * @param {HSTRING} effectActivationID The class identifier of the activatable runtime class that implements the effect. The runtime class must implement the [IMediaExtension](../windows.media/imediaextension.md) interface.
     * @param {IPropertySet} effectSettings Configuration parameters for the effect.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.addeffectasync
     */
    AddEffectAsync(mediaStreamType_, effectActivationID, effectSettings) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.AddEffectAsync(mediaStreamType_, effectActivationID, effectSettings)
    }

    /**
     * Removes all audio and video effects from a stream.
     * @param {Integer} mediaStreamType_ The stream from which to remove the effects.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.cleareffectsasync
     */
    ClearEffectsAsync(mediaStreamType_) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.ClearEffectsAsync(mediaStreamType_)
    }

    /**
     * Sets an encoding property.
     * @remarks
     * You can only call SetEncoderProperty with *mediaStreamType* equal to [MediaStreamType.Audio](mediastreamtype.md), if the encoder property is applied to only the audio encoder in the record sink. The preview sink does not allow you to set an encoding profile with compressed audio.
     * 
     * For non-H.264 cameras, when you call SetEncoderProperty before recording or previewing has started, the property is stored locally. When you start recording, the property is applied to the encoder at the time of encoder initialization. To configure static encoding properties, you must call SetEncoderProperty before recording or previewing starts. Before recording or previewing starts, [GetEncoderProperty](mediacapture_getencoderproperty_769455038.md) will return the value of the property stored locally.
     * 
     * If the camera is a H.264 camera and the stream that SetEncoderProperty is called on is of type [MediaStreamType.VideoRecord](mediastreamtype.md), then the property is applied directly to the camera. This is true both before and after recording has started.
     * 
     * For non-H.264 cameras, when you call SetEncoderProperty after you get the record or preview started completion callback, the property is set directly on the encoder and is therefore used to configure dynamic encoding properties.
     * 
     * If you call SetEncoderProperty after you issue a call to start recording or previewing and before you get the record or preview started completion callback, you will receive an **MF_E_INVALIDREQUEST** error since the property cannot be applied to static nor dynamic settings.
     * 
     * To rotate the preview stream, use the **GUID** defined as [MF_MT_VIDEO_ROTATION](/windows/desktop/medfound/mf-mt-video-rotation). For how-to guidance on handling orientation when using the camera, see [Handle device orientation with MediaCapture](/windows/uwp/audio-video-camera/handle-device-orientation-with-mediacapture).
     * @param {Integer} mediaStreamType_ The type of media data the stream represents, such as video or audio.
     * @param {Guid} propertyId The encoding property to set.
     * @param {IInspectable} propertyValue_ The new value of the encoding property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.setencoderproperty
     */
    SetEncoderProperty(mediaStreamType_, propertyId, propertyValue_) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.SetEncoderProperty(mediaStreamType_, propertyId, propertyValue_)
    }

    /**
     * Gets the value of an encoding property.
     * @param {Integer} mediaStreamType_ Specifies the stream to query for the encoding property.
     * @param {Guid} propertyId The encoding property to retrieve.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.getencoderproperty
     */
    GetEncoderProperty(mediaStreamType_, propertyId) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.GetEncoderProperty(mediaStreamType_, propertyId)
    }

    /**
     * 
     * @param {MediaCaptureFailedEventHandler} errorEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Failed(errorEventHandler) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.add_Failed(errorEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Failed(eventCookie) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.remove_Failed(eventCookie)
    }

    /**
     * 
     * @param {RecordLimitationExceededEventHandler} recordLimitationExceededEventHandler_ 
     * @returns {EventRegistrationToken} 
     */
    add_RecordLimitationExceeded(recordLimitationExceededEventHandler_) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.add_RecordLimitationExceeded(recordLimitationExceededEventHandler_)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_RecordLimitationExceeded(eventCookie) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.remove_RecordLimitationExceeded(eventCookie)
    }

    /**
     * 
     * @returns {MediaCaptureSettings} 
     */
    get_MediaCaptureSettings() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.get_MediaCaptureSettings()
    }

    /**
     * 
     * @returns {AudioDeviceController} 
     */
    get_AudioDeviceController() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.get_AudioDeviceController()
    }

    /**
     * 
     * @returns {VideoDeviceController} 
     */
    get_VideoDeviceController() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.get_VideoDeviceController()
    }

    /**
     * Enables or disables horizontal mirroring of the video preview stream. This is not the preferred method for mirroring. See the Remarks section below for details.
     * @remarks
     * Horizontal mirroring is useful for video conferencing or video chat applications, because the users typically want to see a reflected image of themselves. The non-mirrored view can look strange, because we are used to seeing ourselves in a mirror.
     * 
     * To mirror the preview video, apps should instead use the following method. Windows app using JavaScript should use the [msHorizontalMirror](/previous-versions/hh772562(v=vs.85)) property of the [video](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video) object. UWP apps using C++, C#, or Visual Basic should use the [FlowDirection](../windows.ui.xaml/flowdirection.md) property on the [CaptureElement](../windows.ui.xaml.controls/captureelement.md).
     * 
     * SetPreviewMirroring can potentially be used as a performance optimization on some devices
     * 
     * For how-to guidance on handling orientation and mirroring when using the camera, see [Handle device orientation with MediaCapture](/windows/uwp/audio-video-camera/handle-device-orientation-with-mediacapture).
     * @param {Boolean} value True to enable mirroring; false to disable mirroring.
     * <!--This changed to a bool in fbl_multimedia. Description is for the updated API-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.setpreviewmirroring
     */
    SetPreviewMirroring(value) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.SetPreviewMirroring(value)
    }

    /**
     * Queries whether the video stream is mirrored horizontally.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.getpreviewmirroring
     */
    GetPreviewMirroring() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.GetPreviewMirroring()
    }

    /**
     * Rotates the video preview stream.
     * @remarks
     * For how-to guidance on handling orientation when using the camera, see [Handle device orientation with MediaCapture](/windows/uwp/audio-video-camera/handle-device-orientation-with-mediacapture).
     * @param {Integer} value The amount by which to rotate the video.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.setpreviewrotation
     */
    SetPreviewRotation(value) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.SetPreviewRotation(value)
    }

    /**
     * Gets the rotation of the video preview stream.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.getpreviewrotation
     */
    GetPreviewRotation() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.GetPreviewRotation()
    }

    /**
     * Rotates the recorded video.
     * @remarks
     * For how-to guidance on handling orientation when using the camera, see [Handle device orientation with MediaCapture](/windows/uwp/audio-video-camera/handle-device-orientation-with-mediacapture).
     * @param {Integer} value The amount by which to rotate the video.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.setrecordrotation
     */
    SetRecordRotation(value) {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.SetRecordRotation(value)
    }

    /**
     * Gets the rotation of the recorded video.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.getrecordrotation
     */
    GetRecordRotation() {
        if (!this.HasProp("__IMediaCapture")) {
            if ((queryResult := this.QueryInterface(IMediaCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture := IMediaCapture(outPtr)
        }

        return this.__IMediaCapture.GetRecordRotation()
    }

    /**
     * Starts preview.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startpreviewasync
     */
    StartPreviewAsync() {
        if (!this.HasProp("__IMediaCaptureVideoPreview")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoPreview := IMediaCaptureVideoPreview(outPtr)
        }

        return this.__IMediaCaptureVideoPreview.StartPreviewAsync()
    }

    /**
     * Starts sending a preview stream to a custom media sink using the specified encoding profile and sink settings.
     * @remarks
     * When you call **StartPreviewToCustomSinkAsync**, the system will call the custom sink’s [IMFMediaTypeHandler.IsMediaTypeSupported](/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported) method, passing in the native media type of the capture device. This check is performed in an effort to avoid unnecessary video conversion. If the custom sink returns S_OK from **IsMediaTypeSupported** when this check is made, then the preview stream will use the native media type instead of the type specified by the *encodingProfile* parameter.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile to use for the recording.
     * @param {IMediaExtension} customMediaSink 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startpreviewtocustomsinkasync
     */
    StartPreviewToCustomSinkAsync(encodingProfile, customMediaSink) {
        if (!this.HasProp("__IMediaCaptureVideoPreview")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoPreview := IMediaCaptureVideoPreview(outPtr)
        }

        return this.__IMediaCaptureVideoPreview.StartPreviewToCustomSinkAsync(encodingProfile, customMediaSink)
    }

    /**
     * Starts sending a preview stream to a custom media sink using the specified encoding profile.
     * @remarks
     * When you call **StartPreviewToCustomSinkAsync**, the system will call the custom sink’s [IMFMediaTypeHandler.IsMediaTypeSupported](/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported) method, passing in the native media type of the capture device. This check is performed in an effort to avoid unnecessary video conversion. If the custom sink returns S_OK from **IsMediaTypeSupported** when this check is made, then the preview stream will use the native media type instead of the type specified by the *encodingProfile* parameter.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile to use for the recording.
     * @param {HSTRING} customSinkActivationId 
     * @param {IPropertySet} customSinkSettings 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.startpreviewtocustomsinkasync
     */
    StartPreviewToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings) {
        if (!this.HasProp("__IMediaCaptureVideoPreview")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoPreview := IMediaCaptureVideoPreview(outPtr)
        }

        return this.__IMediaCaptureVideoPreview.StartPreviewToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings)
    }

    /**
     * Stops preview.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.stoppreviewasync
     */
    StopPreviewAsync() {
        if (!this.HasProp("__IMediaCaptureVideoPreview")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureVideoPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureVideoPreview := IMediaCaptureVideoPreview(outPtr)
        }

        return this.__IMediaCaptureVideoPreview.StopPreviewAsync()
    }

    /**
     * Initializes the low lag recording using the specified file to store the recording. This method provides the [LowLagMediaRecording](lowlagmediarecording.md) object used to managed the recording.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile for the recording.
     * @param {IStorageFile} file_ The storage file where the image is saved.
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparelowlagrecordtostoragefileasync
     */
    PrepareLowLagRecordToStorageFileAsync(encodingProfile, file_) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.PrepareLowLagRecordToStorageFileAsync(encodingProfile, file_)
    }

    /**
     * Initializes the low lag recording using the specified random-access stream to store the recording. This method provides the [LowLagMediaRecording](lowlagmediarecording.md) object used to managed the recording.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile for the recording.
     * @param {IRandomAccessStream} stream The stream where the image data is written.
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparelowlagrecordtostreamasync
     */
    PrepareLowLagRecordToStreamAsync(encodingProfile, stream) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.PrepareLowLagRecordToStreamAsync(encodingProfile, stream)
    }

    /**
     * Initializes the low lag recording using the specified custom sink to store the recording. This method provides the [LowLagMediaRecording](lowlagmediarecording.md) object used to managed the recording.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile to use for the recording.
     * @param {IMediaExtension} customMediaSink 
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparelowlagrecordtocustomsinkasync
     */
    PrepareLowLagRecordToCustomSinkAsync(encodingProfile, customMediaSink) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.PrepareLowLagRecordToCustomSinkAsync(encodingProfile, customMediaSink)
    }

    /**
     * Initializes the low lag recording using the specified custom sink to store the recording. This method provides the [LowLagMediaRecording](lowlagmediarecording.md) object used to managed the capture.
     * @param {MediaEncodingProfile} encodingProfile The encoding profile to use for the recording.
     * @param {HSTRING} customSinkActivationId 
     * @param {IPropertySet} customSinkSettings 
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparelowlagrecordtocustomsinkasync
     */
    PrepareLowLagRecordToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.PrepareLowLagRecordToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings)
    }

    /**
     * Initializes the low shutter lag photo capture and provides the [LowLagPhotoCapture](lowlagphotocapture.md) object used to manage the recording.
     * @remarks
     * Use PrepareLowLagPhotoCaptureAsync to initialize the capture. This is an asynchronous calls which returns a [LowLagPhotoCapture](lowlagphotocapture.md) object when it is finished, which is used to start the actual photo capture by calling [LowLagPhotoCapture.CaptureAsync](lowlagphotocapture_captureasync_2078018041.md).
     * 
     * PrepareLowLagPhotoCaptureAsync must be called before [LowLagPhotoCapture.CaptureAsync](lowlagphotocapture_captureasync_2078018041.md).
     * 
     * For how-to guidance on using [LowLagPhotoCapture](lowlagphotocapture.md) to capture a photo, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
     * @param {ImageEncodingProperties} type The encoding profile used for the image.
     * @returns {IAsyncOperation<LowLagPhotoCapture>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparelowlagphotocaptureasync
     */
    PrepareLowLagPhotoCaptureAsync(type) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.PrepareLowLagPhotoCaptureAsync(type)
    }

    /**
     * Initializes the low shutter lag photo sequence capture and provides the [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object used to manage the recording.
     * @remarks
     * Use MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync to initialize the photo sequence capture. This is an asynchronous call which returns a [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object when it is finished, which is used start the photo sequence capture by calling [LowLagPhotoSequenceCapture.StartAsync](lowlagphotosequencecapture_startasync_1931900819.md).
     * 
     * PrepareLowLagPhotoSequenceCaptureAsync must be called before [LowLagPhotoSequenceCapture.StartAsync](lowlagphotosequencecapture_startasync_1931900819.md).
     * @param {ImageEncodingProperties} type The encoding profile used for the image.
     * @returns {IAsyncOperation<LowLagPhotoSequenceCapture>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparelowlagphotosequencecaptureasync
     */
    PrepareLowLagPhotoSequenceCaptureAsync(type) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.PrepareLowLagPhotoSequenceCaptureAsync(type)
    }

    /**
     * Asynchronously sets the media encoding properties.
     * @remarks
     * This method sets the encoding properties of the encoder that processes the data before it’s passed on to a [CaptureElement](../windows.ui.xaml.controls/captureelement.md) to be displayed, written out to a [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) or [StorageFile](../windows.storage/storagefile.md), or delivered to a custom media sink. This method does not change the configuration of the source of the data, which is the camera device. It is possible to set the encoding properties to a resolution that is not natively supported by the camera. In this case, the **MediaCapture** pipeline will use an encoder to perform the conversion to the requested format. Note that this conversion does consume system resources and can result in poor performance or even errors, especially on devices that with limited or no graphics acceleration. For typical scenarios, it is recommended that you choose a resolution supported by the camera that is closest to your desired resolution. You can get a list of a capture device's supported resolutions by calling [VideoDeviceController.GetAvailableMediaStreamProperties](../windows.media.devices/videodevicecontroller_getavailablemediastreamproperties_946867392.md). For more information, see [Set format, resolution, and frame rate for MediaCapture](/windows/apps/develop/camera/set-media-encoding-properties) and the [Camera Resolution Sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/CameraResolution).
     * 
     * > [!NOTE]
     * > **SetEncodingPropertiesAsync** will only succeed when the default preview stream is in a streaming state, i.e. after [StartPreviewAsync](mediacapture_startpreviewasync_2139900609.md) has been called successfully. If **SetEncodingPropertiesAsync** is called while the **MediaCapture** object is streaming video from a [MediaFrameSource](/uwp/api/windows.media.capture.frames.mediaframesource) via a [MediaPlayerElement](/uwp/api/windows.ui.xaml.controls.mediaplayerelement) or [MediaFrameReader](/uwp/api/windows.media.capture.frames.mediaframereader), this call will fail.
     * 
     * To rotate the record or preview stream, use the **GUID** defined by [MF_MT_VIDEO_ROTATION](/windows/desktop/medfound/mf-mt-video-rotation) to add metadata to the stream. Note that this rotation is performed by the consumer of the stream, such as the **CaptureElement** or a video player app, while the actual pixels in the stream still retain their original orientation. For how-to guidance on handling orientation when using the camera, see [Handle device orientation with MediaCapture](/windows/uwp/audio-video-camera/handle-device-orientation-with-mediacapture).
     * 
     * To modify the properties of the capture device, use [VideoDeviceController.SetMediaStreamPropertiesAsync](../windows.media.devices/videodevicecontroller_setmediastreampropertiesasync_835261048.md).
     * @param {Integer} mediaStreamType_ The type of media data the stream represents, such as video or audio.
     * @param {IMediaEncodingProperties} mediaEncodingProperties The properties for the media encoding.
     * @param {MediaPropertySet} encoderProperties The properties for the encoder.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.setencodingpropertiesasync
     */
    SetEncodingPropertiesAsync(mediaStreamType_, mediaEncodingProperties, encoderProperties) {
        if (!this.HasProp("__IMediaCapture2")) {
            if ((queryResult := this.QueryInterface(IMediaCapture2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture2 := IMediaCapture2(outPtr)
        }

        return this.__IMediaCapture2.SetEncodingPropertiesAsync(mediaStreamType_, mediaEncodingProperties, encoderProperties)
    }

    /**
     * Closes the media capture object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Initializes the variable photo sequence capture and provides the [VariablePhotoSequenceCapture](../windows.media.capture.core/variablephotosequencecapture.md) object used to manage the recording.
     * @param {ImageEncodingProperties} type The encoding profile used for the image.
     * @returns {IAsyncOperation<VariablePhotoSequenceCapture>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.preparevariablephotosequencecaptureasync
     */
    PrepareVariablePhotoSequenceCaptureAsync(type) {
        if (!this.HasProp("__IMediaCapture3")) {
            if ((queryResult := this.QueryInterface(IMediaCapture3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture3 := IMediaCapture3(outPtr)
        }

        return this.__IMediaCapture3.PrepareVariablePhotoSequenceCaptureAsync(type)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, MediaCaptureFocusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusChanged(handler) {
        if (!this.HasProp("__IMediaCapture3")) {
            if ((queryResult := this.QueryInterface(IMediaCapture3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture3 := IMediaCapture3(outPtr)
        }

        return this.__IMediaCapture3.add_FocusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusChanged(token) {
        if (!this.HasProp("__IMediaCapture3")) {
            if ((queryResult := this.QueryInterface(IMediaCapture3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture3 := IMediaCapture3(outPtr)
        }

        return this.__IMediaCapture3.remove_FocusChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, PhotoConfirmationCapturedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PhotoConfirmationCaptured(handler) {
        if (!this.HasProp("__IMediaCapture3")) {
            if ((queryResult := this.QueryInterface(IMediaCapture3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture3 := IMediaCapture3(outPtr)
        }

        return this.__IMediaCapture3.add_PhotoConfirmationCaptured(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PhotoConfirmationCaptured(token) {
        if (!this.HasProp("__IMediaCapture3")) {
            if ((queryResult := this.QueryInterface(IMediaCapture3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture3 := IMediaCapture3(outPtr)
        }

        return this.__IMediaCapture3.remove_PhotoConfirmationCaptured(token)
    }

    /**
     * Adds an audio effect to the capture pipeline.
     * @param {IAudioEffectDefinition} definition The object containing the definition of the effect to be added.
     * @returns {IAsyncOperation<IMediaExtension>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.addaudioeffectasync
     */
    AddAudioEffectAsync(definition) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.AddAudioEffectAsync(definition)
    }

    /**
     * Adds a video effect to the capture pipeline.
     * @remarks
     * For how-to guidance on adding effects to the camera capture and preview streams, see [Effects for video capture](/windows/apps/develop/camera/effects-for-video-capture).
     * @param {IVideoEffectDefinition} definition The object containing the definition of the effect to be added.
     * @param {Integer} mediaStreamType_ Specifies the streams to which the effect will be applied.
     * @returns {IAsyncOperation<IMediaExtension>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.addvideoeffectasync
     */
    AddVideoEffectAsync(definition, mediaStreamType_) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.AddVideoEffectAsync(definition, mediaStreamType_)
    }

    /**
     * Pauses an ongoing record operation.
     * @remarks
     * Resume recording by calling [ResumeRecordAsync](mediacapture_resumerecordasync_654128650.md).
     * @param {Integer} behavior A value indicating whether the media capture hardware resources should be preserved or released while recording is paused.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.pauserecordasync
     */
    PauseRecordAsync(behavior) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.PauseRecordAsync(behavior)
    }

    /**
     * Resumes a paused recording operation.
     * @remarks
     * Pause recording by calling [PauseRecordAsync](mediacapture_pauserecordasync_1650376226.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.resumerecordasync
     */
    ResumeRecordAsync() {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.ResumeRecordAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraStreamStateChanged(handler) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.add_CameraStreamStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CameraStreamStateChanged(token) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.remove_CameraStreamStateChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CameraStreamState() {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.get_CameraStreamState()
    }

    /**
     * Gets a preview frame from the capture device, copied into the provided destination [VideoFrame](../windows.media/videoframe.md) and converted into the destination frame's format.
     * @remarks
     * To get a preview frame without going through a copy or conversion operation, use the no argument overload of GetPreviewFrameAsync.
     * 
     * For how-to guidance on preview frames, see [Get a preview frame](/windows/uwp/audio-video-camera/get-a-preview-frame).
     * 
     * > [!NOTE] 
     * > For app scenarios that call for capturing a large number of frames in a sequence, such as computer vision scenarios, it is recommended that you use the [MediaFrameReader](/uwp/api/Windows.Media.Capture.Frames.MediaFrameReader) class instead of **GetPreviewFrameAsync**. For more information and how-to guidance, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
     * @returns {IAsyncOperation<VideoFrame>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.getpreviewframeasync
     */
    GetPreviewFrameAsync() {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.GetPreviewFrameAsync()
    }

    /**
     * Gets a preview frame from the capture device.
     * @remarks
     * This method returns the preview frame in the current format of the capture device without copying or converting the frame. To get the preview frame in another format, use the [GetPreviewFrameAsync(VideoFrame)](mediacapture_getpreviewframeasync_440877418.md) overload and pass in a [VideoFrame](mediacapture_getpreviewframeasync_440877418.md) with your desired format.
     * 
     * For how-to guidance on preview frames, see [Get a preview frame](/windows/uwp/audio-video-camera/get-a-preview-frame).
     * 
     * > [!NOTE] 
     * > For app scenarios that call for capturing a large number of frames in a sequence, such as computer vision scenarios, it is recommended that you use the [MediaFrameReader](/uwp/api/Windows.Media.Capture.Frames.MediaFrameReader) class instead of **GetPreviewFrameAsync**. For more information and how-to guidance, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
     * @param {VideoFrame} destination 
     * @returns {IAsyncOperation<VideoFrame>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.getpreviewframeasync
     */
    GetPreviewFrameCopyAsync(destination) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.GetPreviewFrameCopyAsync(destination)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ThermalStatusChanged(handler) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.add_ThermalStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ThermalStatusChanged(token) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.remove_ThermalStatusChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThermalStatus() {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.get_ThermalStatus()
    }

    /**
     * Initializes the advanced photo capture and provides the [AdvancedPhotoCapture](advancedphotocapture.md) object used to manage the recording.
     * @remarks
     * > [!NOTE] 
     * > Starting with Windows 10, version 1709, recording video and using AdvancedPhotoCapture concurrently is supported.  This is not supported in previous versions. This change means that you can have a prepared **[LowLagMediaRecording](/uwp/api/windows.media.capture.lowlagmediarecording)** and **[AdvancedPhotoCapture](/uwp/api/windows.media.capture.advancedphotocapture)** at the same time. You can start or stop video recording between calls to **[MediaCapture.PrepareAdvancedPhotoCaptureAsync](/uwp/api/windows.media.capture.mediacapture#Windows_Media_Capture_MediaCapture_PrepareAdvancedPhotoCaptureAsync_Windows_Media_MediaProperties_ImageEncodingProperties_)** and **[AdvancedPhotoCapture.FinishAsync](/uwp/api/windows.media.capture.advancedphotocapture.FinishAsync)**. You can also call **[AdvancedPhotoCapture.CaptureAsync](/uwp/api/windows.media.capture.advancedphotocapture.CaptureAsync)** while video is recording. However, some **AdvancedPhotoCapture** scenarios, like capturing an HDR photo while recording video would cause some video frames to be altered by the HDR capture, resulting in a negative user experience. For this reason, the list of modes returned by the **[AdvancedPhotoControl.SupportedModes](/uwp/api/windows.media.devices.advancedphotocontrol.SupportedModes)** will be different while video is recording. You should check this value immediately after starting or stopping video recording to ensure that the desired mode is supported in the current video recording state.
     * @param {ImageEncodingProperties} encodingProperties The encoding properties used for the resulting image.
     * @returns {IAsyncOperation<AdvancedPhotoCapture>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.prepareadvancedphotocaptureasync
     */
    PrepareAdvancedPhotoCaptureAsync(encodingProperties) {
        if (!this.HasProp("__IMediaCapture4")) {
            if ((queryResult := this.QueryInterface(IMediaCapture4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture4 := IMediaCapture4(outPtr)
        }

        return this.__IMediaCapture4.PrepareAdvancedPhotoCaptureAsync(encodingProperties)
    }

    /**
     * Removes the specified effect from the capture pipeline.
     * @remarks
     * Pass the effect instance returned by [AddVideoEffectAsync](mediacapture_addvideoeffectasync_1410216019.md) or [AddAudioEffectAsync](mediacapture_addaudioeffectasync_182168147.md) into this method to remove the effect from the pipeline.
     * @param {IMediaExtension} effect_ The effect to remove from the capture pipeline.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.removeeffectasync
     */
    RemoveEffectAsync(effect_) {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.RemoveEffectAsync(effect_)
    }

    /**
     * Pauses an ongoing media record operation and provides a [MediaCapturePauseResult](mediacapturepauseresult.md) that can be used to help the user align the camera with the last captured frame when resuming recording.
     * @param {Integer} behavior A value indicating whether the media capture hardware resources should be preserved or released while recording is paused.
     * @returns {IAsyncOperation<MediaCapturePauseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.pauserecordwithresultasync
     */
    PauseRecordWithResultAsync(behavior) {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.PauseRecordWithResultAsync(behavior)
    }

    /**
     * Asynchronously stops the media recording and provides a [MediaCaptureStopResult](mediacapturestopresult.md) that can be used to help the user align the camera with the last captured frame when restarting recording.
     * @returns {IAsyncOperation<MediaCaptureStopResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.stoprecordwithresultasync
     */
    StopRecordWithResultAsync() {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.StopRecordWithResultAsync()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, MediaFrameSource>} 
     */
    get_FrameSources() {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.get_FrameSources()
    }

    /**
     * Creates a [MediaFrameReader](../windows.media.capture.frames/mediaframereader.md) that is used to acquire frames with the specified media encoding subtype from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md).
     * @param {MediaFrameSource} inputSource The media frame source from which the reader will acquire frames.
     * @returns {IAsyncOperation<MediaFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.createframereaderasync
     */
    CreateFrameReaderAsync(inputSource) {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.CreateFrameReaderAsync(inputSource)
    }

    /**
     * Creates a [MediaFrameReader](../windows.media.capture.frames/mediaframereader.md) that is used to acquire frames with the specified media encoding subtype and size from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md).
     * @param {MediaFrameSource} inputSource The media frame source from which the reader will acquire frames.
     * @param {HSTRING} outputSubtype A string specifying the requested media encoding subtype for the frames acquired by the frame reader. This value must be one of the strings defined by the properties of the [MediaEncodingSubtypes](../windows.media.mediaproperties/mediaencodingsubtypes.md) class.
     * @returns {IAsyncOperation<MediaFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.createframereaderasync
     */
    CreateFrameReaderWithSubtypeAsync(inputSource, outputSubtype) {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.CreateFrameReaderWithSubtypeAsync(inputSource, outputSubtype)
    }

    /**
     * Creates a [MediaFrameReader](../windows.media.capture.frames/mediaframereader.md) that is used to acquire frames from a [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md).
     * @param {MediaFrameSource} inputSource The media frame source from which the reader will acquire frames.
     * @param {HSTRING} outputSubtype 
     * @param {BitmapSize} outputSize 
     * @returns {IAsyncOperation<MediaFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.createframereaderasync
     */
    CreateFrameReaderWithSubtypeAndSizeAsync(inputSource, outputSubtype, outputSize) {
        if (!this.HasProp("__IMediaCapture5")) {
            if ((queryResult := this.QueryInterface(IMediaCapture5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture5 := IMediaCapture5(outPtr)
        }

        return this.__IMediaCapture5.CreateFrameReaderWithSubtypeAndSizeAsync(inputSource, outputSubtype, outputSize)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, MediaCaptureDeviceExclusiveControlStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CaptureDeviceExclusiveControlStatusChanged(handler) {
        if (!this.HasProp("__IMediaCapture6")) {
            if ((queryResult := this.QueryInterface(IMediaCapture6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture6 := IMediaCapture6(outPtr)
        }

        return this.__IMediaCapture6.add_CaptureDeviceExclusiveControlStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CaptureDeviceExclusiveControlStatusChanged(token) {
        if (!this.HasProp("__IMediaCapture6")) {
            if ((queryResult := this.QueryInterface(IMediaCapture6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture6 := IMediaCapture6(outPtr)
        }

        return this.__IMediaCapture6.remove_CaptureDeviceExclusiveControlStatusChanged(token)
    }

    /**
     * Creates a [MultiSourceMediaFrameReader](../windows.media.capture.frames/multisourcemediaframereader.md) that is used to acquire time-correlated frames from one or more [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) objects.
     * @param {IIterable<MediaFrameSource>} inputSources A [IIterable](../windows.foundation.collections/iiterable_1.md) list of [MediaFrameSource](../windows.media.capture.frames/mediaframesource.md) objects to be used by the frame reader.
     * @returns {IAsyncOperation<MultiSourceMediaFrameReader>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.createmultisourceframereaderasync
     */
    CreateMultiSourceFrameReaderAsync(inputSources) {
        if (!this.HasProp("__IMediaCapture6")) {
            if ((queryResult := this.QueryInterface(IMediaCapture6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture6 := IMediaCapture6(outPtr)
        }

        return this.__IMediaCapture6.CreateMultiSourceFrameReaderAsync(inputSources)
    }

    /**
     * Creates a new instance of the [MediaCaptureRelativePanelWatcher](mediacapturerelativepanelwatcher.md) class, which monitors the panel associated with the provided [DisplayRegion](/uwp/api/windows.ui.windowmanagement.displayregion), so that the app receives notifications when the relative location of the panel changes.
     * @remarks
     * Apps should implement a handler for the [DisplayRegion.Changed Event](/en-us/uwp/api/windows.ui.windowmanagement.displayregion.changed) that is raised whenever the **DisplayRegion** associated with the watcher changes. In this handler, apps should dispose of the watcher object, recreate the object, and reregister a handler for the [MediaCaptureRelativePanelWatcher.Changed](mediacapturerelativepanelwatcher_changed.md) event.
     * @param {Integer} captureMode A value from the [StreamingCaptureMode enumeration](/uwp/api/windows.media.capture.streamingcapturemode) enumeration.
     * @param {DisplayRegion} displayRegion_ A [DisplayRegion](/uwp/api/windows.ui.windowmanagement.displayregion) for which the associated panel is monitored for changes. Typically this display region will be the camera view finder UI element, so that the app is alerted if the relative location of the panel containing the view finder changes.
     * @returns {MediaCaptureRelativePanelWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapture.createrelativepanelwatcher
     */
    CreateRelativePanelWatcher(captureMode, displayRegion_) {
        if (!this.HasProp("__IMediaCapture7")) {
            if ((queryResult := this.QueryInterface(IMediaCapture7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCapture7 := IMediaCapture7(outPtr)
        }

        return this.__IMediaCapture7.CreateRelativePanelWatcher(captureMode, displayRegion_)
    }

;@endregion Instance Methods
}
