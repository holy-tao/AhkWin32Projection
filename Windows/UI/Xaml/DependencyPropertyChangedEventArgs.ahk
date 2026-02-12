#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDependencyPropertyChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [PropertyChangedCallback](propertychangedcallback.md) implementation that is invoked when a dependency property changes its value. Also provides event data for the [Control.IsEnabledChanged](../windows.ui.xaml.controls/control_isenabledchanged.md) event and any other event that uses the [DependencyPropertyChangedEventHandler](dependencypropertychangedeventhandler.md) delegate.
 * @remarks
 * DependencyPropertyChangedEventArgs provides data for two different situations that involve changes to dependency property values:
 * + Situational callback information as used by a [PropertyChangedCallback](propertychangedcallback.md) for a custom dependency property. This is the more common case.
 * + Event data for an event based on [DependencyPropertyChangedEventHandler](dependencypropertychangedeventhandler.md). This is less common because the only Windows Runtime event that uses this delegate is the [Control.IsEnabledChanged](../windows.ui.xaml.controls/control_isenabledchanged.md) event. For more info on how to use the DependencyPropertyChangedEventArgs event data in this case, see [DependencyPropertyChangedEventHandler](dependencypropertychangedeventhandler.md) or [Control.IsEnabledChanged](../windows.ui.xaml.controls/control_isenabledchanged.md).
 * 
 * 
 * A [PropertyChangedCallback](propertychangedcallback.md) implementation is an optional part of the property metadata that you provide when you register a dependency property. The callback is invoked by the dependency property system internally. For more info on dependency properties in general, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties) and [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * 
 * Typically you define the method with private or internal access. The method must be static. Because the method is static, the [DependencyObject](dependencyobject.md) parameter (*d*) of the [PropertyChangedCallback](propertychangedcallback.md) delegate is important. That's what identifies the specific dependency object instance where the property is changing. For many operations, such as correcting or coercing a value, or changing another calculated property value in response on the same object, you'll reference this [DependencyObject](dependencyobject.md). You'll typically want to cast it to the owner type of the property that changes. The owner type is the type referenced by name in the [DependencyProperty.Register](dependencyproperty_register_1826645607.md) call; the metadata where your [PropertyChangedCallback](propertychangedcallback.md) is assigned to property metadata is part of that same call.
 * 
 * Be aware of the possibility for recursion. If you change the value of a dependency property that the [PropertyChangedCallback](propertychangedcallback.md) is invoked for, it will be invoked again. For example, if you created a callback for a **Double** property where the callback always divided the value by 2, that callback would be called recursively and your app would be in an infinite loop.
 * 
 * It's legal to have two or more different dependency properties define callbacks to change each other, but again be careful to not create an unintentional circular dependency that doesn't enable the values to stabilize.
 * 
 * A [PropertyChangedCallback](propertychangedcallback.md) is only invoked if [OldValue](dependencypropertychangedeventargs_oldvalue.md) and [NewValue](dependencypropertychangedeventargs_newvalue.md) in the event data is different.
 * 
 * [OldValue](dependencypropertychangedeventargs_oldvalue.md) and [NewValue](dependencypropertychangedeventargs_newvalue.md) come untyped, so any comparison you perform probably needs a cast. Many dependency property values are using a value type, which means you'll be relying on the operators or other API of the value type to make the comparisons. That functionality is usually available on the structure that represents a value, as a utility API. For example, the language-specific utility API on a [Thickness](thickness.md) value enables you to compare [Thickness](thickness.md) values.
 * 
 * > [!NOTE]
 * > If you are programming using C++, a few of the Windows Runtime structures don't support nondata members, so don't support operators or other utility. For these, there is a companion **Helper** class that provides comparison API that C++ code can use. For example, use the [ColorHelper](../windows.ui/colorhelper.md) class to compare [Color](../windows.ui/color.md) values.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencypropertychangedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DependencyPropertyChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDependencyPropertyChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDependencyPropertyChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the dependency property where the value change occurred.
     * @remarks
     * In many cases the dependency property being changed is known implicitly, because you're checking the [DependencyPropertyChangedEventArgs](dependencypropertychangedeventargs.md) data in a callback that's dedicated for use only by one defined dependency property. The Property property makes it possible to share a [PropertyChangedCallback](propertychangedcallback.md) as a common callback for more than one [PropertyMetadata](propertymetadata.md) instance and more than one dependency property. For example, you might have handler logic that first checks Property and then branches behavior (like knowing how to cast [NewValue](dependencypropertychangedeventargs_newvalue.md)) depending on which property's change invoked the handler in this event case:
     * 
     * ```
     * private static void OnGravityPropertiesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e) {
     *     if (e.Property==Planet.GravityFactorProperty) {
     *         //GravityFactor is a Double, cast e.NewValue to Double, do logic
     *     }
     *     if (e.Property==Planet.IsGravityOnProperty) {
     *         //IsGravityOn is a Boolean, cast e.NewValue to Boolean, do logic
     *     }
     * }
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencypropertychangedeventargs.property
     * @type {DependencyProperty} 
     */
    Property {
        get => this.get_Property()
    }

    /**
     * Gets the value of the dependency property before the reported change.
     * @remarks
     * The OldValue value is often used as the value that the property is set to from within the callback, in case the [NewValue](dependencypropertychangedeventargs_newvalue.md) value is not considered a valid value for your property's logic . For example, if you are using the callback for validation of an input value for a property that the user can set in UI, the previous value is typically a better value to use as the current value rather than resetting the value to a default. The callback is effectively canceling a change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencypropertychangedeventargs.oldvalue
     * @type {IInspectable} 
     */
    OldValue {
        get => this.get_OldValue()
    }

    /**
     * Gets the value of the dependency property after the reported change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencypropertychangedeventargs.newvalue
     * @type {IInspectable} 
     */
    NewValue {
        get => this.get_NewValue()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Property() {
        if (!this.HasProp("__IDependencyPropertyChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDependencyPropertyChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyPropertyChangedEventArgs := IDependencyPropertyChangedEventArgs(outPtr)
        }

        return this.__IDependencyPropertyChangedEventArgs.get_Property()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_OldValue() {
        if (!this.HasProp("__IDependencyPropertyChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDependencyPropertyChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyPropertyChangedEventArgs := IDependencyPropertyChangedEventArgs(outPtr)
        }

        return this.__IDependencyPropertyChangedEventArgs.get_OldValue()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NewValue() {
        if (!this.HasProp("__IDependencyPropertyChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDependencyPropertyChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyPropertyChangedEventArgs := IDependencyPropertyChangedEventArgs(outPtr)
        }

        return this.__IDependencyPropertyChangedEventArgs.get_NewValue()
    }

;@endregion Instance Methods
}
