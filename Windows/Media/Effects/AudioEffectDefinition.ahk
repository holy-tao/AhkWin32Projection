#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioEffectDefinition.ahk
#Include .\IAudioEffectDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an audio effect definition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectdefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioEffectDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [AudioEffectDefinition](audioeffectdefinition.md) object with the specified activatable class ID.
     * @param {HSTRING} activatableClassId The activatable class ID of the audio effect definition.
     * @returns {AudioEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectdefinition.#ctor
     */
    static Create(activatableClassId) {
        if (!AudioEffectDefinition.HasProp("__IAudioEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.AudioEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectDefinitionFactory.IID)
            AudioEffectDefinition.__IAudioEffectDefinitionFactory := IAudioEffectDefinitionFactory(factoryPtr)
        }

        return AudioEffectDefinition.__IAudioEffectDefinitionFactory.Create(activatableClassId)
    }

    /**
     * Creates a new [AudioEffectDefinition](audioeffectdefinition.md) object with the specified activatable class ID, configuring the object with the specified settings.
     * @param {HSTRING} activatableClassId The activatable class ID of the audio effect definition.
     * @param {IPropertySet} props Configuration properties for the specified audio effect definition.
     * @returns {AudioEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectdefinition.#ctor
     */
    static CreateWithProperties(activatableClassId, props) {
        if (!AudioEffectDefinition.HasProp("__IAudioEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.AudioEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectDefinitionFactory.IID)
            AudioEffectDefinition.__IAudioEffectDefinitionFactory := IAudioEffectDefinitionFactory(factoryPtr)
        }

        return AudioEffectDefinition.__IAudioEffectDefinitionFactory.CreateWithProperties(activatableClassId, props)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The activatable class ID of the audio effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * The set of properties for configuring an [AudioEffectDefinition](audioeffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffectdefinition.properties
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
