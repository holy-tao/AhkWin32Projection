#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICornerRadiusHelper.ahk
#Include .\ICornerRadiusHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides basic utility methods for processing [CornerRadius](cornerradius.md) values. C# and Microsoft Visual Basic code should use methods of [CornerRadius](cornerradius.md) instead.
 * @remarks
 * [CornerRadius](cornerradius.md) is a Windows Runtime structure that represents a radius applied to one or all corners of a rectangular UI element. For example, [Border.CornerRadius](../windows.ui.xaml.controls/border_cornerradius.md) uses a [CornerRadius](cornerradius.md) value.
 * 
 * CornerRadiusHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of [CornerRadius](cornerradius.md) instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the data values on [CornerRadius](cornerradius.md), for example the **TopLeft** field value. For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on [CornerRadius](cornerradius.md) are available in a static form on the CornerRadiusHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.cornerradiushelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class CornerRadiusHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICornerRadiusHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICornerRadiusHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Generates a [CornerRadius](cornerradius.md) value from element values. C# and Microsoft Visual Basic code should use the [CornerRadius(Double,Double,Double,Double)](/dotnet/api/windows.ui.xaml.cornerradius.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_CornerRadius__ctor_System_Double_System_Double_System_Double_System_Double_) constructor instead.
     * @param {Float} topLeft The initial **TopLeft** value.
     * @param {Float} topRight The initial **TopRight** value.
     * @param {Float} bottomRight The initial **BottomRight** value.
     * @param {Float} bottomLeft The initial **BottomLeft** value.
     * @returns {CornerRadius} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.cornerradiushelper.fromradii
     */
    static FromRadii(topLeft, topRight, bottomRight, bottomLeft) {
        if (!CornerRadiusHelper.HasProp("__ICornerRadiusHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.CornerRadiusHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICornerRadiusHelperStatics.IID)
            CornerRadiusHelper.__ICornerRadiusHelperStatics := ICornerRadiusHelperStatics(factoryPtr)
        }

        return CornerRadiusHelper.__ICornerRadiusHelperStatics.FromRadii(topLeft, topRight, bottomRight, bottomLeft)
    }

    /**
     * Creates a new [CornerRadius](cornerradius.md) value that has a uniform radius value for each of its elements. C# and Microsoft Visual Basic code should use the [CornerRadius(Double)](/dotnet/api/windows.ui.xaml.cornerradius.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_CornerRadius__ctor_System_Double_) constructor instead.
     * @param {Float} uniformRadius The uniform radius value to set. See [CornerRadius](cornerradius.md).
     * @returns {CornerRadius} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.cornerradiushelper.fromuniformradius
     */
    static FromUniformRadius(uniformRadius) {
        if (!CornerRadiusHelper.HasProp("__ICornerRadiusHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.CornerRadiusHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICornerRadiusHelperStatics.IID)
            CornerRadiusHelper.__ICornerRadiusHelperStatics := ICornerRadiusHelperStatics(factoryPtr)
        }

        return CornerRadiusHelper.__ICornerRadiusHelperStatics.FromUniformRadius(uniformRadius)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
