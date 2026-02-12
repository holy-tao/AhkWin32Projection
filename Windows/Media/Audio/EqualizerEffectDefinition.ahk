#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEqualizerEffectDefinition.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include .\IEqualizerEffectDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an equalizer effect definition supported by the audio graph.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizereffectdefinition
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class EqualizerEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEqualizerEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEqualizerEffectDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [EqualizerEffectDefinition](equalizereffectdefinition.md) class.
     * @param {AudioGraph} audioGraph_ The [AudioGraph](audiograph.md) with which the effect will be used. Using effects outside of the audio graph it was created with is not supported.
     * @returns {EqualizerEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizereffectdefinition.#ctor
     */
    static Create(audioGraph_) {
        if (!EqualizerEffectDefinition.HasProp("__IEqualizerEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.EqualizerEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEqualizerEffectDefinitionFactory.IID)
            EqualizerEffectDefinition.__IEqualizerEffectDefinitionFactory := IEqualizerEffectDefinitionFactory(factoryPtr)
        }

        return EqualizerEffectDefinition.__IEqualizerEffectDefinitionFactory.Create(audioGraph_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the bands included in the equalizer effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizereffectdefinition.bands
     * @type {IVectorView<EqualizerBand>} 
     */
    Bands {
        get => this.get_Bands()
    }

    /**
     * Gets the activatable class ID for the equalizer effect definition object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizereffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the properties supported by the equalizer effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.equalizereffectdefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<EqualizerBand>} 
     */
    get_Bands() {
        if (!this.HasProp("__IEqualizerEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEqualizerEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEqualizerEffectDefinition := IEqualizerEffectDefinition(outPtr)
        }

        return this.__IEqualizerEffectDefinition.get_Bands()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        if (!this.HasProp("__IAudioEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IAudioEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectDefinition := IAudioEffectDefinition(outPtr)
        }

        return this.__IAudioEffectDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IAudioEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IAudioEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectDefinition := IAudioEffectDefinition(outPtr)
        }

        return this.__IAudioEffectDefinition.get_Properties()
    }

;@endregion Instance Methods
}
