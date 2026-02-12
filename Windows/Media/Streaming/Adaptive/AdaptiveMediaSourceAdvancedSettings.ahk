#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceAdvancedSettings.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides advanced settings for an [AdaptiveMediaSource](adaptivemediasource.md).
 * @remarks
 * Get an instance of this class by accessing the [AdaptiveMediaSource.AdvancedSettings](adaptivemediasource_advancedsettings.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceadvancedsettings
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceAdvancedSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceAdvancedSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceAdvancedSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether media segments are known in advance to be fully independent such that each segment can be decoded and rendered without requiring any information from any other media segment.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceadvancedsettings.allsegmentsindependent
     * @type {Boolean} 
     */
    AllSegmentsIndependent {
        get => this.get_AllSegmentsIndependent()
        set => this.put_AllSegmentsIndependent(value)
    }

    /**
     * Gets or sets a value that specifies the minimum inbound bits per second required before the adaptive media source will switch up to one of the available encoded bitrates to download.
     * @remarks
     * For example, if the bitrate for a particular HLS stream variant or DASH representation is 1000bps and the **DesiredBitrateHeadroomRatio** is 1.2, the adaptive media source will require at least 1200bps inbound bits per second.
     * 
     * Enforcement of this property is relaxed for the lowest bitrate that contains video in order to minimize selection of audio-only bitrates.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceadvancedsettings.desiredbitrateheadroomratio
     * @type {IReference<Float>} 
     */
    DesiredBitrateHeadroomRatio {
        get => this.get_DesiredBitrateHeadroomRatio()
        set => this.put_DesiredBitrateHeadroomRatio(value)
    }

    /**
     * Gets or sets a value that specifies how low the inbound bits per second may drop before the adaptive media source will switch down to a different encoding bitrate to download.
     * @remarks
     * For example, if the current downloading bitrate for a particular HLS stream variant or DASH representation is 1000bps and the **BitrateDowngradeTriggerRatio** is 1.0, the adaptive media source will allow the inbound bits per second to drop to 1000bps before attempting to switch to a lower encoding bitrate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourceadvancedsettings.bitratedowngradetriggerratio
     * @type {IReference<Float>} 
     */
    BitrateDowngradeTriggerRatio {
        get => this.get_BitrateDowngradeTriggerRatio()
        set => this.put_BitrateDowngradeTriggerRatio(value)
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
    get_AllSegmentsIndependent() {
        if (!this.HasProp("__IAdaptiveMediaSourceAdvancedSettings")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceAdvancedSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceAdvancedSettings := IAdaptiveMediaSourceAdvancedSettings(outPtr)
        }

        return this.__IAdaptiveMediaSourceAdvancedSettings.get_AllSegmentsIndependent()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllSegmentsIndependent(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceAdvancedSettings")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceAdvancedSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceAdvancedSettings := IAdaptiveMediaSourceAdvancedSettings(outPtr)
        }

        return this.__IAdaptiveMediaSourceAdvancedSettings.put_AllSegmentsIndependent(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_DesiredBitrateHeadroomRatio() {
        if (!this.HasProp("__IAdaptiveMediaSourceAdvancedSettings")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceAdvancedSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceAdvancedSettings := IAdaptiveMediaSourceAdvancedSettings(outPtr)
        }

        return this.__IAdaptiveMediaSourceAdvancedSettings.get_DesiredBitrateHeadroomRatio()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_DesiredBitrateHeadroomRatio(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceAdvancedSettings")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceAdvancedSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceAdvancedSettings := IAdaptiveMediaSourceAdvancedSettings(outPtr)
        }

        return this.__IAdaptiveMediaSourceAdvancedSettings.put_DesiredBitrateHeadroomRatio(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_BitrateDowngradeTriggerRatio() {
        if (!this.HasProp("__IAdaptiveMediaSourceAdvancedSettings")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceAdvancedSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceAdvancedSettings := IAdaptiveMediaSourceAdvancedSettings(outPtr)
        }

        return this.__IAdaptiveMediaSourceAdvancedSettings.get_BitrateDowngradeTriggerRatio()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_BitrateDowngradeTriggerRatio(value) {
        if (!this.HasProp("__IAdaptiveMediaSourceAdvancedSettings")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceAdvancedSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceAdvancedSettings := IAdaptiveMediaSourceAdvancedSettings(outPtr)
        }

        return this.__IAdaptiveMediaSourceAdvancedSettings.put_BitrateDowngradeTriggerRatio(value)
    }

;@endregion Instance Methods
}
