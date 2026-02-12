#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMatrix3DHelper.ahk
#Include .\IMatrix3DHelperStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides static utilities for [Matrix3D](matrix3d.md). C# and Microsoft Visual Basic code should use members of [Matrix3D](matrix3d.md) instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class Matrix3DHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMatrix3DHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMatrix3DHelper.IID

    /**
     * Gets a static constructed [Matrix3D](matrix3d.md) where the values established are representative of an **Identity** transform. C# and Microsoft Visual Basic code should use [Identity](/dotnet/api/windows.ui.xaml.media.media3d.matrix3d.identity) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper.identity
     * @type {Matrix3D} 
     */
    static Identity {
        get => Matrix3DHelper.get_Identity()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Matrix3D} 
     */
    static get_Identity() {
        if (!Matrix3DHelper.HasProp("__IMatrix3DHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.Matrix3DHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DHelperStatics.IID)
            Matrix3DHelper.__IMatrix3DHelperStatics := IMatrix3DHelperStatics(factoryPtr)
        }

        return Matrix3DHelper.__IMatrix3DHelperStatics.get_Identity()
    }

    /**
     * Multiplies the specified matrices. C# and Microsoft Visual Basic code should use the multiplication operator instead. 
     * <!--Add link if we add Matrix3D.Multiply-->
     * @param {Matrix3D} matrix1 The first matrix to multiply.
     * @param {Matrix3D} matrix2 The second matrix to multiply.
     * @returns {Matrix3D} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper.multiply
     */
    static Multiply(matrix1, matrix2) {
        if (!Matrix3DHelper.HasProp("__IMatrix3DHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.Matrix3DHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DHelperStatics.IID)
            Matrix3DHelper.__IMatrix3DHelperStatics := IMatrix3DHelperStatics(factoryPtr)
        }

        return Matrix3DHelper.__IMatrix3DHelperStatics.Multiply(matrix1, matrix2)
    }

    /**
     * Defines a new [Matrix3D](matrix3d.md) value, using element values for each of the possible values of a [Matrix3D](matrix3d.md) structure. C# and Microsoft Visual Basic code should use [Matrix3D](/dotnet/api/windows.ui.xaml.media.media3d.matrix3d.-ctor) constructor instead.
     * @param {Float} m11 The value to set for **M11** of the [Matrix3D](matrix3d.md).
     * @param {Float} m12 The value to set for **M12** of the [Matrix3D](matrix3d.md)..
     * @param {Float} m13 The value to set for **M13** of the [Matrix3D](matrix3d.md).
     * @param {Float} m14 The value to set for **M14** of the [Matrix3D](matrix3d.md).
     * @param {Float} m21 The value to set for **M21** of the [Matrix3D](matrix3d.md).
     * @param {Float} m22 The value to set for **M22** of the [Matrix3D](matrix3d.md).
     * @param {Float} m23 The value to set for **M23** of the [Matrix3D](matrix3d.md).
     * @param {Float} m24 The value to set for **M24** of the [Matrix3D](matrix3d.md).
     * @param {Float} m31 The value to set for **M31** of the [Matrix3D](matrix3d.md).
     * @param {Float} m32 The value to set for **M32** of the [Matrix3D](matrix3d.md).
     * @param {Float} m33 The value to set for **M33** of the [Matrix3D](matrix3d.md).
     * @param {Float} m34 The value to set for **M34** of the [Matrix3D](matrix3d.md).
     * @param {Float} offsetX The value to set for **OffsetX** (row 4, column 1) of the [Matrix3D](matrix3d.md).
     * @param {Float} offsetY The value to set for **OffsetY** (row 4, column 2) of the [Matrix3D](matrix3d.md).
     * @param {Float} offsetZ The value to set for **OffsetZ** (row 4, column 3) of the [Matrix3D](matrix3d.md).
     * @param {Float} m44 The value to set for **M44** of the [Matrix3D](matrix3d.md).
     * @returns {Matrix3D} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper.fromelements
     */
    static FromElements(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, offsetX, offsetY, offsetZ, m44) {
        if (!Matrix3DHelper.HasProp("__IMatrix3DHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.Matrix3DHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DHelperStatics.IID)
            Matrix3DHelper.__IMatrix3DHelperStatics := IMatrix3DHelperStatics(factoryPtr)
        }

        return Matrix3DHelper.__IMatrix3DHelperStatics.FromElements(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, offsetX, offsetY, offsetZ, m44)
    }

    /**
     * Returns whether the provided [Matrix3D](matrix3d.md) is invertible. C# and Microsoft Visual Basic code should use [HasInverse](/dotnet/api/windows.ui.xaml.media.media3d.matrix3d.hasinverse) instead.
     * @param {Matrix3D} target The target [Matrix3D](matrix3d.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper.gethasinverse
     */
    static GetHasInverse(target) {
        if (!Matrix3DHelper.HasProp("__IMatrix3DHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.Matrix3DHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DHelperStatics.IID)
            Matrix3DHelper.__IMatrix3DHelperStatics := IMatrix3DHelperStatics(factoryPtr)
        }

        return Matrix3DHelper.__IMatrix3DHelperStatics.GetHasInverse(target)
    }

    /**
     * Returns whether the provided [Matrix3D](matrix3d.md) represents an **Identity** transform. C# and Microsoft Visual Basic code should use [IsIdentity](/dotnet/api/windows.ui.xaml.media.media3d.matrix3d.isidentity) instead.
     * @param {Matrix3D} target The target [Matrix3D](matrix3d.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper.getisidentity
     */
    static GetIsIdentity(target) {
        if (!Matrix3DHelper.HasProp("__IMatrix3DHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.Matrix3DHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DHelperStatics.IID)
            Matrix3DHelper.__IMatrix3DHelperStatics := IMatrix3DHelperStatics(factoryPtr)
        }

        return Matrix3DHelper.__IMatrix3DHelperStatics.GetIsIdentity(target)
    }

    /**
     * Returns a potentially new [Matrix3D](matrix3d.md) value that represents the inversion of the provided [Matrix3D](matrix3d.md). C# and Microsoft Visual Basic code should use [Invert](/dotnet/api/windows.ui.xaml.media.media3d.matrix3d.invert) instead.
     * @param {Matrix3D} target The target [Matrix3D](matrix3d.md) to evaluate.
     * @returns {Matrix3D} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.matrix3dhelper.invert
     */
    static Invert(target) {
        if (!Matrix3DHelper.HasProp("__IMatrix3DHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.Matrix3DHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMatrix3DHelperStatics.IID)
            Matrix3DHelper.__IMatrix3DHelperStatics := IMatrix3DHelperStatics(factoryPtr)
        }

        return Matrix3DHelper.__IMatrix3DHelperStatics.Invert(target)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
