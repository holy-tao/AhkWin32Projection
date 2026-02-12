#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoEffectDefinition.ahk
#Include .\IVideoEffectDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video effect definition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videoeffectdefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class VideoEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoEffectDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [VideoEffectDefinition](videoeffectdefinition.md) object with the specified activatable class ID.
     * @param {HSTRING} activatableClassId The activatable class ID of the video effect definition.
     * @returns {VideoEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videoeffectdefinition.#ctor
     */
    static Create(activatableClassId) {
        if (!VideoEffectDefinition.HasProp("__IVideoEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.VideoEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEffectDefinitionFactory.IID)
            VideoEffectDefinition.__IVideoEffectDefinitionFactory := IVideoEffectDefinitionFactory(factoryPtr)
        }

        return VideoEffectDefinition.__IVideoEffectDefinitionFactory.Create(activatableClassId)
    }

    /**
     * Creates a new [VideoEffectDefinition](videoeffectdefinition.md) object with the specified activatable class ID, configuring the object with the specified settings.
     * @param {HSTRING} activatableClassId The activatable class ID of the video effect definition.
     * @param {IPropertySet} props Configuration properties for the specified video effect definition.
     * @returns {VideoEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videoeffectdefinition.#ctor
     */
    static CreateWithProperties(activatableClassId, props) {
        if (!VideoEffectDefinition.HasProp("__IVideoEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.VideoEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoEffectDefinitionFactory.IID)
            VideoEffectDefinition.__IVideoEffectDefinitionFactory := IVideoEffectDefinitionFactory(factoryPtr)
        }

        return VideoEffectDefinition.__IVideoEffectDefinitionFactory.CreateWithProperties(activatableClassId, props)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the activatable class ID of the video effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videoeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the set of properties for configuring the [VideoEffectDefinition](videoeffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videoeffectdefinition.properties
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
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_Properties()
    }

;@endregion Instance Methods
}
