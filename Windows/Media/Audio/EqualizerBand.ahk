#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEqualizerBand.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an equalizer band for the equalizer effect.
 * @remarks
 * Get an instance of this class by accessing the [EqualizerEffectDefinition.Bands](equalizereffectdefinition_bands.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizerband
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class EqualizerBand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEqualizerBand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEqualizerBand.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the bandwidth for the equalizer band.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizerband.bandwidth
     * @type {Float} 
     */
    Bandwidth {
        get => this.get_Bandwidth()
        set => this.put_Bandwidth(value)
    }

    /**
     * Gets or sets the frequency center for the equalizer band.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizerband.frequencycenter
     * @type {Float} 
     */
    FrequencyCenter {
        get => this.get_FrequencyCenter()
        set => this.put_FrequencyCenter(value)
    }

    /**
     * Gets or sets the gain for the equalizer band.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizerband.gain
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Bandwidth() {
        if (!this.HasProp("__IEqualizerBand")) {
            if ((queryResult := this.QueryInterface(IEqualizerBand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerBand := IEqualizerBand(outPtr)
        }

        return this.__IEqualizerBand.get_Bandwidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Bandwidth(value) {
        if (!this.HasProp("__IEqualizerBand")) {
            if ((queryResult := this.QueryInterface(IEqualizerBand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerBand := IEqualizerBand(outPtr)
        }

        return this.__IEqualizerBand.put_Bandwidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FrequencyCenter() {
        if (!this.HasProp("__IEqualizerBand")) {
            if ((queryResult := this.QueryInterface(IEqualizerBand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerBand := IEqualizerBand(outPtr)
        }

        return this.__IEqualizerBand.get_FrequencyCenter()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FrequencyCenter(value) {
        if (!this.HasProp("__IEqualizerBand")) {
            if ((queryResult := this.QueryInterface(IEqualizerBand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerBand := IEqualizerBand(outPtr)
        }

        return this.__IEqualizerBand.put_FrequencyCenter(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Gain() {
        if (!this.HasProp("__IEqualizerBand")) {
            if ((queryResult := this.QueryInterface(IEqualizerBand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerBand := IEqualizerBand(outPtr)
        }

        return this.__IEqualizerBand.get_Gain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Gain(value) {
        if (!this.HasProp("__IEqualizerBand")) {
            if ((queryResult := this.QueryInterface(IEqualizerBand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerBand := IEqualizerBand(outPtr)
        }

        return this.__IEqualizerBand.put_Gain(value)
    }

;@endregion Instance Methods
}
