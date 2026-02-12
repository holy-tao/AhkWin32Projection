#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionMaskBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * Paints a SpriteVisual with a CompositionBrush with an opacity mask applied to it. The source of the opacity mask can be any CompositionBrush of type CompositionColorBrush, CompositionLinearGradientBrush, CompositionSurfaceBrush, CompositionEffectBrush or a CompositionNineGridBrush. The opacity mask must be specified as a CompositionSurfaceBrush.
 * @remarks
 * CompositionMaskBrush can not be set as the source parameter to a [CompositionEffectBrush](compositioneffectbrush.md). If you wish to apply an IGraphicsEffect to your masked content, use a [CompositionEffectBrush](compositioneffectbrush.md) with the [Composite effect](/windows/uwp/graphics/composition-effects?f=255&amp;MSPPError=-2147217396) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmaskbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionMaskBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionMaskBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionMaskBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A brush that contains the opacity mask with which the Source brush's content is to be masked. Can be of type CompositionSurfaceBrush or CompositionNineGridBrush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmaskbrush.mask
     * @type {CompositionBrush} 
     */
    Mask {
        get => this.get_Mask()
        set => this.put_Mask(value)
    }

    /**
     * A brush whose content is to be masked by the opacity mask. Can be of type CompositionSurfaceBrush, CompositionColorBrush, or CompositionNineGridBrush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmaskbrush.source
     * @type {CompositionBrush} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Mask() {
        if (!this.HasProp("__ICompositionMaskBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionMaskBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMaskBrush := ICompositionMaskBrush(outPtr)
        }

        return this.__ICompositionMaskBrush.get_Mask()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Mask(value) {
        if (!this.HasProp("__ICompositionMaskBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionMaskBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMaskBrush := ICompositionMaskBrush(outPtr)
        }

        return this.__ICompositionMaskBrush.put_Mask(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Source() {
        if (!this.HasProp("__ICompositionMaskBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionMaskBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMaskBrush := ICompositionMaskBrush(outPtr)
        }

        return this.__ICompositionMaskBrush.get_Source()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__ICompositionMaskBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionMaskBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMaskBrush := ICompositionMaskBrush(outPtr)
        }

        return this.__ICompositionMaskBrush.put_Source(value)
    }

;@endregion Instance Methods
}
