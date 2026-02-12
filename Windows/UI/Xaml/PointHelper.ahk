#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointHelper.ahk
#Include .\IPointHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides helper methods to set [Point](../windows.foundation/point.md) values. C# and Microsoft Visual Basic code should use methods of [Point](../windows.foundation/point.md) instead.
 * @remarks
 * [Point](../windows.foundation/point.md) is a Windows Runtime structure that represents an **X**,**Y** position in a coordinate system. A [Point](../windows.foundation/point.md) is used as a value in many different Windows Runtime APIs.
 * 
 * PointHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of [Point](../windows.foundation/point.md) instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the **X** and **Y** data values on [Point](../windows.foundation/point.md). For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on [Point](../windows.foundation/point.md) are available in a static form on the PointHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.pointhelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class PointHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [Point](../windows.foundation/point.md) value using x- and y-coordinate values in pixels. C# and Microsoft Visual Basic code should use the [Point(Double,Double)](/dotnet/api/windows.foundation.point.-ctor?view=dotnet-uwp-10.0&preserve-view=true) constructor instead.
     * @param {Float} x The pixel value to set for **X**.
     * @param {Float} y The pixel value to set for **Y**.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.pointhelper.fromcoordinates
     */
    static FromCoordinates(x, y) {
        if (!PointHelper.HasProp("__IPointHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PointHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointHelperStatics.IID)
            PointHelper.__IPointHelperStatics := IPointHelperStatics(factoryPtr)
        }

        return PointHelper.__IPointHelperStatics.FromCoordinates(x, y)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
