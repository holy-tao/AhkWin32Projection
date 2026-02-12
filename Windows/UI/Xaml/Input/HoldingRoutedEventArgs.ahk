#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IHoldingRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [Holding](../windows.ui.xaml/uielement_holding.md) event.
 * @remarks
 * A [Holding](../windows.ui.input/gesturerecognizer_holding.md) event is sent whenever a finger, pen, or similar pointing device is pressed and held on an object.
 * 
 * Once a short time threshold has elapsed, the event is sent with a [HoldingState](../windows.ui.input/holdingstate.md) of type [Started](../windows.ui.input/holdingstate.md).
 * 
 * When the device has been lifted (after a [Holding](../windows.ui.input/gesturerecognizer_holding.md) event), another [Holding](../windows.ui.input/gesturerecognizer_holding.md) event is sent with a [HoldingState](../windows.ui.input/holdingstate.md) of type [Completed](../windows.ui.input/holdingstate.md).
 * 
 * If the user cancels the hold after it has been started, but before it completes, a [Holding](../windows.ui.input/gesturerecognizer_holding.md) event is sent with a [HoldingState](../windows.ui.input/holdingstate.md) of type [Canceled](../windows.ui.input/holdingstate.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.holdingroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class HoldingRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHoldingRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHoldingRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device that initiated the associated input event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.holdingroutedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the underlying [HoldingState](../windows.ui.input/holdingstate.md) for the interaction
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.holdingroutedeventargs.holdingstate
     * @type {Integer} 
     */
    HoldingState {
        get => this.get_HoldingState()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.holdingroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HoldingRoutedEventArgs](holdingroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.HoldingRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IHoldingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingRoutedEventArgs := IHoldingRoutedEventArgs(outPtr)
        }

        return this.__IHoldingRoutedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldingState() {
        if (!this.HasProp("__IHoldingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingRoutedEventArgs := IHoldingRoutedEventArgs(outPtr)
        }

        return this.__IHoldingRoutedEventArgs.get_HoldingState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IHoldingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingRoutedEventArgs := IHoldingRoutedEventArgs(outPtr)
        }

        return this.__IHoldingRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IHoldingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingRoutedEventArgs := IHoldingRoutedEventArgs(outPtr)
        }

        return this.__IHoldingRoutedEventArgs.put_Handled(value)
    }

    /**
     * Returns the x- and y-coordinates of the pointer position, optionally evaluated against a coordinate origin of a supplied [UIElement](../windows.ui.xaml/uielement.md).
     * @param {UIElement} relativeTo Any [UIElement](../windows.ui.xaml/uielement.md)-derived object that is connected to the same object tree. To specify the object relative to the overall coordinate system, use a *relativeTo*  value of **null**.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.holdingroutedeventargs.getposition
     */
    GetPosition(relativeTo) {
        if (!this.HasProp("__IHoldingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingRoutedEventArgs := IHoldingRoutedEventArgs(outPtr)
        }

        return this.__IHoldingRoutedEventArgs.GetPosition(relativeTo)
    }

;@endregion Instance Methods
}
