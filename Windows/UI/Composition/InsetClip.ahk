#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionClip.ahk
#Include .\IInsetClip.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a rectangle that clips a portion of a visual. The portion of the visual inside the rectangle is visible; the portion of the visual outside the rectangle is clipped.
 * @remarks
 * `InsetClip` is functionally similar to [RectangleClip](rectangleclip.md), but `RectangleClip` allows you to round the corners of the clipping rectangle.
 * 
 * An `InsetClip` is defined using offsets in pixels from the bottom, left, right, and top of the [Visual](visual.md) to be clipped.
 * 
 * To clip a `Visual`, you assign the `InsetClip` to the [Clip](visual_clip.md) property of the `Visual`.
 * 
 * It is possible to fully clip the entire `Visual`. Negative values are allowed. `InsetClip` supports all the same transforms as `Visual` except the 4x4 matrix. Unlike `Visual`, `InsetClip` is 2D and is defined, instead, with a 3x2 matrix. `InsetClip` properties are fully animatable.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.insetclip
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class InsetClip extends CompositionClip {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInsetClip

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInsetClip.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the offset from the bottom of the visual. The portion of the visual below the BottomtInset will be clipped. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.insetclip.bottominset
     * @type {Float} 
     */
    BottomInset {
        get => this.get_BottomInset()
        set => this.put_BottomInset(value)
    }

    /**
     * Gets or sets the offset from the left of the visual. The portion of the visual to the left of the LeftInset will be clipped. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.insetclip.leftinset
     * @type {Float} 
     */
    LeftInset {
        get => this.get_LeftInset()
        set => this.put_LeftInset(value)
    }

    /**
     * Gets or sets the offset from the right of the visual. The portion of the visual to the right of the RightInset will be clipped. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.insetclip.rightinset
     * @type {Float} 
     */
    RightInset {
        get => this.get_RightInset()
        set => this.put_RightInset(value)
    }

    /**
     * Gets or sets the offset from the top of the visual. The portion of the visual above the TopInset will be clipped. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.insetclip.topinset
     * @type {Float} 
     */
    TopInset {
        get => this.get_TopInset()
        set => this.put_TopInset(value)
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
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.get_BottomInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BottomInset(value) {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.put_BottomInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftInset() {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.get_LeftInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftInset(value) {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.put_LeftInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightInset() {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.get_RightInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightInset(value) {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.put_RightInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopInset() {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.get_TopInset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TopInset(value) {
        if (!this.HasProp("__IInsetClip")) {
            if ((queryResult := this.QueryInterface(IInsetClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInsetClip := IInsetClip(outPtr)
        }

        return this.__IInsetClip.put_TopInset(value)
    }

;@endregion Instance Methods
}
