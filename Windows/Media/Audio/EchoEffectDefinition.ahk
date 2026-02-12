#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEchoEffectDefinition.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include .\IEchoEffectDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an echo effect definition supported by the audio graph.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class EchoEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEchoEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEchoEffectDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an [EchoEffectDefinition](echoeffectdefinition.md) object.
     * @param {AudioGraph} audioGraph_ The [AudioGraph](audiograph.md) with which the effect will be used. Using effects outside of the audio graph it was created with is not supported.
     * @returns {EchoEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition.#ctor
     */
    static Create(audioGraph_) {
        if (!EchoEffectDefinition.HasProp("__IEchoEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.EchoEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEchoEffectDefinitionFactory.IID)
            EchoEffectDefinition.__IEchoEffectDefinitionFactory := IEchoEffectDefinitionFactory(factoryPtr)
        }

        return EchoEffectDefinition.__IEchoEffectDefinitionFactory.Create(audioGraph_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the wet-dry audio voice mix for the echo effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition.wetdrymix
     * @type {Float} 
     */
    WetDryMix {
        get => this.get_WetDryMix()
        set => this.put_WetDryMix(value)
    }

    /**
     * Gets or sets the feedback included in the echo effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition.feedback
     * @type {Float} 
     */
    Feedback {
        get => this.get_Feedback()
        set => this.put_Feedback(value)
    }

    /**
     * Gets or sets the delay time, in milliseconds, of the echo effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition.delay
     * @type {Float} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * Gets the activatable class ID for the echo effect definition object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets or sets the properties supported by the echo effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.echoeffectdefinition.properties
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
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_WetDryMix(value) {
        if (!this.HasProp("__IEchoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEchoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEchoEffectDefinition := IEchoEffectDefinition(outPtr)
        }

        return this.__IEchoEffectDefinition.put_WetDryMix(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WetDryMix() {
        if (!this.HasProp("__IEchoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEchoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEchoEffectDefinition := IEchoEffectDefinition(outPtr)
        }

        return this.__IEchoEffectDefinition.get_WetDryMix()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Feedback(value) {
        if (!this.HasProp("__IEchoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEchoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEchoEffectDefinition := IEchoEffectDefinition(outPtr)
        }

        return this.__IEchoEffectDefinition.put_Feedback(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Feedback() {
        if (!this.HasProp("__IEchoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEchoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEchoEffectDefinition := IEchoEffectDefinition(outPtr)
        }

        return this.__IEchoEffectDefinition.get_Feedback()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        if (!this.HasProp("__IEchoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEchoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEchoEffectDefinition := IEchoEffectDefinition(outPtr)
        }

        return this.__IEchoEffectDefinition.put_Delay(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Delay() {
        if (!this.HasProp("__IEchoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IEchoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEchoEffectDefinition := IEchoEffectDefinition(outPtr)
        }

        return this.__IEchoEffectDefinition.get_Delay()
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
