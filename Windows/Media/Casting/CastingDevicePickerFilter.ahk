#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingDevicePickerFilter.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the filter used to determine which devices to show in a casting device picker UI. The filter parameters are OR-ed together to build the resulting filter. In other words, if [SupportsAudio](castingdevicepickerfilter_supportsaudio.md) and [SupportsVideo](castingdevicepickerfilter_supportsvideo.md) are both true, the picker will display Audio-only devices, video-only devices, and audio/video devices.
 * @remarks
 * Get an instance of this class by accessing the [CastingDevicePicker.Filter](castingdevicepicker_filter.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepickerfilter
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingDevicePickerFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingDevicePickerFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingDevicePickerFilter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets whether the devices in the device picker should support audio playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepickerfilter.supportsaudio
     * @type {Boolean} 
     */
    SupportsAudio {
        get => this.get_SupportsAudio()
        set => this.put_SupportsAudio(value)
    }

    /**
     * Gets and sets whether the devices in the device picker should support video playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepickerfilter.supportsvideo
     * @type {Boolean} 
     */
    SupportsVideo {
        get => this.get_SupportsVideo()
        set => this.put_SupportsVideo(value)
    }

    /**
     * Gets and sets whether the devices in the device picker should support rending still images.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepickerfilter.supportspictures
     * @type {Boolean} 
     */
    SupportsPictures {
        get => this.get_SupportsPictures()
        set => this.put_SupportsPictures(value)
    }

    /**
     * Gets the casting sources supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdevicepickerfilter.supportedcastingsources
     * @type {IVector<CastingSource>} 
     */
    SupportedCastingSources {
        get => this.get_SupportedCastingSources()
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
    get_SupportsAudio() {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.get_SupportsAudio()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsAudio(value) {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.put_SupportsAudio(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVideo() {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.get_SupportsVideo()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsVideo(value) {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.put_SupportsVideo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsPictures() {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.get_SupportsPictures()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsPictures(value) {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.put_SupportsPictures(value)
    }

    /**
     * 
     * @returns {IVector<CastingSource>} 
     */
    get_SupportedCastingSources() {
        if (!this.HasProp("__ICastingDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(ICastingDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDevicePickerFilter := ICastingDevicePickerFilter(outPtr)
        }

        return this.__ICastingDevicePickerFilter.get_SupportedCastingSources()
    }

;@endregion Instance Methods
}
