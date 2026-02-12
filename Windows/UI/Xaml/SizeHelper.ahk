#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISizeHelper.ahk
#Include .\ISizeHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides helper methods to evaluate or set [Size](../windows.foundation/size.md) values. C# and Microsoft Visual Basic code should use members of [Size](../windows.foundation/size.md) instead.
 * @remarks
 * [Size](../windows.foundation/size.md) is a Windows Runtime structure that represents a rectangle's dimensions without an origin.
 * 
 * SizeHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of [Size](../windows.foundation/size.md) instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the data values on [Size](../windows.foundation/size.md), for example **Height**. For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on [Size](../windows.foundation/size.md) are available in a static form on the SizeHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizehelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class SizeHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISizeHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISizeHelper.IID

    /**
     * Gets a static [Size](../windows.foundation/size.md) value where the [Size](../windows.foundation/size.md) has no height or width. C# and Microsoft Visual Basic code should use [Size.Empty](/dotnet/api/windows.foundation.size.empty?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizehelper.empty
     * @type {SIZE} 
     */
    static Empty {
        get => SizeHelper.get_Empty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SIZE} 
     */
    static get_Empty() {
        if (!SizeHelper.HasProp("__ISizeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.SizeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISizeHelperStatics.IID)
            SizeHelper.__ISizeHelperStatics := ISizeHelperStatics(factoryPtr)
        }

        return SizeHelper.__ISizeHelperStatics.get_Empty()
    }

    /**
     * Creates a new [Size](../windows.foundation/size.md) based on width and height element values. C# and Microsoft Visual Basic code should use the [Size(Double,Double)](/dotnet/api/windows.foundation.size.-ctor?view=dotnet-uwp-10.0&preserve-view=true) constructor instead.
     * @param {Float} width The initial **Width**.
     * @param {Float} height The initial **Height**.
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizehelper.fromdimensions
     */
    static FromDimensions(width, height) {
        if (!SizeHelper.HasProp("__ISizeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.SizeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISizeHelperStatics.IID)
            SizeHelper.__ISizeHelperStatics := ISizeHelperStatics(factoryPtr)
        }

        return SizeHelper.__ISizeHelperStatics.FromDimensions(width, height)
    }

    /**
     * Returns whether a specified [Size](../windows.foundation/size.md) is equivalent to an [Empty](sizehelper_empty.md) [Size](../windows.foundation/size.md). C# and Microsoft Visual Basic code should use [Size.IsEmpty](/dotnet/api/windows.foundation.size.isempty?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @remarks
     * Do not use this method to test for zero area; a size with zero area is not necessarily the [Empty](sizehelper_empty.md) size. For more information, see the [Empty](sizehelper_empty.md) property.
     * @param {SIZE} target The [Size](../windows.foundation/size.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizehelper.getisempty
     */
    static GetIsEmpty(target) {
        if (!SizeHelper.HasProp("__ISizeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.SizeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISizeHelperStatics.IID)
            SizeHelper.__ISizeHelperStatics := ISizeHelperStatics(factoryPtr)
        }

        return SizeHelper.__ISizeHelperStatics.GetIsEmpty(target)
    }

    /**
     * Provides comparison of the values of two [Size](../windows.foundation/size.md) values. C# and Microsoft Visual Basic code should use the [Equality](/dotnet/api/windows.foundation.size.op_equality?view=dotnet-uwp-10.0&preserve-view=true) (=) operator or [Equals](/dotnet/api/windows.foundation.size.equals?view=dotnet-uwp-10.0&preserve-view=true) method instead.
     * @param {SIZE} target The first [Size](../windows.foundation/size.md) to compare.
     * @param {SIZE} value The second [Size](../windows.foundation/size.md) to compare.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizehelper.equals
     */
    static Equals(target, value) {
        if (!SizeHelper.HasProp("__ISizeHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.SizeHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISizeHelperStatics.IID)
            SizeHelper.__ISizeHelperStatics := ISizeHelperStatics(factoryPtr)
        }

        return SizeHelper.__ISizeHelperStatics.Equals(target, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
