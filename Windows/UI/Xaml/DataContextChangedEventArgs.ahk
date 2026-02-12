#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataContextChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [DataContextChanged](frameworkelement_datacontextchanged.md) event.
 * @remarks
 * The [FrameworkElement.DataContext](frameworkelement_datacontext.md) property has a built-in behavior whereby its value inherits to all [FrameworkElement](frameworkelement.md) child elements of a [FrameworkElement](frameworkelement.md) where a [DataContext](frameworkelement_datacontext.md) value is set. This behavior enables a set of related elements to use the same context to bind to different source properties, which is particularly useful for item templates, data templates, and other data binding scenarios. Because [DataContext](frameworkelement_datacontext.md) inherits, there's potential for each [FrameworkElement](frameworkelement.md) that uses the inherited value to fire another [DataContextChanged](frameworkelement_datacontextchanged.md) event. That event is sourced from the inheriting element, not the parent element, once the element detects that its inherited [DataContext](frameworkelement_datacontext.md) value has changed. If you don't want this behavior, you should handle the [DataContextChanged](frameworkelement_datacontextchanged.md) event on the parent source, where the event will occur first. As part of your handler logic, set the value of the [Handled](datacontextchangedeventargs_handled.md) property in the DataContextChangedEventArgs event data to **true**. That action will prevent the event from routing to child elements.
 * 
 * > [!NOTE]
 * > [DataContextChanged](frameworkelement_datacontextchanged.md) has routing behavior but isn't a true routed event (it does not have a [RoutedEvent](routedevent.md) identifier). Also, it routes from parent to child whereas the true routed events route from child to parent. If you're familiar with Windows Presentation Foundation (WPF), [DataContextChanged](frameworkelement_datacontextchanged.md) might be considered a tunneling routing event by the Windows Presentation Foundation (WPF) event routing definitions.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datacontextchangedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DataContextChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataContextChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataContextChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new [DataContext](frameworkelement_datacontext.md) value for the element where the [DataContextChanged](frameworkelement_datacontextchanged.md) event fired.
     * @remarks
     * The NewValue value is only guaranteed to have a correct value during the invocation of your handler. You can't save the [DataContextChangedEventArgs](datacontextchangedeventargs.md) object and expect to be able to use the NewValue property on it in a meaningful way outside of the scope of a handler.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datacontextchangedeventargs.newvalue
     * @type {IInspectable} 
     */
    NewValue {
        get => this.get_NewValue()
    }

    /**
     * Gets or sets a value that influences whether another [DataContextChanged](datacontextchangedeventargs.md) event should be fired from child elements that inherit the [DataContext](frameworkelement_datacontext.md) value and detect that the value has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.datacontextchangedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NewValue() {
        if (!this.HasProp("__IDataContextChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDataContextChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataContextChangedEventArgs := IDataContextChangedEventArgs(outPtr)
        }

        return this.__IDataContextChangedEventArgs.get_NewValue()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IDataContextChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDataContextChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataContextChangedEventArgs := IDataContextChangedEventArgs(outPtr)
        }

        return this.__IDataContextChangedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IDataContextChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDataContextChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataContextChangedEventArgs := IDataContextChangedEventArgs(outPtr)
        }

        return this.__IDataContextChangedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
