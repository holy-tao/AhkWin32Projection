#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameSourceController.ahk
#Include .\IMediaFrameSourceController2.ahk
#Include .\IMediaFrameSourceController3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Allows you to get and set properties of a [MediaFrameSource](mediaframesource.md) and to get a [VideoDeviceController](../windows.media.devices/videodevicecontroller.md), which provides camera controls such as exposure, focus, and zoom.
 * @remarks
 * Get an instance of the MediaFrameSourceController class by accessing the [Controller](mediaframesource_controller.md) property of a [MediaFrameSource](mediaframesource.md).
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSourceController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameSourceController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameSourceController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [VideoDeviceController](../windows.media.devices/videodevicecontroller.md) for a [MediaFrameSource](mediaframesource.md), which provides camera controls such as exposure, focus, and zoom.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller.videodevicecontroller
     * @type {VideoDeviceController} 
     */
    VideoDeviceController {
        get => this.get_VideoDeviceController()
    }

    /**
     * Gets an [AudioDeviceController](../windows.media.devices/audiodevicecontroller.md) for a [MediaFrameSource](mediaframesource.md), which provides controls such as setting the volume level or muting the audio device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller.audiodevicecontroller
     * @type {AudioDeviceController} 
     */
    AudioDeviceController {
        get => this.get_AudioDeviceController()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously gets an object that contains the value of a [MediaFrameSource](mediaframesource.md) property, if the property value is successfully retrieved, and describes the result status of the get operation.
     * @remarks
     * To set the value of a media frame source property, use [SetPropertyAsync](mediaframesourcecontroller_setpropertyasync_419187035.md).
     * 
     * Common device properties are exposed as properties of the [VideoDeviceController](/uwp/api/Windows.Media.Devices.VideoDeviceController) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {HSTRING} propertyId The identifier of the media frame source property to be retrieved.
     * @returns {IAsyncOperation<MediaFrameSourceGetPropertyResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller.getpropertyasync
     */
    GetPropertyAsync(propertyId) {
        if (!this.HasProp("__IMediaFrameSourceController")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceController := IMediaFrameSourceController(outPtr)
        }

        return this.__IMediaFrameSourceController.GetPropertyAsync(propertyId)
    }

    /**
     * Asynchronously sets the value of a [MediaFrameSource](mediaframesource.md) property and returns a [MediaFrameSourceSetPropertyStatus](mediaframesourcesetpropertystatus.md) object describing the result status of the set operation.
     * @remarks
     * To get the value of a media frame source property, use [GetPropertyAsync](mediaframesourcecontroller_getpropertyasync_1561087689.md).
     * 
     * Common device properties are exposed as properties of the [VideoDeviceController](/uwp/api/Windows.Media.Devices.VideoDeviceController) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {HSTRING} propertyId The identifier of the media frame source property to be set.
     * @param {IInspectable} propertyValue_ The value of the media frame source property to be set.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller.setpropertyasync
     */
    SetPropertyAsync(propertyId, propertyValue_) {
        if (!this.HasProp("__IMediaFrameSourceController")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceController := IMediaFrameSourceController(outPtr)
        }

        return this.__IMediaFrameSourceController.SetPropertyAsync(propertyId, propertyValue_)
    }

    /**
     * 
     * @returns {VideoDeviceController} 
     */
    get_VideoDeviceController() {
        if (!this.HasProp("__IMediaFrameSourceController")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceController := IMediaFrameSourceController(outPtr)
        }

        return this.__IMediaFrameSourceController.get_VideoDeviceController()
    }

    /**
     * Asynchronously gets the value of the property with the specified ID from a [MediaFrameSource](mediaframesource.md), using an extended ID with custom header information and specifying the maximum buffer size required to store the result.
     * @remarks
     * Common device properties are exposed as properties of the [VideoDeviceController](/uwp/api/Windows.Media.Devices.VideoDeviceController) class. Additional properties are defined in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set. Legacy properties are defined in the [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) property set. For an example of accessing camera properties by ID, see the [Extended Control and Metadata sample](https://github.com/microsoft/Windows-Camera/tree/master/Samples/ExtendedControlAndMetadata).
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId A byte array containing the extended identifier data.
     * @param {IReference<Integer>} maxPropertyValueSize The size of the buffer that should be allocated to store the result of the operation. If the driver does not require that a size be specified for the returned property, set this value to null. If the size is required, and you do not provide a value, the [Status](../windows.media.devices/videodevicecontrollergetdevicepropertyresult_status.md) property of the returned [VideoDeviceControllerGetDevicePropertyResult](../windows.media.devices/videodevicecontrollergetdevicepropertyresult.md) object will be **MaxPropertyValueSizeRequired**. If the value supplied is too small to store the result of the operation, the returned **Status**  object will be **MaxPropertyValueSizeTooSmall**, which means that you can retry the call with a larger buffer size.
     * @returns {IAsyncOperation<MediaFrameSourceGetPropertyResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller.getpropertybyextendedidasync
     */
    GetPropertyByExtendedIdAsync(extendedPropertyId_length, extendedPropertyId, maxPropertyValueSize) {
        if (!this.HasProp("__IMediaFrameSourceController2")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceController2 := IMediaFrameSourceController2(outPtr)
        }

        return this.__IMediaFrameSourceController2.GetPropertyByExtendedIdAsync(extendedPropertyId_length, extendedPropertyId, maxPropertyValueSize)
    }

    /**
     * Asynchronously sets the value of the property with the specified ID on a [MediaFrameSource](mediaframesource.md), using an extended ID with custom header information.
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId A byte array containing the extended identifier data.
     * @param {Integer} propertyValue_length 
     * @param {Pointer<Integer>} propertyValue A byte array containing the value to be set for the property.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcecontroller.setpropertybyextendedidasync
     */
    SetPropertyByExtendedIdAsync(extendedPropertyId_length, extendedPropertyId, propertyValue_length, propertyValue) {
        if (!this.HasProp("__IMediaFrameSourceController2")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceController2 := IMediaFrameSourceController2(outPtr)
        }

        return this.__IMediaFrameSourceController2.SetPropertyByExtendedIdAsync(extendedPropertyId_length, extendedPropertyId, propertyValue_length, propertyValue)
    }

    /**
     * 
     * @returns {AudioDeviceController} 
     */
    get_AudioDeviceController() {
        if (!this.HasProp("__IMediaFrameSourceController3")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceController3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceController3 := IMediaFrameSourceController3(outPtr)
        }

        return this.__IMediaFrameSourceController3.get_AudioDeviceController()
    }

;@endregion Instance Methods
}
