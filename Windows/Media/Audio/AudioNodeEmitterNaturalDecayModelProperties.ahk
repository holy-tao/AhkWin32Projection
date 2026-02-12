#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioNodeEmitterNaturalDecayModelProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the characteristics of a natural [AudioNodeEmitterDecayModel](audionodeemitterdecaymodel.md).
 * @remarks
 * Create a natural emitter decay model by calling [AudioNodeEmitterDecayModel.CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md). After creating the model, read-only access to the natural decay model properties is provided by the [NaturalProperties](audionodeemitterdecaymodel_naturalproperties.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitternaturaldecaymodelproperties
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterNaturalDecayModelProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioNodeEmitterNaturalDecayModelProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioNodeEmitterNaturalDecayModelProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the distance at which the signal gain is unaffected by the decay model.
     * @remarks
     * The distance value is expressed in meters, but can be scaled by setting the [AudioNodeEmitter.DistanceScale](audionodeemitter_distancescale.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitternaturaldecaymodelproperties.unitygaindistance
     * @type {Float} 
     */
    UnityGainDistance {
        get => this.get_UnityGainDistance()
    }

    /**
     * Gets a value indicating the distance at which the gain reaches the minimum gain value specified when the model was created with a call to [AudioNodeEmitterDecayModel.CreateNatural](audionodeemitterdecaymodel_createnatural_887095524.md).
     * @remarks
     * The distance value is expressed in meters, but can be scaled by setting the [AudioNodeEmitter.DistanceScale](audionodeemitter_distancescale.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitternaturaldecaymodelproperties.cutoffdistance
     * @type {Float} 
     */
    CutoffDistance {
        get => this.get_CutoffDistance()
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
    get_UnityGainDistance() {
        if (!this.HasProp("__IAudioNodeEmitterNaturalDecayModelProperties")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterNaturalDecayModelProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterNaturalDecayModelProperties := IAudioNodeEmitterNaturalDecayModelProperties(outPtr)
        }

        return this.__IAudioNodeEmitterNaturalDecayModelProperties.get_UnityGainDistance()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CutoffDistance() {
        if (!this.HasProp("__IAudioNodeEmitterNaturalDecayModelProperties")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterNaturalDecayModelProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterNaturalDecayModelProperties := IAudioNodeEmitterNaturalDecayModelProperties(outPtr)
        }

        return this.__IAudioNodeEmitterNaturalDecayModelProperties.get_CutoffDistance()
    }

;@endregion Instance Methods
}
