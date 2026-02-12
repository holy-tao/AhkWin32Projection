#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionNineGridBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * Paints a [SpriteVisual](spritevisual.md) with a CompositionBrush after applying Nine-Grid Stretching to the contents of the Source brush. The source of the nine-grid stretch can by any CompositionBrush of type CompositionColorBrush, CompositionSurfaceBrush or a CompositionEffectBrush.
 * @remarks
 * Nine-Grid stretching refers to the partitioning of visual content (the content of the source brush to be painted onto a [SpriteVisual](spritevisual.md)) into a grid of nine rectangles such that the sizes of the corner rectangles are preserved upon resizing, as shown in the diagram below:
 * 
 * <img src="images/ninegridstretching.png" alt="Stretching of nine-grid sections" />
 * 
 * When a [SpriteVisual](spritevisual.md) painted with a CompositionNineGridBrush is resized or scaled, the left and right margins (rectangles 4 and 6) stretch along the vertical axis, the top and bottom margins rectangles (rectangles 2 and 8) stretch along the horizontal axis, and the center (rectangle 5) is stretched along both axes while the corners (rectangles 1,3,7, and 9) do not stretch.
 * 
 * The **Source** property of CompositionNineGridBrush accepts brushes of one of two types:
 * 
 * 
 * + [CompositionSurfaceBrush](compositionsurfacebrush.md): apply Nine-Grid Stretching to a textured image surface.
 * + [CompositionColorBrush](compositioncolorbrush.md): create solid color borders.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionNineGridBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionNineGridBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionNineGridBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Inset from the bottom edge of the source content that specifies the thickness of the bottom row. Defaults to 0.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.bottominset
     * @type {Float} 
     */
    BottomInset {
        get => this.get_BottomInset()
        set => this.put_BottomInset(value)
    }

    /**
     * Scale to be applied to BottomInset. Defaults to 1.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.bottominsetscale
     * @type {Float} 
     */
    BottomInsetScale {
        get => this.get_BottomInsetScale()
        set => this.put_BottomInsetScale(value)
    }

    /**
     * Indicates whether the center of the Nine-Grid is drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.iscenterhollow
     * @type {Boolean} 
     */
    IsCenterHollow {
        get => this.get_IsCenterHollow()
        set => this.put_IsCenterHollow(value)
    }

    /**
     * Inset from the left edge of the source content that specifies the thickness of the left column. Defaults to 0.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.leftinset
     * @type {Float} 
     */
    LeftInset {
        get => this.get_LeftInset()
        set => this.put_LeftInset(value)
    }

    /**
     * Scale to be applied to LeftInset. Defaults to 1.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.leftinsetscale
     * @type {Float} 
     */
    LeftInsetScale {
        get => this.get_LeftInsetScale()
        set => this.put_LeftInsetScale(value)
    }

    /**
     * Inset from the right edge of the source content that specifies the thickness of the right column. Defaults to 0.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.rightinset
     * @type {Float} 
     */
    RightInset {
        get => this.get_RightInset()
        set => this.put_RightInset(value)
    }

    /**
     * Scale to be applied to RightInset. Defaults to 1.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.rightinsetscale
     * @type {Float} 
     */
    RightInsetScale {
        get => this.get_RightInsetScale()
        set => this.put_RightInsetScale(value)
    }

    /**
     * The brush whose content is to be Nine-Grid stretched. Can be of type CompositionSurfaceBrush or CompositionColorBrush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.source
     * @type {CompositionBrush} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Inset from the top edge of the source content that specifies the thickness of the top row. Defaults to 0.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.topinset
     * @type {Float} 
     */
    TopInset {
        get => this.get_TopInset()
        set => this.put_TopInset(value)
    }

    /**
     * Scale to be applied to TopInset. Defaults to 1.0f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.topinsetscale
     * @type {Float} 
     */
    TopInsetScale {
        get => this.get_TopInsetScale()
        set => this.put_TopInsetScale(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomInset() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_BottomInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BottomInset(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_BottomInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomInsetScale() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_BottomInsetScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BottomInsetScale(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_BottomInsetScale(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCenterHollow() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_IsCenterHollow()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCenterHollow(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_IsCenterHollow(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftInset() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_LeftInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftInset(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_LeftInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftInsetScale() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_LeftInsetScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftInsetScale(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_LeftInsetScale(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightInset() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_RightInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightInset(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_RightInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightInsetScale() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_RightInsetScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightInsetScale(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_RightInsetScale(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Source() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_Source()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_Source(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopInset() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_TopInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TopInset(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_TopInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopInsetScale() {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.get_TopInsetScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TopInsetScale(value) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.put_TopInsetScale(value)
    }

    /**
     * Sets the insets of a CompositionNineGridBrush using the same value for the top, bottom, left, and right. Defaults to 0.0f.
     * @param {Float} inset The inset value to use for the top, bottom, left, and right.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.setinsets
     */
    SetInsets(inset) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.SetInsets(inset)
    }

    /**
     * Sets the insets of a CompositionNineGridBrush using the specified values for the top, bottom, left, and right. Defaults to 0.0f.
     * @param {Float} left The inset from the left of the image.
     * @param {Float} top The inset from the top of the image.
     * @param {Float} right The inset from the right of the image.
     * @param {Float} bottom The inset from the bottom of the image.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.setinsets
     */
    SetInsetsWithValues(left, top, right, bottom) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.SetInsetsWithValues(left, top, right, bottom)
    }

    /**
     * Sets the (same) scale to be applied to the left, top, right, and bottom insets. Defaults to 1.0f.
     * @param {Float} scale The scale for all of the insets.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.setinsetscales
     */
    SetInsetScales(scale) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.SetInsetScales(scale)
    }

    /**
     * Sets the scale to be applied to the left, top, right, and bottom insets respectively. Defaults to 1.0f.
     * @param {Float} left The scale of the left inset.
     * @param {Float} top The scale of the top inset.
     * @param {Float} right The scale of the right inset.
     * @param {Float} bottom The scale of the bottom inset.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionninegridbrush.setinsetscales
     */
    SetInsetScalesWithValues(left, top, right, bottom) {
        if (!this.HasProp("__ICompositionNineGridBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionNineGridBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionNineGridBrush := ICompositionNineGridBrush(outPtr)
        }

        return this.__ICompositionNineGridBrush.SetInsetScalesWithValues(left, top, right, bottom)
    }

;@endregion Instance Methods
}
