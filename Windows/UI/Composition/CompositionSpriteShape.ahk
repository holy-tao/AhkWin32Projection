#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionShape.ahk
#Include .\ICompositionSpriteShape.ahk
#Include ..\..\..\Guid.ahk

/**
 * A CompositionShape that draws Stroked and Filled [CompositionGeometry](compositiongeometry.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionSpriteShape extends CompositionShape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionSpriteShape

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionSpriteShape.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the brush that paints the interior area of the shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.fillbrush
     * @type {CompositionBrush} 
     */
    FillBrush {
        get => this.get_FillBrush()
        set => this.put_FillBrush(value)
    }

    /**
     * Gets or sets the geometry that defines this shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.geometry
     * @type {CompositionGeometry} 
     */
    Geometry {
        get => this.get_Geometry()
        set => this.put_Geometry(value)
    }

    /**
     * Gets or sets a value that specifies whether the shape's outline scales.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.isstrokenonscaling
     * @type {Boolean} 
     */
    IsStrokeNonScaling {
        get => this.get_IsStrokeNonScaling()
        set => this.put_IsStrokeNonScaling(value)
    }

    /**
     * Gets or sets the brush that paints the outline of the shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokebrush
     * @type {CompositionBrush} 
     */
    StrokeBrush {
        get => this.get_StrokeBrush()
        set => this.put_StrokeBrush(value)
    }

    /**
     * Gets the collection of values that indicates the pattern of dashes and gaps used to outline shapes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokedasharray
     * @type {CompositionStrokeDashArray} 
     */
    StrokeDashArray {
        get => this.get_StrokeDashArray()
    }

    /**
     * Gets or sets a [CompositionStrokeCap](compositionstrokecap.md) enumeration value that specifies how the ends of a dash are drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokedashcap
     * @type {Integer} 
     */
    StrokeDashCap {
        get => this.get_StrokeDashCap()
        set => this.put_StrokeDashCap(value)
    }

    /**
     * Gets or sets a value that specifies the distance within the dash pattern where a dash begins.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokedashoffset
     * @type {Float} 
     */
    StrokeDashOffset {
        get => this.get_StrokeDashOffset()
        set => this.put_StrokeDashOffset(value)
    }

    /**
     * Gets or sets a [CompositionStrokeCap](compositionstrokecap.md) enumeration value that specifies how the end of a line is drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokeendcap
     * @type {Integer} 
     */
    StrokeEndCap {
        get => this.get_StrokeEndCap()
        set => this.put_StrokeEndCap(value)
    }

    /**
     * Gets or sets a [CompositionStrokeLineJoin](compositionstrokelinejoin.md) enumeration value that specifies the type of join used at the vertices of a shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokelinejoin
     * @type {Integer} 
     */
    StrokeLineJoin {
        get => this.get_StrokeLineJoin()
        set => this.put_StrokeLineJoin(value)
    }

    /**
     * Gets or sets a limit on the ratio of the miter length to half the [StrokeThickness](compositionspriteshape_strokethickness.md) of a shape element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokemiterlimit
     * @type {Float} 
     */
    StrokeMiterLimit {
        get => this.get_StrokeMiterLimit()
        set => this.put_StrokeMiterLimit(value)
    }

    /**
     * Gets or sets a [CompositionStrokeCap](compositionstrokecap.md) enumeration value that specifies how the start of a line is drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokestartcap
     * @type {Integer} 
     */
    StrokeStartCap {
        get => this.get_StrokeStartCap()
        set => this.put_StrokeStartCap(value)
    }

    /**
     * Gets or sets the width of the shape outline.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionspriteshape.strokethickness
     * @type {Float} 
     */
    StrokeThickness {
        get => this.get_StrokeThickness()
        set => this.put_StrokeThickness(value)
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
    get_FillBrush() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_FillBrush()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_FillBrush(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_FillBrush(value)
    }

    /**
     * 
     * @returns {CompositionGeometry} 
     */
    get_Geometry() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_Geometry()
    }

    /**
     * 
     * @param {CompositionGeometry} value 
     * @returns {HRESULT} 
     */
    put_Geometry(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_Geometry(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStrokeNonScaling() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_IsStrokeNonScaling()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStrokeNonScaling(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_IsStrokeNonScaling(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_StrokeBrush() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeBrush()
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_StrokeBrush(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeBrush(value)
    }

    /**
     * 
     * @returns {CompositionStrokeDashArray} 
     */
    get_StrokeDashArray() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeDashArray()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeDashCap() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeDashCap()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashCap(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeDashCap(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeDashOffset() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeDashOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashOffset(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeDashOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeEndCap() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeEndCap()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeEndCap(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeEndCap(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeLineJoin() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeLineJoin()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeLineJoin(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeLineJoin(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeMiterLimit() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeMiterLimit()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeMiterLimit(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeMiterLimit(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeStartCap() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeStartCap()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeStartCap(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeStartCap(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeThickness() {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.get_StrokeThickness()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeThickness(value) {
        if (!this.HasProp("__ICompositionSpriteShape")) {
            if ((queryResult := this.QueryInterface(ICompositionSpriteShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSpriteShape := ICompositionSpriteShape(outPtr)
        }

        return this.__ICompositionSpriteShape.put_StrokeThickness(value)
    }

;@endregion Instance Methods
}
