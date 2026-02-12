#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGridLengthHelper.ahk
#Include .\IGridLengthHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides helper methods to evaluate or set [GridLength](gridlength.md) values. C# and Microsoft Visual Basic code should use methods of [GridLength](gridlength.md) instead.
 * @remarks
 * [GridLength](gridlength.md) is a Windows Runtime structure that represents a factor for available-space measurements in rows or columns of a [Grid](../windows.ui.xaml.controls/grid.md).
 * 
 * GridLengthHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of GridLength instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the **Value** data value on GridLength. For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on GridLength are available in a static form on the GridLengthHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class GridLengthHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridLengthHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridLengthHelper.IID

    /**
     * Gets a static [GridLength](gridlength.md) value that corresponds to the special "Auto" value. C# and Microsoft Visual Basic code should use [GridLength.Auto](/dotnet/api/windows.ui.xaml.gridlength.auto?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.auto
     * @type {GridLength} 
     */
    static Auto {
        get => GridLengthHelper.get_Auto()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GridLength} 
     */
    static get_Auto() {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.get_Auto()
    }

    /**
     * Creates a new [GridLength](gridlength.md) value based on a fixed number of pixels. C# and Microsoft Visual Basic code should use the [GridLength(Double)](/dotnet/api/windows.ui.xaml.gridlength.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_GridLength__ctor_System_Double_) constructor instead.
     * @param {Float} pixels The pixel height or width to specify.
     * @returns {GridLength} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.frompixels
     */
    static FromPixels(pixels) {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.FromPixels(pixels)
    }

    /**
     * Creates a new [GridLength](gridlength.md) value based on a possible number of pixels, and a [GridUnitType](gridunittype.md). C# and Microsoft Visual Basic code should use the [ GridLength(Double,GridUnitType)](/dotnet/api/windows.ui.xaml.gridlength.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_GridLength__ctor_System_Double_Windows_UI_Xaml_GridUnitType_) constructor instead.
     * @param {Float} value A numeric value. This might be a pixel height or width to specify, if *type* is specified as **Pixel**, or a factor, if *type* is specified as **Star**. This value is ignored if *type* is specified as **Auto**.
     * @param {Integer} type A value of the enumeration that specifies which unit type the [GridLength](gridlength.md) represents.
     * @returns {GridLength} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.fromvalueandtype
     */
    static FromValueAndType(value, type) {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.FromValueAndType(value, type)
    }

    /**
     * Returns whether the evaluated [GridLength](gridlength.md) is the special "Absolute" value. C# and Microsoft Visual Basic code should use [GridLength.IsAbsolute](/dotnet/api/windows.ui.xaml.gridlength.isabsolute?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {GridLength} target The [GridLength](gridlength.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.getisabsolute
     */
    static GetIsAbsolute(target) {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.GetIsAbsolute(target)
    }

    /**
     * Returns whether the evaluated [GridLength](gridlength.md) is the special "Auto" value. C# and Microsoft Visual Basic code should use [GridLength.IsAuto](/dotnet/api/windows.ui.xaml.gridlength.auto?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {GridLength} target The [GridLength](gridlength.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.getisauto
     */
    static GetIsAuto(target) {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.GetIsAuto(target)
    }

    /**
     * Returns whether the evaluated [GridLength](gridlength.md) is the special "*" (star sizing) value. C# and Microsoft Visual Basic code should use [GridLength.IsStar](/dotnet/api/windows.ui.xaml.gridlength.isstar?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @param {GridLength} target The [GridLength](gridlength.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.getisstar
     */
    static GetIsStar(target) {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.GetIsStar(target)
    }

    /**
     * Provides comparison of the values of two [GridLength](gridlength.md) values. C# and Microsoft Visual Basic code should use the [Equality](/dotnet/api/windows.ui.xaml.gridlength.op_equality?view=dotnet-uwp-10.0&preserve-view=true) operator or [GridLength.Equals](/dotnet/api/windows.ui.xaml.gridlength.equals?view=dotnet-uwp-10.0&preserve-view=true) method instead.
     * @param {GridLength} target The first [GridLength](gridlength.md) to compare.
     * @param {GridLength} value The second [GridLength](gridlength.md) to compare.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlengthhelper.equals
     */
    static Equals(target, value) {
        if (!GridLengthHelper.HasProp("__IGridLengthHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.GridLengthHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridLengthHelperStatics.IID)
            GridLengthHelper.__IGridLengthHelperStatics := IGridLengthHelperStatics(factoryPtr)
        }

        return GridLengthHelper.__IGridLengthHelperStatics.Equals(target, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
