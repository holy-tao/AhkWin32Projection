#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionClip.ahk
#Include .\ICompositionClip2.ahk
#Include .\ICompositionClipFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Base class for clipping objects such as [InsetClip](insetclip.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionClip extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionClip

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionClip.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The point on the clip to be positioned at the clip's offset. Value is normalized with respect to the size of the clip.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.anchorpoint
     * @type {Vector2} 
     */
    AnchorPoint {
        get => this.get_AnchorPoint()
        set => this.put_AnchorPoint(value)
    }

    /**
     * The point about which rotation or scaling occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.centerpoint
     * @type {Vector2} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * The offset of the clip relative to the visual on which the clip is applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The angle of rotation applied to the clip, in radians.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * The angle of rotation applied to the clip, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.rotationangleindegrees
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * The scale to apply to the clip.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.scale
     * @type {Vector2} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * The 3x2 transformation matrix to apply to the clip.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionclip.transformmatrix
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
    get_AnchorPoint() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_AnchorPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_AnchorPoint(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_AnchorPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_CenterPoint() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_CenterPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_CenterPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_RotationAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngleInDegrees(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_RotationAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Scale() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_Scale()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_Scale(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_TransformMatrix() {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.get_TransformMatrix()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        if (!this.HasProp("__ICompositionClip2")) {
            if ((queryResult := this.QueryInterface(ICompositionClip2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionClip2 := ICompositionClip2(outPtr)
        }

        return this.__ICompositionClip2.put_TransformMatrix(value)
    }

;@endregion Instance Methods
}
