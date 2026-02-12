#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionSurfaceBrush.ahk
#Include .\ICompositionSurfaceBrush2.ahk
#Include .\ICompositionSurfaceBrush3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Paints a [SpriteVisual](spritevisual.md) with pixels from an ICompositionSurface.
 * @remarks
 * The Stretch property, in conjunction with the HorizontalAlignmentRatio and VerticalAlignmentRatio properties, is used to specify the scale and positioning of the CompositionSurfaceBrush’s contents when painted onto a SpriteVisual.
 * 
 * CompositionSurfaceBrush also has the following properties that enable custom transformations:
 * 
 * + AnchorPoint
 * + CenterPoint
 * + Offset
 * + RotationAngle
 * + RotationAngleInDegrees
 * + Scale
 * + TransformMatrix
 * 
 * The order of transformation operations on a CompositionSurfaceBrush is as follows:
 * 
 * 1. The content of the CompositionSurfaceBrush is stretched and aligned onto the [SpriteVisual](spritevisual.md) (see [Stretch](compositionsurfacebrush_stretch.md), [HorizontalAlignmentRatio](compositionsurfacebrush_horizontalalignmentratio.md), and [VerticalAlignmentRatio](compositionsurfacebrush_verticalalignmentratio.md) properties).
 * 
 * 1. Any other transformation properties set on the CompositionSurfaceBrush are applied.
 * 
 *     Custom transformations applied to a CompositionSurfaceBrush are therefore evaluated in the coordinate space of the SpriteVisual that the brush is painted onto. For example, setting an Offset of Vector2(100, 0) offsets the brush’s stretched and aligned contents by 100 units to the right relative to the left edge of the [SpriteVisual](spritevisual.md) it is painted onto.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionSurfaceBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionSurfaceBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionSurfaceBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the algorithm used for interpolating pixels from ICompositionSurface when they do not form a one-to-one mapping to pixels on [SpriteVisual](spritevisual.md) (as can happen under stretch, scale, rotation, and other transformations).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.bitmapinterpolationmode
     * @type {Integer} 
     */
    BitmapInterpolationMode {
        get => this.get_BitmapInterpolationMode()
        set => this.put_BitmapInterpolationMode(value)
    }

    /**
     * Controls the positioning of the vertical axis of content with respect to the vertical axis of the [SpriteVisual](spritevisual.md). The value is clamped from 0.0f to 1.0f with 0.0f representing the left vertical edge and 1.0f representing the right vertical edge of the [SpriteVisual](spritevisual.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.horizontalalignmentratio
     * @type {Float} 
     */
    HorizontalAlignmentRatio {
        get => this.get_HorizontalAlignmentRatio()
        set => this.put_HorizontalAlignmentRatio(value)
    }

    /**
     * Controls the scaling that is applied to the contents the [ICompositionSurface](icompositionsurface.md) with respect to the size of the [SpriteVisual](spritevisual.md) that is being painted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * The [ICompositionSurface](icompositionsurface.md) associated with the [CompositionSurfaceBrush](compositionsurfacebrush.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.surface
     * @type {ICompositionSurface} 
     */
    Surface {
        get => this.get_Surface()
        set => this.put_Surface(value)
    }

    /**
     * Controls the positioning of the horizontal axis of content with respect to the horizontal axis of the [SpriteVisual](spritevisual.md). The value is clamped from 0.0f to 1.0f with 0.0f representing the top horizontal edge and 1.0f representing the bottom horizontal edge of the [SpriteVisual](spritevisual.md). The default value is 0.5f.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.verticalalignmentratio
     * @type {Float} 
     */
    VerticalAlignmentRatio {
        get => this.get_VerticalAlignmentRatio()
        set => this.put_VerticalAlignmentRatio(value)
    }

    /**
     * The point on the brush to be positioned at the brush's offset. Value is normalized with respect to the size of the SpriteVisual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.anchorpoint
     * @type {Vector2} 
     */
    AnchorPoint {
        get => this.get_AnchorPoint()
        set => this.put_AnchorPoint(value)
    }

    /**
     * The point about which the brush is rotated and scaled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.centerpoint
     * @type {Vector2} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * The offset of the brush relative to its [SpriteVisual](spritevisual.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The rotation angle, in radians, of the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * The rotation angle, in degrees, of the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.rotationangleindegrees
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * The scale to apply to the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.scale
     * @type {Vector2} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * The transformation matrix to apply to the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.transformmatrix
     * @type {Matrix3x2} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
    }

    /**
     * Gets or sets a value that indicates whether the surface brush aligns with pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionsurfacebrush.snaptopixels
     * @type {Boolean} 
     */
    SnapToPixels {
        get => this.get_SnapToPixels()
        set => this.put_SnapToPixels(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapInterpolationMode() {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.get_BitmapInterpolationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BitmapInterpolationMode(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.put_BitmapInterpolationMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalAlignmentRatio() {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.get_HorizontalAlignmentRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAlignmentRatio(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.put_HorizontalAlignmentRatio(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.put_Stretch(value)
    }

    /**
     * 
     * @returns {ICompositionSurface} 
     */
    get_Surface() {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.get_Surface()
    }

    /**
     * 
     * @param {ICompositionSurface} value 
     * @returns {HRESULT} 
     */
    put_Surface(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.put_Surface(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAlignmentRatio() {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.get_VerticalAlignmentRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalAlignmentRatio(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush := ICompositionSurfaceBrush(outPtr)
        }

        return this.__ICompositionSurfaceBrush.put_VerticalAlignmentRatio(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_AnchorPoint() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_AnchorPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_AnchorPoint(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_AnchorPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_CenterPoint() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_CenterPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_CenterPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_RotationAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngleInDegrees(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_RotationAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Scale() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_Scale()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_Scale(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_TransformMatrix() {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.get_TransformMatrix()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush2 := ICompositionSurfaceBrush2(outPtr)
        }

        return this.__ICompositionSurfaceBrush2.put_TransformMatrix(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SnapToPixels() {
        if (!this.HasProp("__ICompositionSurfaceBrush3")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush3 := ICompositionSurfaceBrush3(outPtr)
        }

        return this.__ICompositionSurfaceBrush3.get_SnapToPixels()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SnapToPixels(value) {
        if (!this.HasProp("__ICompositionSurfaceBrush3")) {
            if ((queryResult := this.QueryInterface(ICompositionSurfaceBrush3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionSurfaceBrush3 := ICompositionSurfaceBrush3(outPtr)
        }

        return this.__ICompositionSurfaceBrush3.put_SnapToPixels(value)
    }

;@endregion Instance Methods
}
