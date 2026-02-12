#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ITappedRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [Tapped](../windows.ui.xaml/uielement_tapped.md) event.
 * @remarks
 * A [Tapped](../windows.ui.xaml/uielement_tapped.md) event is sent whenever a mouse is clicked or a finger or pen taps the object
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.tappedroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class TappedRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITappedRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITappedRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device that initiated the associated input event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.tappedroutedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.tappedroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TappedRoutedEventArgs](tappedroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.TappedRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__ITappedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedRoutedEventArgs := ITappedRoutedEventArgs(outPtr)
        }

        return this.__ITappedRoutedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ITappedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedRoutedEventArgs := ITappedRoutedEventArgs(outPtr)
        }

        return this.__ITappedRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ITappedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedRoutedEventArgs := ITappedRoutedEventArgs(outPtr)
        }

        return this.__ITappedRoutedEventArgs.put_Handled(value)
    }

    /**
     * Returns the x- and y-coordinates of the pointer position, optionally evaluated against a coordinate origin of a supplied [UIElement](../windows.ui.xaml/uielement.md).
     * @param {UIElement} relativeTo Any [UIElement](../windows.ui.xaml/uielement.md)-derived object that is connected to the same object tree. To specify the object relative to the overall coordinate system, use a *relativeTo*  value of **null**.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.tappedroutedeventargs.getposition
     */
    GetPosition(relativeTo) {
        if (!this.HasProp("__ITappedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedRoutedEventArgs := ITappedRoutedEventArgs(outPtr)
        }

        return this.__ITappedRoutedEventArgs.GetPosition(relativeTo)
    }

;@endregion Instance Methods
}
