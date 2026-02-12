#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMatrixHelper.ahk
#Include .\IMatrixHelperStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides static helper methods for processing [Matrix](matrix.md) values. C# and Microsoft Visual Basic code should use members of [Matrix](matrix.md) instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixhelper
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class MatrixHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMatrixHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMatrixHelper.IID

    /**
     * Gets a static constructed [Matrix](matrix.md) where the values established are representative of an **Identity** transform.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixhelper.identity
     * @type {Matrix} 
     */
    static Identity {
        get => MatrixHelper.get_Identity()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Matrix} 
     */
    static get_Identity() {
        if (!MatrixHelper.HasProp("__IMatrixHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.MatrixHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrixHelperStatics.IID)
            MatrixHelper.__IMatrixHelperStatics := IMatrixHelperStatics(factoryPtr)
        }

        return MatrixHelper.__IMatrixHelperStatics.get_Identity()
    }

    /**
     * Creates a new [Matrix](matrix.md) based on provided initial [Matrix](matrix.md) data values.
     * @param {Float} m11 The initial value of **M11** for the created [Matrix](matrix.md).
     * @param {Float} m12 The initial value of **M12** for the created [Matrix](matrix.md).
     * @param {Float} m21 The initial value of **M21** for the created [Matrix](matrix.md).
     * @param {Float} m22 The initial value of **M22** for the created [Matrix](matrix.md).
     * @param {Float} offsetX The initial value of **OffsetX** for the created [Matrix](matrix.md).
     * @param {Float} offsetY The initial value of **OffsetY** for the created [Matrix](matrix.md).
     * @returns {Matrix} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixhelper.fromelements
     */
    static FromElements(m11, m12, m21, m22, offsetX, offsetY) {
        if (!MatrixHelper.HasProp("__IMatrixHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.MatrixHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrixHelperStatics.IID)
            MatrixHelper.__IMatrixHelperStatics := IMatrixHelperStatics(factoryPtr)
        }

        return MatrixHelper.__IMatrixHelperStatics.FromElements(m11, m12, m21, m22, offsetX, offsetY)
    }

    /**
     * Returns whether the provided [Matrix](matrix.md) represents an **Identity** transform.
     * @param {Matrix} target The target [Matrix](matrix.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixhelper.getisidentity
     */
    static GetIsIdentity(target) {
        if (!MatrixHelper.HasProp("__IMatrixHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.MatrixHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrixHelperStatics.IID)
            MatrixHelper.__IMatrixHelperStatics := IMatrixHelperStatics(factoryPtr)
        }

        return MatrixHelper.__IMatrixHelperStatics.GetIsIdentity(target)
    }

    /**
     * Transforms a provided [Matrix](matrix.md) using a [Point](../windows.foundation/point.md) input, and returns a [Point](../windows.foundation/point.md) result.
     * @param {Matrix} target The target [Matrix](matrix.md) to evaluate.
     * @param {POINT} point_ The [Point](../windows.foundation/point.md) input for the transform operation.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.matrixhelper.transform
     */
    static Transform(target, point_) {
        if (!MatrixHelper.HasProp("__IMatrixHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.MatrixHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrixHelperStatics.IID)
            MatrixHelper.__IMatrixHelperStatics := IMatrixHelperStatics(factoryPtr)
        }

        return MatrixHelper.__IMatrixHelperStatics.Transform(target, point_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
