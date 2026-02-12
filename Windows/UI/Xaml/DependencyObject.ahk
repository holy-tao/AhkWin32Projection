#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDependencyObject.ahk
#Include .\IDependencyObject2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that participates in the dependency property system. DependencyObject is the immediate base class of many important UI-related classes, such as [UIElement](uielement.md), [Geometry](../windows.ui.xaml.media/geometry.md), [FrameworkTemplate](frameworktemplate.md), [Style](style.md), and [ResourceDictionary](resourcedictionary.md). For more info on how DependencyObject supports dependency properties, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * @remarks
 * The DependencyObject class enables dependency property system services on its many derived classes. For more info about the dependency property concept, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * 
 * The dependency property system's primary function is to compute the values of properties, and to provide system notification about values that have changed. Another key class that participates in the dependency property system is [DependencyProperty](dependencyproperty.md). [DependencyProperty](dependencyproperty.md) enables the registration of dependency properties into the property system, whereas DependencyObject as a base class enables objects to use and set the dependency properties.
 * 
 * Here are some notable services and characteristics that DependencyObject provides or supports:
 * 
 * 
 * + Dependency property hosting support for the existing Windows Runtime dependency properties.
 * + Custom dependency property hosting support. You register a dependency property by calling the [Register](dependencyproperty_register_1826645607.md) method and storing the method's return value as a public static property in your DependencyObject class.
 * + Attached property hosting support for the existing Windows Runtime attached properties.
 * + Custom attached property hosting support. You register a dependency property for the attached property usage by calling the [RegisterAttached](dependencyproperty_registerattached_1163670284.md) method and storing the method's return value as a public static property in your class.
 * + **Get** and **Set** utility methods for values of any dependency properties that exist on a DependencyObject. You use these when defining custom dependency property "wrappers" and can also use them from app code as an alternative to using existing "wrapper" properties.
 * + Advanced-scenario utility for examining metadata or property values (for example [GetAnimationBaseValue](dependencyobject_getanimationbasevalue_1072186849.md)).
 * + Enforcement of thread affinity to the main UI thread of the Windows Runtime for all DependencyObject instances.
 * + The [Dispatcher](dependencyobject_dispatcher.md) property for advanced threading scenarios. Getting the [Dispatcher](dependencyobject_dispatcher.md) value provides a reference to a [CoreDispatcher](../windows.ui.core/coredispatcher.md) object. With the [CoreDispatcher](../windows.ui.core/coredispatcher.md), a worker thread can run code that use a DependencyObject but is not on the UI thread, because the [CoreDispatcher](../windows.ui.core/coredispatcher.md) can defer the execution to an asynchronous operation that won't block or otherwise interfere with the UI thread. See "**DependencyObject** and threading" section below.
 * + Basic data binding and styling support, by enabling properties to be set as expressions to be evaluated at some later point in an object's lifetime. These concepts are explained in more detail in [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview). See also [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DependencyObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDependencyObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDependencyObject.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [CoreDispatcher](../windows.ui.core/coredispatcher.md) that this object is associated with. The [CoreDispatcher](../windows.ui.core/coredispatcher.md) represents a facility that can access the [DependencyObject](dependencyobject.md) on the UI thread even if the code is initiated by a non-UI thread.
     * @remarks
     * The Dispatcher property provides the [CoreDispatcher](../windows.ui.core/coredispatcher.md) reference that can be used to marshal calls coming from non-UI threads, using [RunAsync](../windows.ui.core/coredispatcher_runasync_447339746.md) and an awaitable function. For more info on awaitable functions, see [Call asynchronous APIs in C# or Visual Basic](/windows/uwp/threading-async/call-asynchronous-apis-in-csharp-or-visual-basic). See also "**DependencyObject** and threading" section of the [DependencyObject](dependencyobject.md) reference topic.
     * 
     * A [DependencyObject](dependencyobject.md) must be created on a UI thread and has affinity to the UI thread. Because it's an entry point that enables getting across threads, DependencyObject.Dispatcher is the only instance API of [DependencyObject](dependencyobject.md) or any of its subclasses that can be accessed from a non-UI thread without throwing a cross-thread exception. All other [DependencyObject](dependencyobject.md) APIs throw an exception if you attempt to call them from a worker thread or other non-UI thread.
     * 
     * Specifically, the Dispatcher property gets the [CoreDispatcher](../windows.ui.core/coredispatcher.md) that is associated with the app UI thread. Running code through the [RunAsync](../windows.ui.core/coredispatcher_runasync_447339746.md) method of the [CoreDispatcher](../windows.ui.core/coredispatcher.md) is necessary if you intend to query or change the value of any dependency property, even if that object isn't yet associated with the XAML visual tree or the visible UI (the visual root of the app window). 
     * 
     * [Window.Dispatcher](window_dispatcher.md) also references a [CoreDispatcher](../windows.ui.core/coredispatcher.md) that is associated with the UI thread. [Window.Dispatcher](window_dispatcher.md) is basically just a wrapper around [CoreWindow.Dispatcher](../windows.ui.core/corewindow_dispatcher.md) so that a [Window](window.md) class has easy access to it.
     * 
     * 
     * 
     * > [!NOTE]
     * > The connection for a Dispatcher value is not available in a design-time view. This can cause issues if you've created a custom control that uses Dispatcher values and that code is accessed by a design-time environment through code paths that a design view uses, such as constructors and [Loaded](frameworkelement_loaded.md) handlers. If you're writing a custom control and you encounter this issue, consider introducing a guard conditional in your code such as not calling that code when [DesignModeEnabled](../windows.applicationmodel/designmode_designmodeenabled.md) is **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the current effective value of a dependency property from a [DependencyObject](dependencyobject.md).
     * @remarks
     * GetValue obtains the current effective value of a dependency property. The current effective value is determined by using rules of [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * 
     * GetValue is the API you want in most cases if you are using the property system API for obtaining property values. But sometimes you might want to examine other values to see how the dependency property precedence is acting for a given property. If so, you can use one of these API:
     * 
     * 
     * + [GetAnimationBaseValue](dependencyobject_getanimationbasevalue_1072186849.md) to get values that might currently be animated but you want to know the value before the animation ran. Note that animations with [HoldEnd](../windows.ui.xaml.media.animation/fillbehavior.md) behavior might not have this same value. For more info on the [HoldEnd](../windows.ui.xaml.media.animation/fillbehavior.md) concept, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
     * + [ReadLocalValue](dependencyobject_readlocalvalue_275037327.md) to get the local value, which does not have styles or templates or animations applied. Bindings do count as local values, but depending on when you call [ReadLocalValue](dependencyobject_readlocalvalue_275037327.md), the acting binding context might not be available yet, so you won't get the same value as would be applied at run time.
     * For more info on dependency property precedence and other property system utility API, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @param {DependencyProperty} dp The [DependencyProperty](dependencyproperty.md) identifier of the property for which to retrieve the value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.getvalue
     */
    GetValue(dp) {
        if (!this.HasProp("__IDependencyObject")) {
            if ((queryResult := this.QueryInterface(IDependencyObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject := IDependencyObject(outPtr)
        }

        return this.__IDependencyObject.GetValue(dp)
    }

    /**
     * Sets the local value of a dependency property on a [DependencyObject](dependencyobject.md).
     * @remarks
     * If the provided *value* type does not match the type that is declared for the dependency property as it was originally registered, an exception is thrown.
     * 
     * Not all Windows Runtime properties as used by XAML are dependency properties. A [DependencyProperty](dependencyproperty.md) identifier needs to exist and it must be available as a public property of an owning object, typically the object that registered the property.
     * 
     * For app user-code, calling SetValue is not typically necessary. Usually, a Windows Runtime dependency property or a custom dependency property has a conventional property that wraps it, and you can just set the property value through a conventional dotted usage. Cases where you might still use SetValue are:
     * + You are defining a custom dependency property. You will call SetValue as part of defining your own property set accessor for a conventional property usage. For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
     * + You are defining a callback or are in some other scope where you are already being passed a [DependencyProperty](dependencyproperty.md) identifier, and it is possible that more than one dependency property exists that you might want to interact with in that scope. In these cases it is probably simpler to call SetValue, passing the identifier.
     * @param {DependencyProperty} dp The identifier of the dependency property to set.
     * @param {IInspectable} value The new local value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.setvalue
     */
    SetValue(dp, value) {
        if (!this.HasProp("__IDependencyObject")) {
            if ((queryResult := this.QueryInterface(IDependencyObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject := IDependencyObject(outPtr)
        }

        return this.__IDependencyObject.SetValue(dp, value)
    }

    /**
     * Clears the local value of a dependency property.
     * @remarks
     * ClearValue is sometimes used as part of a property-changed callback method. For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
     * @param {DependencyProperty} dp The [DependencyProperty](dependencyproperty.md) identifier of the property for which to clear the value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.clearvalue
     */
    ClearValue(dp) {
        if (!this.HasProp("__IDependencyObject")) {
            if ((queryResult := this.QueryInterface(IDependencyObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject := IDependencyObject(outPtr)
        }

        return this.__IDependencyObject.ClearValue(dp)
    }

    /**
     * Returns the local value of a dependency property, if a local value is set.
     * @remarks
     * The local value is not always the effective value. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @param {DependencyProperty} dp The [DependencyProperty](dependencyproperty.md) identifier of the property for which to retrieve the local value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.readlocalvalue
     */
    ReadLocalValue(dp) {
        if (!this.HasProp("__IDependencyObject")) {
            if ((queryResult := this.QueryInterface(IDependencyObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject := IDependencyObject(outPtr)
        }

        return this.__IDependencyObject.ReadLocalValue(dp)
    }

    /**
     * Returns any base value established for a dependency property, which would apply in cases where an animation is not active.
     * @remarks
     * Use GetAnimationBaseValue to get values that might currently be animated but you want to know the value before the animation ran. Note that animations with **HoldEnd** behavior might not have this same value. For more info on the **HoldEnd** concept, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
     * 
     * Animations that are used for visual states don't have **HoldEnd** behavior but do apply an animated value applied while the state is active. For more info, see [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)).
     * @param {DependencyProperty} dp The identifier for the desired dependency property.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.getanimationbasevalue
     */
    GetAnimationBaseValue(dp) {
        if (!this.HasProp("__IDependencyObject")) {
            if ((queryResult := this.QueryInterface(IDependencyObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject := IDependencyObject(outPtr)
        }

        return this.__IDependencyObject.GetAnimationBaseValue(dp)
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__IDependencyObject")) {
            if ((queryResult := this.QueryInterface(IDependencyObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject := IDependencyObject(outPtr)
        }

        return this.__IDependencyObject.get_Dispatcher()
    }

    /**
     * Registers a notification function for listening to changes to a specific [DependencyProperty](dependencyproperty.md) on this [DependencyObject](dependencyobject.md) instance.
     * @remarks
     * Use RegisterPropertyChangedCallback to get property-changed notification for dependency properties that are already defined as part of the XAML framework. This is useful for properties where were isn't already a corresponding XAML framework event that tracks changes. For example, [FrameworkElement.Tag](frameworkelement_tag.md) is an existing XAML framework dependency property, and your app could track when that property's value changes because some external input (like a data binding) has changed that property's runtime value on a particular object instance that's part of your app UI.
     * 
     * To unregister the callback, call [UnregisterPropertyChangedCallback](dependencyobject_unregisterpropertychangedcallback_129400824.md) and pass in the token returned by this method.
     * 
     * You don't typically use RegisterPropertyChangedCallback for notifications on a custom dependency property, because custom dependency properties already have a way to register a property-changed handler that provides more data in the event args. For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
     * @param {DependencyProperty} dp The dependency property identifier of the property to register for property-changed notification.
     * @param {DependencyPropertyChangedCallback} callback A callback based on the [DependencyPropertyChangedCallback](dependencypropertychangedcallback.md) delegate, which the system invokes when the value of the specified property changes.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.registerpropertychangedcallback
     */
    RegisterPropertyChangedCallback(dp, callback) {
        if (!this.HasProp("__IDependencyObject2")) {
            if ((queryResult := this.QueryInterface(IDependencyObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject2 := IDependencyObject2(outPtr)
        }

        return this.__IDependencyObject2.RegisterPropertyChangedCallback(dp, callback)
    }

    /**
     * Cancels a change notification that was previously registered by calling [RegisterPropertyChangedCallback](dependencyobject_registerpropertychangedcallback_1557279748.md).
     * @param {DependencyProperty} dp The dependency property identifier of the property to unregister for property-changed notification.
     * @param {Integer} token A token that represents the callback (returned by [RegisterPropertyChangedCallback](dependencyobject_registerpropertychangedcallback_1557279748.md)).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyobject.unregisterpropertychangedcallback
     */
    UnregisterPropertyChangedCallback(dp, token) {
        if (!this.HasProp("__IDependencyObject2")) {
            if ((queryResult := this.QueryInterface(IDependencyObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyObject2 := IDependencyObject2(outPtr)
        }

        return this.__IDependencyObject2.UnregisterPropertyChangedCallback(dp, token)
    }

;@endregion Instance Methods
}
