#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionColorFrameSourcePropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties of color frame sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioncolorframesourceproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionColorFrameSourceProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string key used to retrieve a TimeSpan property indicating the current exposure duration of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioncolorframesourceproperties.exposure
     * @type {HSTRING} 
     */
    static Exposure {
        get => KnownPerceptionColorFrameSourceProperties.get_Exposure()
    }

    /**
     * Gets a string key used to retrieve a Boolean property indicating whether or not auto exposure is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioncolorframesourceproperties.autoexposureenabled
     * @type {HSTRING} 
     */
    static AutoExposureEnabled {
        get => KnownPerceptionColorFrameSourceProperties.get_AutoExposureEnabled()
    }

    /**
     * Gets a string key used to retrieve a single-precision, floating-point property indicating the exposure compensation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioncolorframesourceproperties.exposurecompensation
     * @type {HSTRING} 
     */
    static ExposureCompensation {
        get => KnownPerceptionColorFrameSourceProperties.get_ExposureCompensation()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Exposure() {
        if (!KnownPerceptionColorFrameSourceProperties.HasProp("__IKnownPerceptionColorFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionColorFrameSourcePropertiesStatics.IID)
            KnownPerceptionColorFrameSourceProperties.__IKnownPerceptionColorFrameSourcePropertiesStatics := IKnownPerceptionColorFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionColorFrameSourceProperties.__IKnownPerceptionColorFrameSourcePropertiesStatics.get_Exposure()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AutoExposureEnabled() {
        if (!KnownPerceptionColorFrameSourceProperties.HasProp("__IKnownPerceptionColorFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionColorFrameSourcePropertiesStatics.IID)
            KnownPerceptionColorFrameSourceProperties.__IKnownPerceptionColorFrameSourcePropertiesStatics := IKnownPerceptionColorFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionColorFrameSourceProperties.__IKnownPerceptionColorFrameSourcePropertiesStatics.get_AutoExposureEnabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ExposureCompensation() {
        if (!KnownPerceptionColorFrameSourceProperties.HasProp("__IKnownPerceptionColorFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionColorFrameSourcePropertiesStatics.IID)
            KnownPerceptionColorFrameSourceProperties.__IKnownPerceptionColorFrameSourcePropertiesStatics := IKnownPerceptionColorFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionColorFrameSourceProperties.__IKnownPerceptionColorFrameSourcePropertiesStatics.get_ExposureCompensation()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
