#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionShape.ahk
#Include .\ICompositionShapeFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base shape class.
 * @remarks
 * This is the base class for [CompositionContainerShape](compositioncontainershape.md) and [CompositionSpriteShape](compositionspriteshape.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionShape extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionShape

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionShape.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The point about which the shape is rotated and scaled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape.centerpoint
     * @type {Vector2} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * Gets or sets the offset of the shape relative to its [ShapeVisual](shapevisual.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * Gets or sets the rotation angle of the shape in radians.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * Gets or sets the rotation angle of the shape in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape.rotationangleindegrees
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * Gets or sets the scale to apply to the shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape.scale
     * @type {Vector2} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * Gets or sets the transform matrix to apply to the shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionshape.transformmatrix
     * @type {Matrix3x2} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
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
    get_CenterPoint() {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.get_CenterPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.put_CenterPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.get_RotationAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngleInDegrees(value) {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.put_RotationAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Scale() {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.get_Scale()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.put_Scale(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_TransformMatrix() {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.get_TransformMatrix()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        if (!this.HasProp("__ICompositionShape")) {
            if ((queryResult := this.QueryInterface(ICompositionShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionShape := ICompositionShape(outPtr)
        }

        return this.__ICompositionShape.put_TransformMatrix(value)
    }

;@endregion Instance Methods
}
