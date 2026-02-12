#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRepeatBehaviorHelper.ahk
#Include .\IRepeatBehaviorHelperStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides basic utility methods for processing [RepeatBehavior](repeatbehavior.md) values. C# and Microsoft Visual Basic code should use members of [RepeatBehavior](repeatbehavior.md) instead.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class RepeatBehaviorHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRepeatBehaviorHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRepeatBehaviorHelper.IID

    /**
     * Gets a static [RepeatBehavior](repeatbehavior.md) that represents the special "Forever" value. C# and Microsoft Visual Basic code should use [Forever](/dotnet/api/windows.ui.xaml.media.animation.repeatbehavior.forever) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper.forever
     * @type {RepeatBehavior} 
     */
    static Forever {
        get => RepeatBehaviorHelper.get_Forever()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RepeatBehavior} 
     */
    static get_Forever() {
        if (!RepeatBehaviorHelper.HasProp("__IRepeatBehaviorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatBehaviorHelperStatics.IID)
            RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics := IRepeatBehaviorHelperStatics(factoryPtr)
        }

        return RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics.get_Forever()
    }

    /**
     * Creates a new [RepeatBehavior](repeatbehavior.md) based on a repeat count. This corresponds to the *int***x** form when provided as XAML attribute value. C# and Microsoft Visual Basic code should use [RepeatBehavior(Double)](/dotnet/api/windows.ui.xaml.media.animation.repeatbehavior.-ctor?view=dotnet-plat-ext-3.1#Windows_UI_Xaml_Media_Animation_RepeatBehavior__ctor_System_Double_) instead.
     * @param {Float} count The number of times that the target animation should repeat.
     * @returns {RepeatBehavior} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper.fromcount
     */
    static FromCount(count) {
        if (!RepeatBehaviorHelper.HasProp("__IRepeatBehaviorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatBehaviorHelperStatics.IID)
            RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics := IRepeatBehaviorHelperStatics(factoryPtr)
        }

        return RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics.FromCount(count)
    }

    /**
     * Creates a new [RepeatBehavior](repeatbehavior.md) based on a timespan. C# and Microsoft Visual Basic code should use [RepeatBehavior(TimeSpan)](/dotnet/api/windows.ui.xaml.media.animation.repeatbehavior.-ctor?view=dotnet-plat-ext-3.1#Windows_UI_Xaml_Media_Animation_RepeatBehavior__ctor_System_TimeSpan_) instead.
     * @param {TimeSpan} duration_ The time span that declares the desired repeat behavior.
     * @returns {RepeatBehavior} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper.fromduration
     */
    static FromDuration(duration_) {
        if (!RepeatBehaviorHelper.HasProp("__IRepeatBehaviorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatBehaviorHelperStatics.IID)
            RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics := IRepeatBehaviorHelperStatics(factoryPtr)
        }

        return RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics.FromDuration(duration_)
    }

    /**
     * Returns whether a specified [RepeatBehavior](repeatbehavior.md) has a **RepeatBehaviorType** of **Count** and a nonzero **Count** value. C# and Microsoft Visual Basic code should use [HasCount](/dotnet/api/windows.ui.xaml.media.animation.repeatbehavior.hascount) instead.
     * @param {RepeatBehavior} target The [RepeatBehavior](repeatbehavior.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper.gethascount
     */
    static GetHasCount(target) {
        if (!RepeatBehaviorHelper.HasProp("__IRepeatBehaviorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatBehaviorHelperStatics.IID)
            RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics := IRepeatBehaviorHelperStatics(factoryPtr)
        }

        return RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics.GetHasCount(target)
    }

    /**
     * Returns whether a specified [RepeatBehavior](repeatbehavior.md) has a **RepeatBehaviorType** of **Duration** and a nonzero **Duration** value. C# and Microsoft Visual Basic code should use [HasDuration](/dotnet/api/windows.ui.xaml.media.animation.repeatbehavior.hasduration) instead.
     * @param {RepeatBehavior} target The [RepeatBehavior](repeatbehavior.md) to evaluate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper.gethasduration
     */
    static GetHasDuration(target) {
        if (!RepeatBehaviorHelper.HasProp("__IRepeatBehaviorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatBehaviorHelperStatics.IID)
            RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics := IRepeatBehaviorHelperStatics(factoryPtr)
        }

        return RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics.GetHasDuration(target)
    }

    /**
     * Determines whether two [RepeatBehavior](repeatbehavior.md) values have equivalent values. C# and Microsoft Visual Basic code should use the equality operator instead.
     * <!-- Link RepeatBehavior.Equals if we add it.-->
     * @param {RepeatBehavior} target The first [RepeatBehavior](repeatbehavior.md) to compare.
     * @param {RepeatBehavior} value The second [RepeatBehavior](repeatbehavior.md) to compare.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repeatbehaviorhelper.equals
     */
    static Equals(target, value) {
        if (!RepeatBehaviorHelper.HasProp("__IRepeatBehaviorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepeatBehaviorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatBehaviorHelperStatics.IID)
            RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics := IRepeatBehaviorHelperStatics(factoryPtr)
        }

        return RepeatBehaviorHelper.__IRepeatBehaviorHelperStatics.Equals(target, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
