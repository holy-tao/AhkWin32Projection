#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Projection.ahk
#Include .\IMatrix3DProjection.ahk
#Include .\IMatrix3DProjectionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Applies a [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md) projection to an object.
 * @remarks
 * You can use the Matrix3DProjection and [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md) types for more complex semi–3-D scenarios than are possible with the [PlaneProjection](planeprojection.md) type. Matrix3DProjection provides a complete 3-D transform matrix to apply to any [UIElement](../windows.ui.xaml/uielement.md) (you use this as a value for the [UIElement.Projection](../windows.ui.xaml/uielement_projection.md) property). The matrix lets you apply arbitrary model transform matrices and perspective matrices to visual elements.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrix3dprojection
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Matrix3DProjection extends Projection {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMatrix3DProjection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMatrix3DProjection.IID

    /**
     * Identifies the [ProjectionMatrix](matrix3dprojection_projectionmatrix.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrix3dprojection.projectionmatrixproperty
     * @type {DependencyProperty} 
     */
    static ProjectionMatrixProperty {
        get => Matrix3DProjection.get_ProjectionMatrixProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProjectionMatrixProperty() {
        if (!Matrix3DProjection.HasProp("__IMatrix3DProjectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Matrix3DProjection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DProjectionStatics.IID)
            Matrix3DProjection.__IMatrix3DProjectionStatics := IMatrix3DProjectionStatics(factoryPtr)
        }

        return Matrix3DProjection.__IMatrix3DProjectionStatics.get_ProjectionMatrixProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md) that is used for the projection that is applied to the object.
     * @remarks
     * The XAML syntax shown requires specifying the 16 properties of a [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md) structure in a particular order. For a guide to the string format and the order that's needed for this, see [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md).
     * 
     * If you use an explicit [Matrix3D](matrix3dprojection.md) object element rather than the ProjectionMatrix attribute syntax, you need to map a XAML namespace for [Windows.UI.Xaml.Media.Media3D](../windows.ui.xaml.media.media3d/windows_ui_xaml_media_media3d.md) to use the [Matrix3D](matrix3dprojection.md) type. For more info, see "XAML syntax for **Matrix3D** " in Remarks for [Matrix3D](../windows.ui.xaml.media.media3d/matrix3d.md).
     * 
     * ProjectionMatrix is the XAML content property for [Matrix3DProjection](matrix3dprojection.md), so you can omit XAML property elements if you do use the explicit [Matrix3D](matrix3dprojection.md) object element rather than the attribute form with initialization string.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrix3dprojection.projectionmatrix
     * @type {Matrix3D} 
     */
    ProjectionMatrix {
        get => this.get_ProjectionMatrix()
        set => this.put_ProjectionMatrix(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [Matrix3DProjection](matrix3dprojection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Matrix3DProjection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Matrix3D} 
     */
    get_ProjectionMatrix() {
        if (!this.HasProp("__IMatrix3DProjection")) {
            if ((queryResult := this.QueryInterface(IMatrix3DProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMatrix3DProjection := IMatrix3DProjection(outPtr)
        }

        return this.__IMatrix3DProjection.get_ProjectionMatrix()
    }

    /**
     * 
     * @param {Matrix3D} value 
     * @returns {HRESULT} 
     */
    put_ProjectionMatrix(value) {
        if (!this.HasProp("__IMatrix3DProjection")) {
            if ((queryResult := this.QueryInterface(IMatrix3DProjection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMatrix3DProjection := IMatrix3DProjection(outPtr)
        }

        return this.__IMatrix3DProjection.put_ProjectionMatrix(value)
    }

;@endregion Instance Methods
}
