#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContainerVisual.ahk
#Include .\ILayerVisual.ahk
#Include .\ILayerVisual2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A ContainerVisual whose children are flattened into a single layer.
 * @remarks
 * A LayerVisual is a special input type that can be used to select a tree of visuals. The tree input is implicitly specified using the LayerVisual. When an EffectBrush is set to the Effect property of the LayerVisual, the EffectBrush automatically uses the subtree rooted at the LayerVisual as the input. The implicit input for LayerVisual works for effects as follows:
 * 
 * + If the effect has one input, the EffectBrush uses the subtree rooted at the LayerVisual as the input.
 * + If the effect has 2 inputs, the first unbounded input of the EffectBrush uses the subtree rooted at the LayerVisual as the input.
 * + The system does not allow an effect with 0 inputs or effects with all inputs bounded to SurfaceBrush to be set as the EffectBrush on LayerVisual’s Effect property. This will throw an exception.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.layervisual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class LayerVisual extends ContainerVisual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILayerVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILayerVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the effect to be applied to the flattened representation of the children of a [LayerVisual](layervisual.md).
     * @remarks
     * This CompositionEffectBrush cannot take a [CompositionBackdropBrush](compositionbackdropbrush.md) as input, including HostBackdropBrush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.layervisual.effect
     * @type {CompositionEffectBrush} 
     */
    Effect {
        get => this.get_Effect()
        set => this.put_Effect(value)
    }

    /**
     * Gets or sets the shadow to be applied to the flattened representation of the children of a [LayerVisual](layervisual.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.layervisual.shadow
     * @type {CompositionShadow} 
     */
    Shadow {
        get => this.get_Shadow()
        set => this.put_Shadow(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionEffectBrush} 
     */
    get_Effect() {
        if (!this.HasProp("__ILayerVisual")) {
            if ((queryResult := this.QueryInterface(ILayerVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILayerVisual := ILayerVisual(outPtr)
        }

        return this.__ILayerVisual.get_Effect()
    }

    /**
     * 
     * @param {CompositionEffectBrush} value 
     * @returns {HRESULT} 
     */
    put_Effect(value) {
        if (!this.HasProp("__ILayerVisual")) {
            if ((queryResult := this.QueryInterface(ILayerVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILayerVisual := ILayerVisual(outPtr)
        }

        return this.__ILayerVisual.put_Effect(value)
    }

    /**
     * 
     * @returns {CompositionShadow} 
     */
    get_Shadow() {
        if (!this.HasProp("__ILayerVisual2")) {
            if ((queryResult := this.QueryInterface(ILayerVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILayerVisual2 := ILayerVisual2(outPtr)
        }

        return this.__ILayerVisual2.get_Shadow()
    }

    /**
     * 
     * @param {CompositionShadow} value 
     * @returns {HRESULT} 
     */
    put_Shadow(value) {
        if (!this.HasProp("__ILayerVisual2")) {
            if ((queryResult := this.QueryInterface(ILayerVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILayerVisual2 := ILayerVisual2(outPtr)
        }

        return this.__ILayerVisual2.put_Shadow(value)
    }

;@endregion Instance Methods
}
