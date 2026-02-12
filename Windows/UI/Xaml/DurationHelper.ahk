#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDurationHelper.ahk
#Include .\IDurationHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides basic utility methods for processing [Duration](duration.md) values. C# and Microsoft Visual Basic code should use methods of [Duration](duration.md) instead.
 * @remarks
 * [Duration](duration.md) is a Windows Runtime structure that represents a unit of time for an animation behavior. For example, [Timeline.Duration](../windows.ui.xaml.media.animation/timeline_duration.md) uses a [Duration](duration.md) value.
 * 
 * DurationHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use members of [Duration](duration.md) instead, because utility members are available directly on the structure due to .NET Framework runtime support. C++ code can only access the **Timespan** data value on [Duration](duration.md). For C++ developers, approximately the same utility features that a Microsoft Visual Basic developer could use directly on [Duration](duration.md) are available in a static form on the DurationHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DurationHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDurationHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDurationHelper.IID

    /**
     * Returns a generated [Duration](duration.md) value that indicates an "Automatic" [Duration](duration.md). C# and Microsoft Visual Basic code should use [Duration.Automatic](/dotnet/api/windows.ui.xaml.duration.automatic?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.automatic
     * @type {Duration} 
     */
    static Automatic {
        get => DurationHelper.get_Automatic()
    }

    /**
     * Returns a generated [Duration](duration.md) value that indicates a "Forever" [Duration](duration.md). C# and Microsoft Visual Basic code should use [Duration.Forever](/dotnet/api/windows.ui.xaml.duration.forever?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.forever
     * @type {Duration} 
     */
    static Forever {
        get => DurationHelper.get_Forever()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Duration} 
     */
    static get_Automatic() {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.get_Automatic()
    }

    /**
     * 
     * @returns {Duration} 
     */
    static get_Forever() {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.get_Forever()
    }

    /**
     * Compares value equality of two [Duration](duration.md) structures. C# and Microsoft Visual Basic code should use [Duration.Compare](/dotnet/api/windows.ui.xaml.duration.compare?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @remarks
     * [Duration](duration.md)instances with a value of **Automatic**are a special case with the following return values:
     * 
     * + If *duration1* is **Automatic** and *duration2* is not, -1 is returned.
     * + If *duration1* is **Automatic** and *duration2* is also **Automatic**, 0 is returned.
     * + If *duration1* is not **Automatic** and *duration2* is **Automatic**, 1 is returned.
     * @param {Duration} duration1 The first [Duration](duration.md) to compare.
     * @param {Duration} duration2 The second [Duration](duration.md) to compare.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.compare
     */
    static Compare(duration1, duration2) {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.Compare(duration1, duration2)
    }

    /**
     * Creates a new [Duration](duration.md) based on a [TimeSpan](../windows.foundation/timespan.md) value. C# and Microsoft Visual Basic code should use the [Duration(TimeSpan)](/dotnet/api/windows.ui.xaml.duration.-ctor?view=dotnet-uwp-10.0&preserve-view=true) constructor instead.
     * @param {TimeSpan} timeSpan_ The initializing [TimeSpan](../windows.foundation/timespan.md).
     * @returns {Duration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.fromtimespan
     */
    static FromTimeSpan(timeSpan_) {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.FromTimeSpan(timeSpan_)
    }

    /**
     * Returns whether the **TimeSpan** component of a given [Duration](duration.md) holds a non-null value. C# and Microsoft Visual Basic code should use [Duration.HasTimeSpan](/dotnet/api/windows.ui.xaml.duration.hastimespan?view=dotnet-uwp-10.0&preserve-view=true) instead.
     * @remarks
     * If this method returns **false**, then the [Duration](duration.md) is either uninitialized or holds one of the special values of **Automatic** or **Forever**.
     * @param {Duration} target The [Duration](duration.md) value to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.gethastimespan
     */
    static GetHasTimeSpan(target) {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.GetHasTimeSpan(target)
    }

    /**
     * Adds the **TimeSpan** component of two [Duration](duration.md) values. C# and Microsoft Visual Basic code should use the [Addition](/dotnet/api/windows.ui.xaml.duration.op_addition?view=dotnet-uwp-10.0&preserve-view=true) (+) operator or the [Duration.Add](/dotnet/api/windows.ui.xaml.duration.add?view=dotnet-uwp-10.0&preserve-view=true) method instead.
     * @param {Duration} target The value to add to.
     * @param {Duration} duration_ The value to add.
     * @returns {Duration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.add
     */
    static Add(target, duration_) {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.Add(target, duration_)
    }

    /**
     * Determines whether two [Duration](duration.md) values have equivalent values. C# and Microsoft Visual Basic code should use the [Equality](/dotnet/api/windows.ui.xaml.duration.op_equality?view=dotnet-uwp-10.0&preserve-view=true) (=) operator or [Duration.Equals](/dotnet/api/windows.ui.xaml.duration.equals?view=dotnet-uwp-10.0&preserve-view=true) method instead.
     * @param {Duration} target The first [Duration](duration.md) to compare.
     * @param {Duration} value The second [Duration](duration.md) to compare.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.equals
     */
    static Equals(target, value) {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.Equals(target, value)
    }

    /**
     * Subtracts the **TimeSpan** component of one [Duration](duration.md) value from another [Duration](duration.md) value. C# and Microsoft Visual Basic code should use the [Subtraction](/dotnet/api/windows.ui.xaml.duration.op_subtraction?view=dotnet-uwp-10.0&preserve-view=true) (-) operator or the [Duration.Subtract](/dotnet/api/windows.ui.xaml.duration.subtract?view=dotnet-uwp-10.0&preserve-view=true) method instead.
     * @param {Duration} target The value to subtract from.
     * @param {Duration} duration_ The value to subtract.
     * @returns {Duration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.durationhelper.subtract
     */
    static Subtract(target, duration_) {
        if (!DurationHelper.HasProp("__IDurationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DurationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDurationHelperStatics.IID)
            DurationHelper.__IDurationHelperStatics := IDurationHelperStatics(factoryPtr)
        }

        return DurationHelper.__IDurationHelperStatics.Subtract(target, duration_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
