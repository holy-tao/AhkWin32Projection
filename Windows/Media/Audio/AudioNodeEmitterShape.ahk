#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioNodeEmitterShape.ahk
#Include .\IAudioNodeEmitterShapeStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the shape in which an [AudioNodeEmitter](audionodeemitter.md) emits audio.
 * @remarks
 * Create a cone emitter shape by calling [CreateCone](audionodeemittershape_createcone_1260552697.md). Create an omnidirectional emitter by calling [CreateOmnidirectional](audionodeemittershape_createomnidirectional_200506124.md). Assign an emitter shape to an emitter by calling the overload of the [AudioNodeEmitter](audionodeemitter_audionodeemitter_695720720.md) constructor. After the emitter has been created, retrieve the associated **AudioEmitterShape** object with the [AudioNodeEmitter.Shape](audionodeemitter_shape.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittershape
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitterShape extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioNodeEmitterShape

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioNodeEmitterShape.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [AudioNodeEmitterShape](audionodeemittershape.md) representing a cone shape.
     * @param {Float} innerAngle The inner angle of an audio node emitter cone shape, where the audio signal is not attenuated at all, expressed in radians.
     * @param {Float} outerAngle The outer angle of an audio node emitter cone shape, where the audio signal is fully attenuated, expressed in radians.
     * @param {Float} outerAngleGain A value indicating the gain applied at the outer angle of the cone.
     * @returns {AudioNodeEmitterShape} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittershape.createcone
     */
    static CreateCone(innerAngle, outerAngle, outerAngleGain) {
        if (!AudioNodeEmitterShape.HasProp("__IAudioNodeEmitterShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeEmitterShape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioNodeEmitterShapeStatics.IID)
            AudioNodeEmitterShape.__IAudioNodeEmitterShapeStatics := IAudioNodeEmitterShapeStatics(factoryPtr)
        }

        return AudioNodeEmitterShape.__IAudioNodeEmitterShapeStatics.CreateCone(innerAngle, outerAngle, outerAngleGain)
    }

    /**
     * Creates an instance of [AudioNodeEmitterShape](audionodeemittershape.md) that is omnidirectional, meaning that the audio signal attenuation is the same regardless of the emitter's [Direction](audionodeemitter_direction.md).
     * @returns {AudioNodeEmitterShape} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittershape.createomnidirectional
     */
    static CreateOmnidirectional() {
        if (!AudioNodeEmitterShape.HasProp("__IAudioNodeEmitterShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeEmitterShape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioNodeEmitterShapeStatics.IID)
            AudioNodeEmitterShape.__IAudioNodeEmitterShapeStatics := IAudioNodeEmitterShapeStatics(factoryPtr)
        }

        return AudioNodeEmitterShape.__IAudioNodeEmitterShapeStatics.CreateOmnidirectional()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating the kind of shape represented by the [AudioNodeEmitterShape](audionodeemittershape.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittershape.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets an object that defines the characteristics of an emitter's cone shape, including the inner and outer angle of the cone and the gain applied to the signal at the outer angle.
     * @remarks
     * Create a cone emitter shape by calling [CreateCone](audionodeemittershape_createcone_1260552697.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemittershape.coneproperties
     * @type {AudioNodeEmitterConeProperties} 
     */
    ConeProperties {
        get => this.get_ConeProperties()
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
        if (!this.HasProp("__IAudioNodeEmitterShape")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterShape := IAudioNodeEmitterShape(outPtr)
        }

        return this.__IAudioNodeEmitterShape.get_Kind()
    }

    /**
     * 
     * @returns {AudioNodeEmitterConeProperties} 
     */
    get_ConeProperties() {
        if (!this.HasProp("__IAudioNodeEmitterShape")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitterShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitterShape := IAudioNodeEmitterShape(outPtr)
        }

        return this.__IAudioNodeEmitterShape.get_ConeProperties()
    }

;@endregion Instance Methods
}
