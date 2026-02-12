#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioNodeEmitter.ahk
#Include .\IAudioNodeEmitter2.ahk
#Include .\IAudioNodeEmitterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the position and other physical characteristics of an emitter from which the audio of an [AudioGraph](audiograph.md) node is emitted when spatial audio processing is used.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeEmitter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioNodeEmitter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioNodeEmitter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [AudioNodeEmitter](audionodeemitter.md) class with the specified emitter characteristics.
     * @param {AudioNodeEmitterShape} shape_ An object describing the shape in which audio is emitted.
     * @param {AudioNodeEmitterDecayModel} decayModel An object describing the decay model for emitted audio.
     * @param {Integer} settings Flags specifying additional settings for the emitter.
     * @returns {AudioNodeEmitter} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.#ctor
     */
    static CreateAudioNodeEmitter(shape_, decayModel, settings) {
        if (!AudioNodeEmitter.HasProp("__IAudioNodeEmitterFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeEmitter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioNodeEmitterFactory.IID)
            AudioNodeEmitter.__IAudioNodeEmitterFactory := IAudioNodeEmitterFactory(factoryPtr)
        }

        return AudioNodeEmitter.__IAudioNodeEmitterFactory.CreateAudioNodeEmitter(shape_, decayModel, settings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a vector representing the position of the emitter in 3D space, expressed in meters.
     * @remarks
     * The positions of all of the emitters in the graph are relative to the position and orientation of the [AudioNodeListener](audionodelistener.md) object assigned to the [AudioDeviceOutputNode](audiodeviceoutputnode.md) for the audio graph. By default, the listener is located at the origin (0,0,0) facing forward along the Z axis, but you can set its position and orientation with the [Position](audionodelistener_position.md) and [Orientation](audionodelistener_orientation.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * A vector expressing the direction in which audio is emitted from the [AudioNodeEmitter](audionodeemitter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.direction
     * @type {Vector3} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * Gets an object describing the shape in which the emitter emits audio.
     * @remarks
     * Create an [AudioNodeEmitter](audionodeemitter.md) with a particular shape by using the overload of the [AudioNodeEmitter constructor](audionodeemitter_audionodeemitter_695720720.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.shape
     * @type {AudioNodeEmitterShape} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * Gets an object describing the decay model for the [AudioNodeEmitter](audionodeemitter.md).
     * @remarks
     * Create an [AudioNodeEmitter](audionodeemitter.md) with a decay model by using the overload of the [AudioNodeEmitter constructor](audionodeemitter_audionodeemitter_695720720.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.decaymodel
     * @type {AudioNodeEmitterDecayModel} 
     */
    DecayModel {
        get => this.get_DecayModel()
    }

    /**
     * Gets or sets a value indicating the gain applied to the signal by the emitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.gain
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

    /**
     * Gets or sets the scale of the position of the emitter. All distances used when calculating spatial audio effects are expressed in meters. Setting this value allows you to automatically scale the calculations to use some other unit.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.distancescale
     * @type {Float} 
     */
    DistanceScale {
        get => this.get_DistanceScale()
        set => this.put_DistanceScale(value)
    }

    /**
     * Gets or sets the scale of the doppler velocity of the emitter. The [DopplerVelocity](audionodeemitter_dopplervelocity.md) of an emitter is expressed in meters per second. Setting this value allows you to automatically scale the velocity to some other unit.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.dopplerscale
     * @type {Float} 
     */
    DopplerScale {
        get => this.get_DopplerScale()
        set => this.put_DopplerScale(value)
    }

    /**
     * Gets or sets a [Vector3](../windows.foundation.numerics/vector3.md) expressing the velocity at which the emitter is moving in 3D space, expressed in meters per second.
     * @remarks
     * By default, the doppler velocity is expressed in meters per second. Set the [DopplerScale](audionodeemitter_dopplerscale.md) property to scale the value to use other units.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.dopplervelocity
     * @type {Vector3} 
     */
    DopplerVelocity {
        get => this.get_DopplerVelocity()
        set => this.put_DopplerVelocity(value)
    }

    /**
     * Gets a value indicating whether Doppler processing is disabled for the emitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.isdopplerdisabled
     * @type {Boolean} 
     */
    IsDopplerDisabled {
        get => this.get_IsDopplerDisabled()
    }

    /**
     * Gets or sets a value that specifies the spatial audio processing model used by the emitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodeemitter.spatialaudiomodel
     * @type {Integer} 
     */
    SpatialAudioModel {
        get => this.get_SpatialAudioModel()
        set => this.put_SpatialAudioModel(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AudioNodeEmitter](audionodeemitter.md) class.
     * @remarks
     * If the constructor with no parameters is used, the default emitter shape is omnidirectional, the default decay model is natural, and doppler processing is enabled.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeEmitter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_Position()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.put_Position(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Direction() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_Direction()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Direction(value) {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.put_Direction(value)
    }

    /**
     * 
     * @returns {AudioNodeEmitterShape} 
     */
    get_Shape() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_Shape()
    }

    /**
     * 
     * @returns {AudioNodeEmitterDecayModel} 
     */
    get_DecayModel() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_DecayModel()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Gain() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_Gain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Gain(value) {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.put_Gain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DistanceScale() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_DistanceScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DistanceScale(value) {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.put_DistanceScale(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DopplerScale() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_DopplerScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DopplerScale(value) {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.put_DopplerScale(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_DopplerVelocity() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_DopplerVelocity()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_DopplerVelocity(value) {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.put_DopplerVelocity(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDopplerDisabled() {
        if (!this.HasProp("__IAudioNodeEmitter")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter := IAudioNodeEmitter(outPtr)
        }

        return this.__IAudioNodeEmitter.get_IsDopplerDisabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SpatialAudioModel() {
        if (!this.HasProp("__IAudioNodeEmitter2")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter2 := IAudioNodeEmitter2(outPtr)
        }

        return this.__IAudioNodeEmitter2.get_SpatialAudioModel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SpatialAudioModel(value) {
        if (!this.HasProp("__IAudioNodeEmitter2")) {
            if ((queryResult := this.QueryInterface(IAudioNodeEmitter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeEmitter2 := IAudioNodeEmitter2(outPtr)
        }

        return this.__IAudioNodeEmitter2.put_SpatialAudioModel(value)
    }

;@endregion Instance Methods
}
