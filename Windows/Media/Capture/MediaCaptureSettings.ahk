#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureSettings.ahk
#Include .\IMediaCaptureSettings2.ahk
#Include .\IMediaCaptureSettings3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains read-only configuration settings for the [MediaCapture](mediacapture.md) object.
 * @remarks
 * To get an instance of this class, retrieve the [MediaCapture.MediaCaptureSettings](mediacapture_mediacapturesettings.md) property.
 * 
 * For how-to guidance for using the [MediaCapture](mediacapture.md) object to capture audio, photos, and video, see [Camera](/windows/apps/develop/camera/camera).
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the microphone.
     * @remarks
     * This method may return null if the device doesn't support this functionality. For more information, see the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.audiodeviceid
     * @type {HSTRING} 
     */
    AudioDeviceId {
        get => this.get_AudioDeviceId()
    }

    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the video camera.
     * @remarks
     * This method may return null if the device doesn't support this functionality. For more information, see the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.videodeviceid
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * Gets the streaming mode.
     * @remarks
     * This property indicates whether audio capture, video capture, or both are enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.streamingcapturemode
     * @type {Integer} 
     */
    StreamingCaptureMode {
        get => this.get_StreamingCaptureMode()
    }

    /**
     * Gets the stream that is used for photo capture.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.photocapturesource
     * @type {Integer} 
     */
    PhotoCaptureSource {
        get => this.get_PhotoCaptureSource()
    }

    /**
     * Gets a value that indicates which video streams are independent of each other.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.videodevicecharacteristic
     * @type {Integer} 
     */
    VideoDeviceCharacteristic {
        get => this.get_VideoDeviceCharacteristic()
    }

    /**
     * Gets a value that indicates if the capture device supports recording video and taking a photo at the same time.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.concurrentrecordandphotosupported
     * @type {Boolean} 
     */
    ConcurrentRecordAndPhotoSupported {
        get => this.get_ConcurrentRecordAndPhotoSupported()
    }

    /**
     * Gets a value that indicates if the capture device supports recording video and taking a photo sequence at the same time.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.concurrentrecordandphotosequencesupported
     * @type {Boolean} 
     */
    ConcurrentRecordAndPhotoSequenceSupported {
        get => this.get_ConcurrentRecordAndPhotoSequenceSupported()
    }

    /**
     * Gets a value that indicates if the device’s region requires that a sound be played when a photo or video is captured.
     * @remarks
     * App developers can use this information to determine if they should suppress playing a sound when the device takes a picture since the operating system will play a sound if it is required by the device's region. 
     * 
     * You can specify that the system should always play a shutter sound when a photo is captured by setting the [MediaCaptureInitializationSettings.AlwaysPlaySystemShutterSound](mediacaptureinitializationsettings_alwaysplaysystemshuttersound.md) property to **true** when initializing the [MediaCapture](mediacapture.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.camerasoundrequiredforregion
     * @type {Boolean} 
     */
    CameraSoundRequiredForRegion {
        get => this.get_CameraSoundRequiredForRegion()
    }

    /**
     * Gets the horizontal 35mm equivalent focal length of the camera lens on the capture device.
     * @remarks
     * The value of Horizontal35mmEquivalentFocalLength is for the current preview resolution and may change each time the resolution is changed using [VideoDeviceController.SetMediaStreamPropertiesAsync](../windows.media.devices/videodevicecontroller_setmediastreampropertiesasync_835261048.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.horizontal35mmequivalentfocallength
     * @type {IReference<Integer>} 
     */
    Horizontal35mmEquivalentFocalLength {
        get => this.get_Horizontal35mmEquivalentFocalLength()
    }

    /**
     * Gets the pitch offset of the camera in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.pitchoffsetdegrees
     * @type {IReference<Integer>} 
     */
    PitchOffsetDegrees {
        get => this.get_PitchOffsetDegrees()
    }

    /**
     * Gets the vertical 35mm equivalent focal length of the camera lens on the capture device.
     * @remarks
     * The value of Vertical35mmEquivalentFocalLength is for the current preview resolution and may change each time the resolution is changed using [VideoDeviceController.SetMediaStreamPropertiesAsync](../windows.media.devices/videodevicecontroller_setmediastreampropertiesasync_835261048.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.vertical35mmequivalentfocallength
     * @type {IReference<Integer>} 
     */
    Vertical35mmEquivalentFocalLength {
        get => this.get_Vertical35mmEquivalentFocalLength()
    }

    /**
     * Gets the media category of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.mediacategory
     * @type {Integer} 
     */
    MediaCategory {
        get => this.get_MediaCategory()
    }

    /**
     * Gets the audio processing mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.audioprocessing
     * @type {Integer} 
     */
    AudioProcessing {
        get => this.get_AudioProcessing()
    }

    /**
     * Gets an [IDirect3DDevice](../windows.graphics.directx.direct3d11/idirect3ddevice.md) representing the Direct3D device instance being used by the associated [MediaCapture](mediacapture.md) object.
     * @remarks
     * By default, the **MediaCapture** object will attempt to use the GPU for its computation and use Direct3D surfaces to image data, although this can be disabled with the [MemoryPreference](mediacaptureinitializationsettings_memorypreference.md) property. This property allows an app to access the instance of the Direct3D device used to allocate the surfaces. This is particularly useful when interoperating with other Direct3D-based APIs, such as Win2D.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturesettings.direct3d11device
     * @type {IDirect3DDevice} 
     */
    Direct3D11Device {
        get => this.get_Direct3D11Device()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioDeviceId() {
        if (!this.HasProp("__IMediaCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings := IMediaCaptureSettings(outPtr)
        }

        return this.__IMediaCaptureSettings.get_AudioDeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        if (!this.HasProp("__IMediaCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings := IMediaCaptureSettings(outPtr)
        }

        return this.__IMediaCaptureSettings.get_VideoDeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamingCaptureMode() {
        if (!this.HasProp("__IMediaCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings := IMediaCaptureSettings(outPtr)
        }

        return this.__IMediaCaptureSettings.get_StreamingCaptureMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotoCaptureSource() {
        if (!this.HasProp("__IMediaCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings := IMediaCaptureSettings(outPtr)
        }

        return this.__IMediaCaptureSettings.get_PhotoCaptureSource()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoDeviceCharacteristic() {
        if (!this.HasProp("__IMediaCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings := IMediaCaptureSettings(outPtr)
        }

        return this.__IMediaCaptureSettings.get_VideoDeviceCharacteristic()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConcurrentRecordAndPhotoSupported() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_ConcurrentRecordAndPhotoSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConcurrentRecordAndPhotoSequenceSupported() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_ConcurrentRecordAndPhotoSequenceSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CameraSoundRequiredForRegion() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_CameraSoundRequiredForRegion()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Horizontal35mmEquivalentFocalLength() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_Horizontal35mmEquivalentFocalLength()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PitchOffsetDegrees() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_PitchOffsetDegrees()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Vertical35mmEquivalentFocalLength() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_Vertical35mmEquivalentFocalLength()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaCategory() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_MediaCategory()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioProcessing() {
        if (!this.HasProp("__IMediaCaptureSettings2")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings2 := IMediaCaptureSettings2(outPtr)
        }

        return this.__IMediaCaptureSettings2.get_AudioProcessing()
    }

    /**
     * 
     * @returns {IDirect3DDevice} 
     */
    get_Direct3D11Device() {
        if (!this.HasProp("__IMediaCaptureSettings3")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureSettings3 := IMediaCaptureSettings3(outPtr)
        }

        return this.__IMediaCaptureSettings3.get_Direct3D11Device()
    }

;@endregion Instance Methods
}
