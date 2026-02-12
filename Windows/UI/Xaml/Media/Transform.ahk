#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GeneralTransform.ahk
#Include .\ITransform.ahk
#Include .\ITransformFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines functionality that enables transformations in a two-dimensional plane.
 * @remarks
 * Transformation types include rotation ([RotateTransform](rotatetransform.md)), scale ([ScaleTransform](scaletransform.md)), skew/shear ([SkewTransform](skewtransform.md)), and translation ([TranslateTransform](translatetransform.md)).
 * 
 * [MatrixTransform](matrixtransform.md) is for transforms that don't use these conventions and instead use [Matrix](matrix.md) values for transform definition.
 * 
 * [CompositeTransform](compositetransform.md) and [TransformGroup](transformgroup.md) both support specifying multiple transforms for a combined transformation logic.
 * 
 * You can animate properties of a transform. For XAML syntaxes that take a Transform, you need to specify a nonabstract derived type of Transform as an object element. Typically, this is one of: [MatrixTransform](matrixtransform.md), [RotateTransform](rotatetransform.md), [ScaleTransform](scaletransform.md), [SkewTransform](skewtransform.md), or [TranslateTransform](translatetransform.md). See the syntax sections on the appropriate class.
 * 
 * Use the [MatrixTransform](matrixtransform.md) class to create custom transformations that are not provided by the other Transform derived classes. A two-dimensional x-y plane uses a 3x3 matrix for transformations. 
 * <!--You can multiply affine transformation matrices to form linear transformations, such as rotation and skew (shear) that are followed by translation. 
 * 
 * An affine transformation matrix has its final column equal to (0, 0, 1); therefore, you only have to specify the members in the first two columns.
 * 
 * You cannot extract the matrix-specific information from the nonmatrix transformations. However you can adjust the nonmatrix transformations with their specific properties, or replace a transformation with a matrix transformation at run time.-->
 * 
 * 
 * Transform is the property type for [UIElement.RenderTransform](../windows.ui.xaml/uielement_rendertransform.md). With this property, you can apply any of the practical transforms to a [UIElement](../windows.ui.xaml/uielement.md) when it renders. Other less commonly used properties that take a Transform are: [Brush.RelativeTransform](brush_relativetransform.md), [Brush.Transform](brush_transform.md), [Geometry.Transform](geometry_transform.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.transform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Transform extends GeneralTransform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITransform.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
