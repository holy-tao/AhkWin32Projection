#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGradientBrush.ahk
#Include .\ICompositionRadialGradientBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a brush that paints an area with a radial gradient.
 * @remarks
 * This brush paints a [SpriteVisual](spritevisual.md) with a radial gradient. 
 * 
 * The gradient is drawn within an ellipse that is defined by the [EllipseCenter](compositionradialgradientbrush_ellipsecenter.md) and [EllipseRadius](compositionradialgradientbrush_ellipseradius.md) properties.
 * Colors for the gradient start at the center of the ellipse and end at the radius.
 * 
 * The colors for the radial gradient are defined by color stops. Each color stop specifies a color and a location along the gradient.
 * 
 * ![Radial gradient color stops](images/radial-gradient.png)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionradialgradientbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionRadialGradientBrush extends CompositionGradientBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionRadialGradientBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionRadialGradientBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the two-dimensional coordinates of the center of the ellipse that contains the gradient.
     * @remarks
     * This property describes coordinates of the center of the ellipse that the radial gradient is drawn in.
     * 
     * When [MappingMode](compositiongradientbrush_mappingmode.md) is set to [Relative](compositionmappingmode.md), the coordinates are relative to the object being painted and have values from 0.0 to 1.0. The upper left corner of the object's bounding rectangle has coordinates (0.0, 0.0) and the lower right corner has coordinates (1.0, 1.0).
     * 
     * When `MappingMode` is set to `Absolute`, the numbers change to be pixels rather than a ratio, and are relative to the size of the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionradialgradientbrush.ellipsecenter
     * @type {Vector2} 
     */
    EllipseCenter {
        get => this.get_EllipseCenter()
        set => this.put_EllipseCenter(value)
    }

    /**
     * Gets or sets the radii of the ellipse that contains the gradient.
     * @remarks
     * This property describes the radii of the ellipse that the radial gradient is drawn in. The first value of the Vector2 describes the x-axis radius and the second value describes the y-axis radius.
     * 
     * When [MappingMode](compositiongradientbrush_mappingmode.md) is set to [Relative](compositionmappingmode.md), each radius is a value from 0.0 to 1.0, which represents a percentage of the size of the object being painted.
     * 
     * When `MappingMode` is set to `Absolute`, the numbers change to be pixels rather than a ratio, and are relative to the size of the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionradialgradientbrush.ellipseradius
     * @type {Vector2} 
     */
    EllipseRadius {
        get => this.get_EllipseRadius()
        set => this.put_EllipseRadius(value)
    }

    /**
     * Gets or sets the two-dimensional coordinates of the origin of the gradient.
     * @remarks
     * When [MappingMode](compositiongradientbrush_mappingmode.md) is set to [Relative](compositionmappingmode.md), the coordinates are relative to the object being painted and have values from 0.0 to 1.0. The upper left corner of the object's bounding rectangle has coordinates (0.0, 0.0) and the lower right corner has coordinates (1.0, 1.0).
     * 
     * When `MappingMode` is set to `Absolute`, the numbers change to be pixels rather than a ratio, and are relative to the size of the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionradialgradientbrush.gradientoriginoffset
     * @type {Vector2} 
     */
    GradientOriginOffset {
        get => this.get_GradientOriginOffset()
        set => this.put_GradientOriginOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_EllipseCenter() {
        if (!this.HasProp("__ICompositionRadialGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionRadialGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRadialGradientBrush := ICompositionRadialGradientBrush(outPtr)
        }

        return this.__ICompositionRadialGradientBrush.get_EllipseCenter()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_EllipseCenter(value) {
        if (!this.HasProp("__ICompositionRadialGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionRadialGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRadialGradientBrush := ICompositionRadialGradientBrush(outPtr)
        }

        return this.__ICompositionRadialGradientBrush.put_EllipseCenter(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_EllipseRadius() {
        if (!this.HasProp("__ICompositionRadialGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionRadialGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRadialGradientBrush := ICompositionRadialGradientBrush(outPtr)
        }

        return this.__ICompositionRadialGradientBrush.get_EllipseRadius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_EllipseRadius(value) {
        if (!this.HasProp("__ICompositionRadialGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionRadialGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRadialGradientBrush := ICompositionRadialGradientBrush(outPtr)
        }

        return this.__ICompositionRadialGradientBrush.put_EllipseRadius(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_GradientOriginOffset() {
        if (!this.HasProp("__ICompositionRadialGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionRadialGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRadialGradientBrush := ICompositionRadialGradientBrush(outPtr)
        }

        return this.__ICompositionRadialGradientBrush.get_GradientOriginOffset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_GradientOriginOffset(value) {
        if (!this.HasProp("__ICompositionRadialGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionRadialGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRadialGradientBrush := ICompositionRadialGradientBrush(outPtr)
        }

        return this.__ICompositionRadialGradientBrush.put_GradientOriginOffset(value)
    }

;@endregion Instance Methods
}
