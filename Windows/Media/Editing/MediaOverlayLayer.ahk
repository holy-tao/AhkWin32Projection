#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaOverlayLayer.ahk
#Include .\IMediaOverlayLayerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a layer of a media overlay.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlaylayer
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class MediaOverlayLayer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaOverlayLayer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaOverlayLayer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [MediaOverlayLayer](mediaoverlaylayer.md) class.
     * @param {IVideoCompositorDefinition} compositorDefinition The definition of the custom compositor associated with the media overlay layer.  This is 
     * typically an instance of the [VideoCompositorDefinition] class.
     * @returns {MediaOverlayLayer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlaylayer.#ctor
     */
    static CreateWithCompositorDefinition(compositorDefinition) {
        if (!MediaOverlayLayer.HasProp("__IMediaOverlayLayerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaOverlayLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaOverlayLayerFactory.IID)
            MediaOverlayLayer.__IMediaOverlayLayerFactory := IMediaOverlayLayerFactory(factoryPtr)
        }

        return MediaOverlayLayer.__IMediaOverlayLayerFactory.CreateWithCompositorDefinition(compositorDefinition)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of overlays for this media overlay layer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlaylayer.overlays
     * @type {IVector<MediaOverlay>} 
     */
    Overlays {
        get => this.get_Overlays()
    }

    /**
     * Gets the definition of the custom compositor associated with the media overlay layer, if there is one.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlaylayer.customcompositordefinition
     * @type {IVideoCompositorDefinition} 
     */
    CustomCompositorDefinition {
        get => this.get_CustomCompositorDefinition()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaOverlayLayer](mediaoverlaylayer.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaOverlayLayer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Creates a [MediaOverlayLayer](mediaoverlaylayer.md) object that is identical to this instance.
     * @returns {MediaOverlayLayer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaoverlaylayer.clone
     */
    Clone() {
        if (!this.HasProp("__IMediaOverlayLayer")) {
            if ((queryResult := this.QueryInterface(IMediaOverlayLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlayLayer := IMediaOverlayLayer(outPtr)
        }

        return this.__IMediaOverlayLayer.Clone()
    }

    /**
     * 
     * @returns {IVector<MediaOverlay>} 
     */
    get_Overlays() {
        if (!this.HasProp("__IMediaOverlayLayer")) {
            if ((queryResult := this.QueryInterface(IMediaOverlayLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlayLayer := IMediaOverlayLayer(outPtr)
        }

        return this.__IMediaOverlayLayer.get_Overlays()
    }

    /**
     * 
     * @returns {IVideoCompositorDefinition} 
     */
    get_CustomCompositorDefinition() {
        if (!this.HasProp("__IMediaOverlayLayer")) {
            if ((queryResult := this.QueryInterface(IMediaOverlayLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaOverlayLayer := IMediaOverlayLayer(outPtr)
        }

        return this.__IMediaOverlayLayer.get_CustomCompositorDefinition()
    }

;@endregion Instance Methods
}
