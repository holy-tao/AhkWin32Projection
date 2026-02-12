#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioDeviceController.ahk
#Include .\IMediaDeviceController.ahk
#Include .\IAudioDeviceController2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Controls device settings on the microphone.
 * @remarks
 * To get an instance of this object, retrieve the [MediaCapture.AudioDeviceController](../windows.media.capture/mediacapture_audiodevicecontroller.md) property.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AudioDeviceController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioDeviceController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioDeviceController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Mutes or unmutes the microphone.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller.muted
     * @type {Boolean} 
     */
    Muted {
        get => this.get_Muted()
        set => this.put_Muted(value)
    }

    /**
     * Gets or sets the volume of the microphone.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller.volumepercent
     * @type {Float} 
     */
    VolumePercent {
        get => this.get_VolumePercent()
        set => this.put_VolumePercent(value)
    }

    /**
     * Gets the [AudioCaptureEffectsManager](/uwp/api/windows.media.effects.audiocaptureeffectsmanager) associated with the **AudioDeviceController**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller.audiocaptureeffectsmanager
     * @type {AudioCaptureEffectsManager} 
     */
    AudioCaptureEffectsManager {
        get => this.get_AudioCaptureEffectsManager()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Muted(value) {
        if (!this.HasProp("__IAudioDeviceController")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceController := IAudioDeviceController(outPtr)
        }

        return this.__IAudioDeviceController.put_Muted(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Muted() {
        if (!this.HasProp("__IAudioDeviceController")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceController := IAudioDeviceController(outPtr)
        }

        return this.__IAudioDeviceController.get_Muted()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VolumePercent(value) {
        if (!this.HasProp("__IAudioDeviceController")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceController := IAudioDeviceController(outPtr)
        }

        return this.__IAudioDeviceController.put_VolumePercent(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VolumePercent() {
        if (!this.HasProp("__IAudioDeviceController")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceController := IAudioDeviceController(outPtr)
        }

        return this.__IAudioDeviceController.get_VolumePercent()
    }

    /**
     * Gets a list of the supported encoding properties for the device.
     * @param {Integer} mediaStreamType_ The type of media stream for which to get the properties.
     * @returns {IVectorView<IMediaEncodingProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller.getavailablemediastreamproperties
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
     * Gets the encoding properties for the specified media stream type for the device.
     * @param {Integer} mediaStreamType_ The type of media stream for which to get the properties.
     * @returns {IMediaEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller.getmediastreamproperties
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
     * Sets the encoding properties asynchronously for the specified media stream type for the device.
     * @param {Integer} mediaStreamType_ The type of media stream for which to set the properties.
     * @param {IMediaEncodingProperties} mediaEncodingProperties The encoding properties to set.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicecontroller.setmediastreampropertiesasync
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
     * 
     * @returns {AudioCaptureEffectsManager} 
     */
    get_AudioCaptureEffectsManager() {
        if (!this.HasProp("__IAudioDeviceController2")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceController2 := IAudioDeviceController2(outPtr)
        }

        return this.__IAudioDeviceController2.get_AudioCaptureEffectsManager()
    }

;@endregion Instance Methods
}
