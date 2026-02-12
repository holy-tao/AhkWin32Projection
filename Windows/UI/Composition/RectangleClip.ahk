#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionClip.ahk
#Include .\IRectangleClip.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a rectangle with optional rounded corners that clips a portion of a visual. The portion of the visual inside the rectangle is visible; the portion of the visual outside the rectangle is clipped.
 * @remarks
 * `RectangleClip` is functionally similar to [InsetClip](insetclip.md), but allows you to round the corners of the clipping rectangle.
 * 
 * A `RectangleClip` is defined using the bottom, left, right, and top of the clip itself. Unlike `InsetClip`, it's not relative to the Visual it's attached to. You can round the corners of the rectangle by setting the various _Radius_ properties.
 * 
 * To clip a `Visual`, you assign the `RectangleClip` to the [Clip](visual_clip.md) property of the `Visual`.
 * 
 * It is possible to fully clip the entire `Visual`. Negative values are allowed. `RectangleClip` supports all the same transforms as `Visual` except the 4x4 matrix. Unlike `Visual`, `RectangleClip` is 2D and is defined, instead, with a 3x2 matrix. `RectangleClip` properties are fully animatable.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class RectangleClip extends CompositionClip {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRectangleClip

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRectangleClip.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the offset from the bottom of the visual. The portion of the visual below the edge defined by `Bottom` will be clipped. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.bottom
     * @type {Float} 
     */
    Bottom {
        get => this.get_Bottom()
        set => this.put_Bottom(value)
    }

    /**
     * Gets or sets the amount by which the bottom left corner of the rectangle is rounded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.bottomleftradius
     * @type {Vector2} 
     */
    BottomLeftRadius {
        get => this.get_BottomLeftRadius()
        set => this.put_BottomLeftRadius(value)
    }

    /**
     * Gets or sets the amount by which the bottom right corner of the rectangle is rounded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.bottomrightradius
     * @type {Vector2} 
     */
    BottomRightRadius {
        get => this.get_BottomRightRadius()
        set => this.put_BottomRightRadius(value)
    }

    /**
     * Gets or sets the offset from the left of the visual. The portion of the visual to the left of the edge defined by `Left` will be clipped. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.left
     * @type {Float} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * Gets or sets the offset from the right of the visual. The portion of the visual to the right the edge defined by `Right` will be clipped. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.right
     * @type {Float} 
     */
    Right {
        get => this.get_Right()
        set => this.put_Right(value)
    }

    /**
     * Gets or sets the offset from the top of the visual. The portion of the visual above the edge defined by `Top` will be clipped. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.top
     * @type {Float} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * Gets or sets the amount by which the top left corner of the rectangle is rounded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.topleftradius
     * @type {Vector2} 
     */
    TopLeftRadius {
        get => this.get_TopLeftRadius()
        set => this.put_TopLeftRadius(value)
    }

    /**
     * Gets or sets the amount by which the top right corner of the rectangle is rounded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.rectangleclip.toprightradius
     * @type {Vector2} 
     */
    TopRightRadius {
        get => this.get_TopRightRadius()
        set => this.put_TopRightRadius(value)
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
    get_Bottom() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_Bottom()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Bottom(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_Bottom(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_BottomLeftRadius() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_BottomLeftRadius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_BottomLeftRadius(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_BottomLeftRadius(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_BottomRightRadius() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_BottomRightRadius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_BottomRightRadius(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_BottomRightRadius(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Left() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_Left()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Left(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_Left(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Right() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_Right()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Right(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_Right(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Top() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_Top()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Top(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_Top(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_TopLeftRadius() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_TopLeftRadius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_TopLeftRadius(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_TopLeftRadius(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_TopRightRadius() {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.get_TopRightRadius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_TopRightRadius(value) {
        if (!this.HasProp("__IRectangleClip")) {
            if ((queryResult := this.QueryInterface(IRectangleClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleClip := IRectangleClip(outPtr)
        }

        return this.__IRectangleClip.put_TopRightRadius(value)
    }

;@endregion Instance Methods
}
