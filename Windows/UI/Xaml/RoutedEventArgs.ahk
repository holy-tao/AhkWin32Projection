#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRoutedEventArgs.ahk
#Include .\IRoutedEventArgsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains state information and event data associated with a routed event.
 * @remarks
 * RoutedEventArgs is a common event data type used for base element events in UWP app using C++, C#, or Visual Basic. Generally RoutedEventArgs as the event data type indicates that the event with this event data is a *routed event*, although there are some exceptions. For more info on routed events and how to handle them, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
 * 
 * The API that RoutedEventArgs adds to a generalized event data set is [OriginalSource](routedeventargs_originalsource.md). [OriginalSource](routedeventargs_originalsource.md) can be useful for determining the element that first raised the event for hit testing and event routing scenarios, but there are also times where the *sender* from the delegate signature is the more useful source object reference for a handler. For more info, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.routedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class RoutedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRoutedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RoutedEventArgs} 
     */
    static CreateInstance() {
        if (!RoutedEventArgs.HasProp("__IRoutedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.RoutedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRoutedEventArgsFactory.IID)
            RoutedEventArgs.__IRoutedEventArgsFactory := IRoutedEventArgsFactory(factoryPtr)
        }

        return RoutedEventArgs.__IRoutedEventArgsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a reference to the object that raised the event. This is often a template part of a control rather than an element that was declared in your app UI.
     * @remarks
     * When a routed event bubbles up an event route, *sender* is no longer the same object as the event-raising object. Instead, *sender* is the object where the handler that is being invoked is attached.
     * 
     * In some cases, *sender* is not interesting, and you are instead interested in info such as which of the possible child objects the pointer is over when a pointer event fired, or which object in a larger UI held focus when a user pressed a keyboard key. For these cases, you can use the value of the OriginalSource property. At all points on the route, OriginalSource reports the original object that fired the event, instead of the object where the handler is attached. However, for [UIElement](uielement.md) input events, that original object is often an object that is not immediately visible in the page-level UI definition XAML. Instead, that original source object might be a templated part of a control. For example, if the user hovers the pointer over the very edge of a [Button](../windows.ui.xaml.controls/button.md), for most pointer events the OriginalSource is a [Border](../windows.ui.xaml.controls/border.md) template part in the [Template](../windows.ui.xaml.controls/control_template.md), not the [Button](../windows.ui.xaml.controls/button.md) itself. Therefore, you can't always rely on OriginalSource representing an object that you specifically declared in your XAML page-level UI definitions.
     * 
     * > [!TIP]
     * > Input event bubbling is especially useful if you are creating a templated control. Any control that has a template can have a new template applied by its consumer. The consumer that's trying to recreate a working template might unintentionally eliminate some event handling declared in the default template. You can still provide control-level event handling by attaching handlers as part of the [OnApplyTemplate](frameworkelement_onapplytemplate_1955470198.md) override in the class definition. Then you can catch the input events that bubble up to the control's root on instantiation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.routedeventargs.originalsource
     * @type {IInspectable} 
     */
    OriginalSource {
        get => this.get_OriginalSource()
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
    get_OriginalSource() {
        if (!this.HasProp("__IRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRoutedEventArgs := IRoutedEventArgs(outPtr)
        }

        return this.__IRoutedEventArgs.get_OriginalSource()
    }

;@endregion Instance Methods
}
