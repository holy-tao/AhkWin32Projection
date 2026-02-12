#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionBrush.ahk
#Include .\ICompositionGradientBrush.ahk
#Include .\ICompositionGradientBrush2.ahk
#Include .\ICompositionGradientBrushFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a brush that describes a gradient, composed of gradient stops.
  * 
  * CompositionGradientBrush is supported only with Rgb and RgbLinear CompositionColorSpace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionGradientBrush extends CompositionBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionGradientBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionGradientBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the point on the brush to be positioned at the brush's offset.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.anchorpoint
     * @type {Vector2} 
     */
    AnchorPoint {
        get => this.get_AnchorPoint()
        set => this.put_AnchorPoint(value)
    }

    /**
     * Gets or sets the point about which the brush is rotated and scaled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.centerpoint
     * @type {Vector2} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * Gets the brush's gradient stops.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.colorstops
     * @type {CompositionColorGradientStopCollection} 
     */
    ColorStops {
        get => this.get_ColorStops()
    }

    /**
     * Gets or sets a value that specifies how to draw the gradient outside the brush's gradient vector or space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.extendmode
     * @type {Integer} 
     */
    ExtendMode {
        get => this.get_ExtendMode()
        set => this.put_ExtendMode(value)
    }

    /**
     * Gets or sets a value that specifies how the gradient's colors are interpolated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.interpolationspace
     * @type {Integer} 
     */
    InterpolationSpace {
        get => this.get_InterpolationSpace()
        set => this.put_InterpolationSpace(value)
    }

    /**
     * Gets or sets the offset of the brush relative to the object being painted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * Gets or sets the rotation angle of the brush in radians.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * Gets or sets the rotation angle of the brush in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.rotationangleindegrees
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * Gets or sets the scale to apply to the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.scale
     * @type {Vector2} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * Gets or sets the matrix of transforms to apply to the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.transformmatrix
     * @type {Matrix3x2} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
    }

    /**
     * Gets or sets a value that indicates whether the gradient brush's positioning coordinates (StartPoint, EndPoint) are absolute or relative to the output area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongradientbrush.mappingmode
     * @type {Integer} 
     */
    MappingMode {
        get => this.get_MappingMode()
        set => this.put_MappingMode(value)
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
    get_AnchorPoint() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_AnchorPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_AnchorPoint(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_AnchorPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_CenterPoint() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_CenterPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_CenterPoint(value)
    }

    /**
     * 
     * @returns {CompositionColorGradientStopCollection} 
     */
    get_ColorStops() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_ColorStops()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendMode() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_ExtendMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ExtendMode(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_ExtendMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterpolationSpace() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_InterpolationSpace()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InterpolationSpace(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_InterpolationSpace(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_RotationAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngleInDegrees(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_RotationAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Scale() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_Scale()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_Scale(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_TransformMatrix() {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.get_TransformMatrix()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        if (!this.HasProp("__ICompositionGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush := ICompositionGradientBrush(outPtr)
        }

        return this.__ICompositionGradientBrush.put_TransformMatrix(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MappingMode() {
        if (!this.HasProp("__ICompositionGradientBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush2 := ICompositionGradientBrush2(outPtr)
        }

        return this.__ICompositionGradientBrush2.get_MappingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MappingMode(value) {
        if (!this.HasProp("__ICompositionGradientBrush2")) {
            if ((queryResult := this.QueryInterface(ICompositionGradientBrush2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGradientBrush2 := ICompositionGradientBrush2(outPtr)
        }

        return this.__ICompositionGradientBrush2.put_MappingMode(value)
    }

;@endregion Instance Methods
}
