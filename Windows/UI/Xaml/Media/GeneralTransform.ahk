#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IGeneralTransform.ahk
#Include .\IGeneralTransformOverrides.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides generalized transformation support for objects. GeneralTransform is a base class that's in the hierarchy of practical transform classes such as [TranslateTransform](translatetransform.md).
 * @remarks
 * Transformation types include rotation ([RotateTransform](rotatetransform.md)), scale ([ScaleTransform](scaletransform.md)), skew/shear ([SkewTransform](skewtransform.md)), and translation ([TranslateTransform](translatetransform.md)).
 * 
 * [MatrixTransform](matrixtransform.md) is for transforms that don't use these conventions and instead use [Matrix](matrix.md) values for transform definition.
 * 
 * [CompositeTransform](compositetransform.md) and [TransformGroup](transformgroup.md) both support specifying multiple transforms for a combined transformation logic.
 * 
 * There's also an intermediate base class, [Transform](transform.md). Properties sometimes are typed as GeneralTransform or [Transform](transform.md) so that you can use any of the practical transforms to provide values.
 * 
 * You can animate properties of a transform. For XAML syntaxes that take a [Transform](transform.md), you need to specify a nonabstract derived type of [Transform](transform.md) as an object element. Typically, this is one of: [MatrixTransform](matrixtransform.md), [RotateTransform](rotatetransform.md), [ScaleTransform](scaletransform.md), [SkewTransform](skewtransform.md), or [TranslateTransform](translatetransform.md). See the syntax sections on the appropriate class.
 * 
 * Use the [MatrixTransform](matrixtransform.md) class to create custom transformations that are not provided by the other [Transform](transform.md) derived classes. A two-dimensional x-y plane uses a 3x3 matrix for transformations. 
 * <!--You can multiply affine transformation matrices to form linear transformations, such as rotation and skew (shear) that are followed by translation. 
 * 
 * An affine transformation matrix has its final column equal to (0, 0, 1); therefore, you only have to specify the members in the first two columns.
 * 
 * You cannot extract the matrix-specific information from the nonmatrix transformations. However you can adjust the nonmatrix transformations with their specific properties, or replace a transformation with a matrix transformation at run time.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class GeneralTransform extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeneralTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeneralTransform.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the inverse transformation of this [GeneralTransform](generaltransform.md), if possible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.inverse
     * @type {GeneralTransform} 
     */
    Inverse {
        get => this.get_Inverse()
    }

    /**
     * Implements the behavior for return value of [Inverse](generaltransform_inverse.md) in a derived or custom [GeneralTransform](generaltransform.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.inversecore
     * @type {GeneralTransform} 
     */
    InverseCore {
        get => this.get_InverseCore()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GeneralTransform} 
     */
    get_Inverse() {
        if (!this.HasProp("__IGeneralTransform")) {
            if ((queryResult := this.QueryInterface(IGeneralTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransform := IGeneralTransform(outPtr)
        }

        return this.__IGeneralTransform.get_Inverse()
    }

    /**
     * Uses this transformation object's logic to transform the specified point, and returns the result.
     * @remarks
     * The purpose of transformations is to convert data in coordinate systems to new frames of reference for a different coordinate system. Call this method to use the logic of this specific [Transform](transform.md) derived class in order to convert a [Point](../windows.foundation/point.md) of the initial coordinate system into a [Point](../windows.foundation/point.md) in the coordinate system as it's interpreted by the transformation.
     * @param {POINT} point_ The point to transform using the transformation logic.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.transformpoint
     */
    TransformPoint(point_) {
        if (!this.HasProp("__IGeneralTransform")) {
            if ((queryResult := this.QueryInterface(IGeneralTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransform := IGeneralTransform(outPtr)
        }

        return this.__IGeneralTransform.TransformPoint(point_)
    }

    /**
     * Attempts to transform the specified point and returns a value that indicates whether the transformation was successful.
     * @param {POINT} inPoint The point to transform.
     * @param {Pointer<POINT>} outPoint The result of transforming *inPoint*.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.trytransform
     */
    TryTransform(inPoint, outPoint) {
        if (!this.HasProp("__IGeneralTransform")) {
            if ((queryResult := this.QueryInterface(IGeneralTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransform := IGeneralTransform(outPtr)
        }

        return this.__IGeneralTransform.TryTransform(inPoint, outPoint)
    }

    /**
     * Transforms the specified bounding box and returns an axis-aligned bounding box that is exactly large enough to contain it.
     * @param {RECT} rect_ The bounding box to transform.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.transformbounds
     */
    TransformBounds(rect_) {
        if (!this.HasProp("__IGeneralTransform")) {
            if ((queryResult := this.QueryInterface(IGeneralTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransform := IGeneralTransform(outPtr)
        }

        return this.__IGeneralTransform.TransformBounds(rect_)
    }

    /**
     * 
     * @returns {GeneralTransform} 
     */
    get_InverseCore() {
        if (!this.HasProp("__IGeneralTransformOverrides")) {
            if ((queryResult := this.QueryInterface(IGeneralTransformOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransformOverrides := IGeneralTransformOverrides(outPtr)
        }

        return this.__IGeneralTransformOverrides.get_InverseCore()
    }

    /**
     * Provides the means to override the [TryTransform](generaltransform_trytransform_509328310.md) behavior in a derived transform class.
     * @param {POINT} inPoint The point to transform.
     * @param {Pointer<POINT>} outPoint The result of transforming *inPoint*.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.trytransformcore
     */
    TryTransformCore(inPoint, outPoint) {
        if (!this.HasProp("__IGeneralTransformOverrides")) {
            if ((queryResult := this.QueryInterface(IGeneralTransformOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransformOverrides := IGeneralTransformOverrides(outPtr)
        }

        return this.__IGeneralTransformOverrides.TryTransformCore(inPoint, outPoint)
    }

    /**
     * Provides the means to override the [TransformBounds](generaltransform_transformbounds_2050801728.md) behavior in a derived transform class.
     * @param {RECT} rect_ The bounding box to transform.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.generaltransform.transformboundscore
     */
    TransformBoundsCore(rect_) {
        if (!this.HasProp("__IGeneralTransformOverrides")) {
            if ((queryResult := this.QueryInterface(IGeneralTransformOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeneralTransformOverrides := IGeneralTransformOverrides(outPtr)
        }

        return this.__IGeneralTransformOverrides.TransformBoundsCore(rect_)
    }

;@endregion Instance Methods
}
