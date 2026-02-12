#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownPerceptionInfraredFrameSourcePropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties of infrared frame sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class KnownPerceptionInfraredFrameSourceProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string key used to retrieve a TimeSpan property indicating the current exposure duration of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.exposure
     * @type {HSTRING} 
     */
    static Exposure {
        get => KnownPerceptionInfraredFrameSourceProperties.get_Exposure()
    }

    /**
     * Gets a string key used to retrieve a Boolean property indicating whether or not auto exposure is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.autoexposureenabled
     * @type {HSTRING} 
     */
    static AutoExposureEnabled {
        get => KnownPerceptionInfraredFrameSourceProperties.get_AutoExposureEnabled()
    }

    /**
     * Gets a string key used to retrieve a single-precision, floating-point property indicating the amount of exposure compensation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.exposurecompensation
     * @type {HSTRING} 
     */
    static ExposureCompensation {
        get => KnownPerceptionInfraredFrameSourceProperties.get_ExposureCompensation()
    }

    /**
     * Gets a string key used to retrieve a Boolean property indicating whether or not active IR illumination is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.activeilluminationenabled
     * @type {HSTRING} 
     */
    static ActiveIlluminationEnabled {
        get => KnownPerceptionInfraredFrameSourceProperties.get_ActiveIlluminationEnabled()
    }

    /**
     * Gets a string key used to retrieve a Boolean property indicating whether or not ambient IR light subtraction is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.ambientsubtractionenabled
     * @type {HSTRING} 
     */
    static AmbientSubtractionEnabled {
        get => KnownPerceptionInfraredFrameSourceProperties.get_AmbientSubtractionEnabled()
    }

    /**
     * Gets a string key used to retrieve a Boolean property indicating whether or not the structured light pattern is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.structurelightpatternenabled
     * @type {HSTRING} 
     */
    static StructureLightPatternEnabled {
        get => KnownPerceptionInfraredFrameSourceProperties.get_StructureLightPatternEnabled()
    }

    /**
     * Gets a string key used to retrieve a Boolean property indicating whether or not interleaved illumination is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.knownperceptioninfraredframesourceproperties.interleavedilluminationenabled
     * @type {HSTRING} 
     */
    static InterleavedIlluminationEnabled {
        get => KnownPerceptionInfraredFrameSourceProperties.get_InterleavedIlluminationEnabled()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Exposure() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_Exposure()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AutoExposureEnabled() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_AutoExposureEnabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ExposureCompensation() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_ExposureCompensation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ActiveIlluminationEnabled() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_ActiveIlluminationEnabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AmbientSubtractionEnabled() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_AmbientSubtractionEnabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_StructureLightPatternEnabled() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_StructureLightPatternEnabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_InterleavedIlluminationEnabled() {
        if (!KnownPerceptionInfraredFrameSourceProperties.HasProp("__IKnownPerceptionInfraredFrameSourcePropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownPerceptionInfraredFrameSourcePropertiesStatics.IID)
            KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics := IKnownPerceptionInfraredFrameSourcePropertiesStatics(factoryPtr)
        }

        return KnownPerceptionInfraredFrameSourceProperties.__IKnownPerceptionInfraredFrameSourcePropertiesStatics.get_InterleavedIlluminationEnabled()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
