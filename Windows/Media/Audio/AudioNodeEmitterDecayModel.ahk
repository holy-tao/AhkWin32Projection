#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioNodeEmitterDecayModel.ahk
#Include .\IAudioNodeEmitterDecayModelStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the model used to compute the distance-based attenuation of a signal from an [AudioNodeEmitter](audionodeemitter.md).
 * @remarks
 * Create an instance of this class by calling [CreateCustom](audionodeemitterdecaymodel_createcustom_675347716.md) or [CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterDecayModel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioNodeEmitterDecayModel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioNodeEmitterDecayModel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an [AudioNodeEmitterDecayModel](audionodeemitterdecaymodel.md) with a natural roll-off model using a distance-squared formula.
     * @remarks
     * The distance values for *unityGainDistance* and *cutoffDistance* are expressed in meters, but can be scaled by setting the [AudioNodeEmitter.DistanceScale](audionodeemitter_distancescale.md) property.
     * 
     * The *minGain* parameter value must be greater than or equal to 1.58439*10<sup>-5</sup>, and the *maxGain* parameter must be less than or equal to 3.98. In decibels, these limits map to a range of -96 dB to 12 dB. Convert from a decibel value to amplitude scale using the equation *gain = 10<sup>(dB/20)</sup>* where *dB* is the decibel value you wish to convert.
     * @param {Float} minGain The minimum gain applied to the signal.
     * @param {Float} maxGain The maximum gain applied to the signal.
     * @param {Float} unityGainDistance The distance at which the gain of the signal is unaffected by decay.
     * @param {Float} cutoffDistance The distance at which the gain is *minGain*.
     * @returns {AudioNodeEmitterDecayModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel.createnatural
     */
    static CreateNatural(minGain, maxGain, unityGainDistance, cutoffDistance) {
        if (!AudioNodeEmitterDecayModel.HasProp("__IAudioNodeEmitterDecayModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeEmitterDecayModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioNodeEmitterDecayModelStatics.IID)
            AudioNodeEmitterDecayModel.__IAudioNodeEmitterDecayModelStatics := IAudioNodeEmitterDecayModelStatics(factoryPtr)
        }

        return AudioNodeEmitterDecayModel.__IAudioNodeEmitterDecayModelStatics.CreateNatural(minGain, maxGain, unityGainDistance, cutoffDistance)
    }

    /**
     * Creates a new [AudioNodeEmitterDecayModel](audionodeemitterdecaymodel.md) that uses the specified minimum and maximum gain values to compute distance-based attenuation of a signal from an [AudioNodeEmitter](audionodeemitter.md).
     * @remarks
     * The *minGain* parameter value must be greater than or equal to 1.58439*10<sup>-5</sup>, and the *maxGain* parameter must be less than or equal to 3.98. In decibels, these limits map to a range of -96 dB to 12 dB. Convert from a decibel value to amplitude scale using the equation *gain = 10<sup>(dB/20)</sup>* where *dB* is the decibel value you wish to convert.
     * @param {Float} minGain The minimum gain level for the signal.
     * @param {Float} maxGain The maximum gain level for the signal.
     * @returns {AudioNodeEmitterDecayModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel.createcustom
     */
    static CreateCustom(minGain, maxGain) {
        if (!AudioNodeEmitterDecayModel.HasProp("__IAudioNodeEmitterDecayModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeEmitterDecayModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioNodeEmitterDecayModelStatics.IID)
            AudioNodeEmitterDecayModel.__IAudioNodeEmitterDecayModelStatics := IAudioNodeEmitterDecayModelStatics(factoryPtr)
        }

        return AudioNodeEmitterDecayModel.__IAudioNodeEmitterDecayModelStatics.CreateCustom(minGain, maxGain)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating the type of the decay model.
     * @remarks
     * Create a [Natural](audionodeemitterdecaykind.md) decay model by calling [CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md). Create a [Custom](audionodeemitterdecaykind.md) decay model by calling [CreateCustom](audionodeemitterdecaymodel_createcustom_675347716.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the minimum gain applied to the signal as a result of the decay model.
     * @remarks
     * Specify the minimum gain of an [AudioNodeEmitterDecayModel](audionodeemitterdecaymodel.md) by calling [CreateCustom](audionodeemitterdecaymodel_createcustom_675347716.md) or [CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel.mingain
     * @type {Float} 
     */
    MinGain {
        get => this.get_MinGain()
    }

    /**
     * Gets the maximum gain applied to the signal as a result of the decay model.
     * @remarks
     * Specify the maximum gain of an [AudioNodeEmitterDecayModel](audionodeemitterdecaymodel.md) by calling [CreateCustom](audionodeemitterdecaymodel_createcustom_675347716.md) or [CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel.maxgain
     * @type {Float} 
     */
    MaxGain {
        get => this.get_MaxGain()
    }

    /**
     * Gets the properties of a natural [AudioNodeEmitterDecayModel](audionodeemitterdecaymodel.md).
     * @remarks
     * Set the properties of a natural decay model by calling [CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitterdecaymodel.naturalproperties
     * @type {AudioNodeEmitterNaturalDecayModelProperties} 
     */
    NaturalProperties {
        get => this.get_NaturalProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IAudioNodeEmitterDecayModel")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterDecayModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterDecayModel := IAudioNodeEmitterDecayModel(outPtr)
        }

        return this.__IAudioNodeEmitterDecayModel.get_Kind()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinGain() {
        if (!this.HasProp("__IAudioNodeEmitterDecayModel")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterDecayModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterDecayModel := IAudioNodeEmitterDecayModel(outPtr)
        }

        return this.__IAudioNodeEmitterDecayModel.get_MinGain()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxGain() {
        if (!this.HasProp("__IAudioNodeEmitterDecayModel")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterDecayModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterDecayModel := IAudioNodeEmitterDecayModel(outPtr)
        }

        return this.__IAudioNodeEmitterDecayModel.get_MaxGain()
    }

    /**
     * 
     * @returns {AudioNodeEmitterNaturalDecayModelProperties} 
     */
    get_NaturalProperties() {
        if (!this.HasProp("__IAudioNodeEmitterDecayModel")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterDecayModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterDecayModel := IAudioNodeEmitterDecayModel(outPtr)
        }

        return this.__IAudioNodeEmitterDecayModel.get_NaturalProperties()
    }

;@endregion Instance Methods
}
