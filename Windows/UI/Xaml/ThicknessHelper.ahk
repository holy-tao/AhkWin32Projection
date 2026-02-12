#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IThicknessHelper.ahk
#Include .\IThicknessHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides helper methods to evaluate or set [Thickness](thickness.md) values. C# and Microsoft Visual Basic code should use members of [Thickness](thickness.md) instead.
 * @remarks
 * [Thickness](thickness.md) is a Windows Runtime structure that represents a pixel measure applied to the outside (margin) or inside (padding) render dimensions of a rectangular UI element. For example, [Border.BorderThickness](../windows.ui.xaml.controls/border_borderthickness.md) uses a [Thickness](thickness.md) value.
 * 
 * ThicknessHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of [Thickness](thickness.md) instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the data values on [Thickness](thickness.md), for example the **Top** field value. For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on [Thickness](thickness.md) are available in a static form on the ThicknessHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.thicknesshelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ThicknessHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IThicknessHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IThicknessHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [Thickness](thickness.md) value based on element values. C# and Microsoft Visual Basic code should use the [Thickness(Double,Double,Double,Double)](/dotnet/api/windows.ui.xaml.gridlength.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_GridLength__ctor_System_Double_Windows_UI_Xaml_GridUnitType_) constructor instead.
     * @param {Float} left The initial **Left**.
     * @param {Float} top The initial **Top**.
     * @param {Float} right The initial **Right**.
     * @param {Float} bottom The initial **Bottom**.
     * @returns {Thickness} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.thicknesshelper.fromlengths
     */
    static FromLengths(left, top, right, bottom) {
        if (!ThicknessHelper.HasProp("__IThicknessHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ThicknessHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThicknessHelperStatics.IID)
            ThicknessHelper.__IThicknessHelperStatics := IThicknessHelperStatics(factoryPtr)
        }

        return ThicknessHelper.__IThicknessHelperStatics.FromLengths(left, top, right, bottom)
    }

    /**
     * Creates a new [Thickness](thickness.md) value using a uniform value for all the element values. C# and Microsoft Visual Basic code should use the [Thickness(Double)](/dotnet/api/windows.ui.xaml.gridlength.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_GridLength__ctor_System_Double_) constructor instead.
     * @param {Float} uniformLength The uniform value to apply to all four of the [Thickness](thickness.md) element values.
     * @returns {Thickness} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.thicknesshelper.fromuniformlength
     */
    static FromUniformLength(uniformLength) {
        if (!ThicknessHelper.HasProp("__IThicknessHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ThicknessHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThicknessHelperStatics.IID)
            ThicknessHelper.__IThicknessHelperStatics := IThicknessHelperStatics(factoryPtr)
        }

        return ThicknessHelper.__IThicknessHelperStatics.FromUniformLength(uniformLength)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
