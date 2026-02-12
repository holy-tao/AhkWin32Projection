#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContainerVisual.ahk
#Include .\ISpriteVisual.ahk
#Include .\ISpriteVisual2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Hosts 2D boxed content of type [CompositionBrush](compositionbrush.md). Any part of the visual not covered by pixels from the brush are rendered as transparent pixels. CompositionBrush can be either a [CompositionBackdropBrush](compositionbackdropbrush.md), [CompositionColorBrush](compositioncolorbrush.md), a [CompositionSurfaceBrush](compositionsurfacebrush.md) or a [CompositionEffectBrush](compositioneffectbrush.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spritevisual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class SpriteVisual extends ContainerVisual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpriteVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpriteVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A [CompositionBrush](compositionbrush.md) describing how the [SpriteVisual](spritevisual.md) is painted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spritevisual.brush
     * @type {CompositionBrush} 
     */
    Brush {
        get => this.get_Brush()
        set => this.put_Brush(value)
    }

    /**
     * The shadow for the [SpriteVisual](spritevisual.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spritevisual.shadow
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
     * @returns {CompositionBrush} 
     */
    get_Brush() {
        if (!this.HasProp("__ISpriteVisual")) {
            if ((queryResult := this.QueryInterface(ISpriteVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpriteVisual := ISpriteVisual(outPtr)
        }

        return this.__ISpriteVisual.get_Brush()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Brush(value) {
        if (!this.HasProp("__ISpriteVisual")) {
            if ((queryResult := this.QueryInterface(ISpriteVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpriteVisual := ISpriteVisual(outPtr)
        }

        return this.__ISpriteVisual.put_Brush(value)
    }

    /**
     * 
     * @returns {CompositionShadow} 
     */
    get_Shadow() {
        if (!this.HasProp("__ISpriteVisual2")) {
            if ((queryResult := this.QueryInterface(ISpriteVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpriteVisual2 := ISpriteVisual2(outPtr)
        }

        return this.__ISpriteVisual2.get_Shadow()
    }

    /**
     * 
     * @param {CompositionShadow} value 
     * @returns {HRESULT} 
     */
    put_Shadow(value) {
        if (!this.HasProp("__ISpriteVisual2")) {
            if ((queryResult := this.QueryInterface(ISpriteVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpriteVisual2 := ISpriteVisual2(outPtr)
        }

        return this.__ISpriteVisual2.put_Shadow(value)
    }

;@endregion Instance Methods
}
