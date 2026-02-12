#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRectHelper.ahk
#Include .\IRectHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides helper methods to evaluate or set [Rect](../windows.foundation/rect.md) values. C# and Microsoft Visual Basic code should use members of [Rect](../windows.foundation/rect.md) instead.
 * @remarks
 * [Rect](../windows.foundation/rect.md) is a Windows Runtime structure that represents a rectangle's dimensions with an origin.
 * 
 * RectHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of [Rect](../windows.foundation/rect.md) instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the data values on [Rect](../windows.foundation/rect.md), for example **Left**. For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on [Rect](../windows.foundation/rect.md) are available in a static form on the RectHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class RectHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRectHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRectHelper.IID

    /**
     * Gets a static [Rect](../windows.foundation/rect.md) value where the [Rect](../windows.foundation/rect.md) has no size or position. C# and Microsoft Visual Basic code should use [Rect.Empty](/dotnet/api/windows.foundation.rect.empty?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.empty
     * @type {RECT} 
     */
    static Empty {
        get => RectHelper.get_Empty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RECT} 
     */
    static get_Empty() {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.get_Empty()
    }

    /**
     * Creates a new [Rect](../windows.foundation/rect.md) value based on the element values of a [Rect](../windows.foundation/rect.md) structure. C# and Microsoft Visual Basic code should use the [Rect(Double,Double,Double,Double)](/dotnet/api/windows.foundation.rect.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_Foundation_Rect__ctor_System_Double_System_Double_System_Double_System_Double_) constructor instead.
     * @param {Float} x The pixel value to set for **X**.
     * @param {Float} y The pixel value to set for **Y**.
     * @param {Float} width The pixel value to set for **Width**.
     * @param {Float} height The pixel value to set for **Height**.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.fromcoordinatesanddimensions
     */
    static FromCoordinatesAndDimensions(x, y, width, height) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.FromCoordinatesAndDimensions(x, y, width, height)
    }

    /**
     * Creates a new [Rect](../windows.foundation/rect.md) value based on two points. C# and Microsoft Visual Basic code should use the [Rect(Point,Point)](/dotnet/api/windows.foundation.rect.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_Foundation_Rect__ctor_Windows_Foundation_Point_Windows_Foundation_Point_) constructor instead.
     * @param {POINT} point1 The first point.
     * @param {POINT} point2 The second point.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.frompoints
     */
    static FromPoints(point1, point2) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.FromPoints(point1, point2)
    }

    /**
     * Creates a new [Rect](../windows.foundation/rect.md) value based on a [Point](../windows.foundation/point.md) that specifies the upper-left origin, and a [Size](../windows.foundation/size.md) that specifies the width and height. C# and Microsoft Visual Basic code should use the [Rect(Point,Size)](/dotnet/api/windows.foundation.rect.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_Foundation_Rect__ctor_Windows_Foundation_Point_Windows_Foundation_Size_) constructor instead.
     * @param {POINT} location_ The [Point](../windows.foundation/point.md) location of the origin (upper left).
     * @param {SIZE} size_ The [Size](../windows.foundation/size.md) that specifies width and height.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.fromlocationandsize
     */
    static FromLocationAndSize(location_, size_) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.FromLocationAndSize(location_, size_)
    }

    /**
     * Returns whether a specified [Rect](../windows.foundation/rect.md) is equivalent to an [Empty](recthelper_empty.md) [Rect](../windows.foundation/rect.md). C# and Microsoft Visual Basic code should use [Rect.IsEmpty](/dotnet/api/windows.foundation.rect.isempty?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @remarks
     * Do not use this method to test for zero area; a rectangle with zero area is not necessarily the [Empty](recthelper_empty.md) rectangle. For more information, see the [Empty](recthelper_empty.md) property.
     * @param {RECT} target The [Rect](../windows.foundation/rect.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.getisempty
     */
    static GetIsEmpty(target) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.GetIsEmpty(target)
    }

    /**
     * Gets a "Bottom" value for the specified [Rect](../windows.foundation/rect.md). So long as the Rect is not the [Empty](recthelper_empty.md) Rect, "Bottom" is evaluated as **Y** + **Height**. C# and Microsoft Visual Basic code should use [Rect.Bottom](/dotnet/api/windows.foundation.rect.bottom?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The [Rect](../windows.foundation/rect.md) to evaluate.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.getbottom
     */
    static GetBottom(target) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.GetBottom(target)
    }

    /**
     * Gets a "Left" value for the specified [Rect](../windows.foundation/rect.md). So long as the Rect is not the [Empty](recthelper_empty.md) Rect, "Left" is evaluated as **X**. C# and Microsoft Visual Basic code should use [Rect.Left](/dotnet/api/windows.foundation.rect.left?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The [Rect](../windows.foundation/rect.md) to evaluate.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.getleft
     */
    static GetLeft(target) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.GetLeft(target)
    }

    /**
     * Gets a "Right" value for the specified [Rect](../windows.foundation/rect.md). So long as the Rect is not the [Empty](recthelper_empty.md) Rect, "Right" is evaluated as **X** + **Width**. C# and Microsoft Visual Basic code should use [Rect.Right](/dotnet/api/windows.foundation.rect.right?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The [Rect](../windows.foundation/rect.md) to evaluate.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.getright
     */
    static GetRight(target) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.GetRight(target)
    }

    /**
     * Gets a "Top" value for the specified [Rect](../windows.foundation/rect.md). So long as the Rect is not the [Empty](recthelper_empty.md) Rect, "Top" is evaluated as **Y**. C# and Microsoft Visual Basic code should use [Rect.Top](/dotnet/api/windows.foundation.rect.top?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The [Rect](../windows.foundation/rect.md) to evaluate.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.gettop
     */
    static GetTop(target) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.GetTop(target)
    }

    /**
     * Returns whether a given [Point](../windows.foundation/point.md) is within the bounds of a given [Rect](../windows.foundation/rect.md), for a shared coordinate reference. C# and Microsoft Visual Basic code should use [Rect.Contains](/dotnet/api/windows.foundation.rect.contains?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The [Rect](../windows.foundation/rect.md) to evaluate.
     * @param {POINT} point_ The [Point](../windows.foundation/point.md) to check for containment.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.contains
     */
    static Contains(target, point_) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.Contains(target, point_)
    }

    /**
     * Provides comparison of the values of two [Rect](../windows.foundation/rect.md) values. C# and Microsoft Visual Basic code should use the [Equality](/dotnet/api/windows.foundation.rect.op_equality?view=dotnet-uwp-10.0&preserve-view=true) (=) operator or [Equals](/dotnet/api/windows.foundation.rect.equals?view=dotnet-uwp-10.0&preserve-view=true) method instead.
     * @param {RECT} target The first [Rect](../windows.foundation/rect.md) to compare.
     * @param {RECT} value The second [Rect](../windows.foundation/rect.md) to compare.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.equals
     */
    static Equals(target, value) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.Equals(target, value)
    }

    /**
     * Returns the areas of two specified [Rect](../windows.foundation/rect.md) values that intersect, as a new [Rect](../windows.foundation/rect.md). C# and Microsoft Visual Basic code should use [Rect.Intersect](/dotnet/api/windows.foundation.rect.intersect?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The first [Rect](../windows.foundation/rect.md) to check for intersection.
     * @param {RECT} rect_ The second [Rect](../windows.foundation/rect.md) to check for intersection.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.intersect
     */
    static Intersect(target, rect_) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.Intersect(target, rect_)
    }

    /**
     * Creates a rectangle that is exactly large enough to contain the a specified rectangle and a specified point. C# and Microsoft Visual Basic code should use [Rect.Union(Point)](/dotnet/api/windows.foundation.rect.union?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The rectangle to include.
     * @param {POINT} point_ The point to include.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.union
     */
    static UnionWithPoint(target, point_) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.UnionWithPoint(target, point_)
    }

    /**
     * Creates a rectangle that is exactly large enough to contain the a specified rectangle and a specified point. C# and Microsoft Visual Basic code should use [Rect.Union(Point)](/dotnet/api/windows.foundation.rect.union?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {RECT} target The rectangle to include.
     * @param {RECT} rect_ 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.recthelper.union
     */
    static UnionWithRect(target, rect_) {
        if (!RectHelper.HasProp("__IRectHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RectHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectHelperStatics.IID)
            RectHelper.__IRectHelperStatics := IRectHelperStatics(factoryPtr)
        }

        return RectHelper.__IRectHelperStatics.UnionWithRect(target, rect_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
