#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVariablePhotoSequenceController.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the settings for a variable photo sequence.
 * @remarks
 * Get an instance of this class by accessing the [VariablePhotoSequenceController](../windows.media.devices/videodevicecontroller_variablephotosequencecontroller.md) property.
 * 
 * For how-to guidance on capturing variable photo sequences, see [Capture a photo sequence with VariablePhotoSequence](/windows/uwp/audio-video-camera/variable-photo-sequence).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class VariablePhotoSequenceController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVariablePhotoSequenceController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVariablePhotoSequenceController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether variable photo sequences are supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the maximum number of photos that can be taken per second in a variable photo sequence.
     * @remarks
     * To set the frame rate of a variable photo sequence, use [PhotosPerSecondLimit](variablephotosequencecontroller_photospersecondlimit.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.maxphotospersecond
     * @type {Float} 
     */
    MaxPhotosPerSecond {
        get => this.get_MaxPhotosPerSecond()
    }

    /**
     * Gets or sets the number of photos that are taken per second in a variable photo sequence.
     * @remarks
     * To determine the maximum number of photos per second supported by the capture device, check the [MaxPhotosPerSecond](variablephotosequencecontroller_maxphotospersecond.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.photospersecondlimit
     * @type {Float} 
     */
    PhotosPerSecondLimit {
        get => this.get_PhotosPerSecondLimit()
        set => this.put_PhotosPerSecondLimit(value)
    }

    /**
     * Gets a [FrameControlCapabilities](framecontrolcapabilities.md) object that provides information about the variable photo sequence capabilities of the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.framecapabilities
     * @type {FrameControlCapabilities} 
     */
    FrameCapabilities {
        get => this.get_FrameCapabilities()
    }

    /**
     * Gets the list of [FrameController](framecontroller.md) objects that determine the settings for each frame in a variable photo sequence.
     * @remarks
     * The maximum number of frame controllers that can be used at a time is 18.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.desiredframecontrollers
     * @type {IVector<FrameController>} 
     */
    DesiredFrameControllers {
        get => this.get_DesiredFrameControllers()
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
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.get_Supported()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPhotosPerSecond() {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.get_MaxPhotosPerSecond()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PhotosPerSecondLimit() {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.get_PhotosPerSecondLimit()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PhotosPerSecondLimit(value) {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.put_PhotosPerSecondLimit(value)
    }

    /**
     * Gets the highest frame rate supported when video and a variable photo sequence are being captured concurrently.
     * @param {IMediaEncodingProperties} captureProperties The media encoding properties.
     * @returns {MediaRatio} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.gethighestconcurrentframerate
     */
    GetHighestConcurrentFrameRate(captureProperties) {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.GetHighestConcurrentFrameRate(captureProperties)
    }

    /**
     * Gets the current frame rate at which pictures can be taken in a variable photo sequence.
     * @returns {MediaRatio} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.variablephotosequencecontroller.getcurrentframerate
     */
    GetCurrentFrameRate() {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.GetCurrentFrameRate()
    }

    /**
     * 
     * @returns {FrameControlCapabilities} 
     */
    get_FrameCapabilities() {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.get_FrameCapabilities()
    }

    /**
     * 
     * @returns {IVector<FrameController>} 
     */
    get_DesiredFrameControllers() {
        if (!this.HasProp("__IVariablePhotoSequenceController")) {
            if ((queryResult := this.QueryInterface(IVariablePhotoSequenceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVariablePhotoSequenceController := IVariablePhotoSequenceController(outPtr)
        }

        return this.__IVariablePhotoSequenceController.get_DesiredFrameControllers()
    }

;@endregion Instance Methods
}
