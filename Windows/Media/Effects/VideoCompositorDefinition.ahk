#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoCompositorDefinition.ahk
#Include .\IVideoCompositorDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the definition of a custom video compositor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videocompositordefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class VideoCompositorDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoCompositorDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoCompositorDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [VideoCompositorDefinition](videocompositordefinition.md) class.
     * @param {HSTRING} activatableClassId The activatable class ID of the video compositor.
     * @returns {VideoCompositorDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videocompositordefinition.#ctor
     */
    static Create(activatableClassId) {
        if (!VideoCompositorDefinition.HasProp("__IVideoCompositorDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.VideoCompositorDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoCompositorDefinitionFactory.IID)
            VideoCompositorDefinition.__IVideoCompositorDefinitionFactory := IVideoCompositorDefinitionFactory(factoryPtr)
        }

        return VideoCompositorDefinition.__IVideoCompositorDefinitionFactory.Create(activatableClassId)
    }

    /**
     * Initializes a new instance of the [VideoCompositorDefinition](videocompositordefinition.md) class.
     * @param {HSTRING} activatableClassId The activatable class ID of the video compositor.
     * @param {IPropertySet} props The set of properties for configuring the video compositor object.
     * @returns {VideoCompositorDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videocompositordefinition.#ctor
     */
    static CreateWithProperties(activatableClassId, props) {
        if (!VideoCompositorDefinition.HasProp("__IVideoCompositorDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.VideoCompositorDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoCompositorDefinitionFactory.IID)
            VideoCompositorDefinition.__IVideoCompositorDefinitionFactory := IVideoCompositorDefinitionFactory(factoryPtr)
        }

        return VideoCompositorDefinition.__IVideoCompositorDefinitionFactory.CreateWithProperties(activatableClassId, props)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the activatable class ID of the video compositor.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videocompositordefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the set of properties for configuring the video compositor object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videocompositordefinition.properties
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
        if (!this.HasProp("__IVideoCompositorDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoCompositorDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoCompositorDefinition := IVideoCompositorDefinition(outPtr)
        }

        return this.__IVideoCompositorDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IVideoCompositorDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoCompositorDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoCompositorDefinition := IVideoCompositorDefinition(outPtr)
        }

        return this.__IVideoCompositorDefinition.get_Properties()
    }

;@endregion Instance Methods
}
