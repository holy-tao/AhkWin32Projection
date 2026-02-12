#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILimiterEffectDefinition.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include .\ILimiterEffectDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a limiter effect definition supported by the audio graph.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.limitereffectdefinition
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class LimiterEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILimiterEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILimiterEffectDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [LimiterEffectDefinition](limitereffectdefinition.md) class.
     * @param {AudioGraph} audioGraph_ The [AudioGraph](audiograph.md) with which the effect will be used. Using effects outside of the audio graph it was created with is not supported.
     * @returns {LimiterEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.limitereffectdefinition.#ctor
     */
    static Create(audioGraph_) {
        if (!LimiterEffectDefinition.HasProp("__ILimiterEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.LimiterEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILimiterEffectDefinitionFactory.IID)
            LimiterEffectDefinition.__ILimiterEffectDefinitionFactory := ILimiterEffectDefinitionFactory(factoryPtr)
        }

        return LimiterEffectDefinition.__ILimiterEffectDefinitionFactory.Create(audioGraph_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the release included in the limiter effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.limitereffectdefinition.release
     * @type {Integer} 
     */
    Release {
        get => this.get_Release()
        set => this.put_Release(value)
    }

    /**
     * Gets or sets the loudness included in the limiter effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.limitereffectdefinition.loudness
     * @type {Integer} 
     */
    Loudness {
        get => this.get_Loudness()
        set => this.put_Loudness(value)
    }

    /**
     * Gets the activatable class ID for the limiter effect definition object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.limitereffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the properties supported by the limiter effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.limitereffectdefinition.properties
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Release(value) {
        if (!this.HasProp("__ILimiterEffectDefinition")) {
            if ((queryResult := this.QueryInterface(ILimiterEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimiterEffectDefinition := ILimiterEffectDefinition(outPtr)
        }

        return this.__ILimiterEffectDefinition.put_Release(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Release() {
        if (!this.HasProp("__ILimiterEffectDefinition")) {
            if ((queryResult := this.QueryInterface(ILimiterEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimiterEffectDefinition := ILimiterEffectDefinition(outPtr)
        }

        return this.__ILimiterEffectDefinition.get_Release()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Loudness(value) {
        if (!this.HasProp("__ILimiterEffectDefinition")) {
            if ((queryResult := this.QueryInterface(ILimiterEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimiterEffectDefinition := ILimiterEffectDefinition(outPtr)
        }

        return this.__ILimiterEffectDefinition.put_Loudness(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Loudness() {
        if (!this.HasProp("__ILimiterEffectDefinition")) {
            if ((queryResult := this.QueryInterface(ILimiterEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILimiterEffectDefinition := ILimiterEffectDefinition(outPtr)
        }

        return this.__ILimiterEffectDefinition.get_Loudness()
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
