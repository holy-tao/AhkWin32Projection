#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\IMatrixTransform.ahk
#Include .\IMatrixTransformStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates an arbitrary affine matrix transformation that is used to manipulate objects or coordinate systems in a two-dimensional plane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixtransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class MatrixTransform extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMatrixTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMatrixTransform.IID

    /**
     * Identifies the [Matrix](matrixtransform_matrix.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixtransform.matrixproperty
     * @type {DependencyProperty} 
     */
    static MatrixProperty {
        get => MatrixTransform.get_MatrixProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MatrixProperty() {
        if (!MatrixTransform.HasProp("__IMatrixTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.MatrixTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrixTransformStatics.IID)
            MatrixTransform.__IMatrixTransformStatics := IMatrixTransformStatics(factoryPtr)
        }

        return MatrixTransform.__IMatrixTransformStatics.get_MatrixProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Matrix](matrix.md) that defines this transformation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixtransform.matrix
     * @type {Matrix} 
     */
    Matrix {
        get => this.get_Matrix()
        set => this.put_Matrix(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MatrixTransform](matrixtransform.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.MatrixTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Matrix} 
     */
    get_Matrix() {
        if (!this.HasProp("__IMatrixTransform")) {
            if ((queryResult := this.QueryInterface(IMatrixTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMatrixTransform := IMatrixTransform(outPtr)
        }

        return this.__IMatrixTransform.get_Matrix()
    }

    /**
     * 
     * @param {Matrix} value 
     * @returns {HRESULT} 
     */
    put_Matrix(value) {
        if (!this.HasProp("__IMatrixTransform")) {
            if ((queryResult := this.QueryInterface(IMatrixTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMatrixTransform := IMatrixTransform(outPtr)
        }

        return this.__IMatrixTransform.put_Matrix(value)
    }

;@endregion Instance Methods
}
