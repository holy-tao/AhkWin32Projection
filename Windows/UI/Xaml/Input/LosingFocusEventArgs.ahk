#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ILosingFocusEventArgs.ahk
#Include .\ILosingFocusEventArgs2.ahk
#Include .\ILosingFocusEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [FocusManager.LosingFocus](focusmanager_losingfocus.md) and [UIElement.LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) events.
 * @remarks
 * Only a single UI element at a time can have focus.
 * 
 * A control can lose focus when another control gets focus, the application view changes, the user switches applications, or the user interacts with the system such that the application is no longer in the foreground.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class LosingFocusEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILosingFocusEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILosingFocusEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the last focused object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.oldfocusedelement
     * @type {DependencyObject} 
     */
    OldFocusedElement {
        get => this.get_OldFocusedElement()
    }

    /**
     * Gets the most recent focused object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.newfocusedelement
     * @type {DependencyObject} 
     */
    NewFocusedElement {
        get => this.get_NewFocusedElement()
        set => this.put_NewFocusedElement(value)
    }

    /**
     * Gets the input mode through which an element obtained focus.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.focusstate
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * Gets the direction that focus moved from element to element within the app UI.
     * @remarks
     * [FocusNavigationDirection.Previous](focusnavigationdirection.md) and [FocusNavigationDirection.Next](focusnavigationdirection.md) cannot be used with [FindNextElementOptions](findnextelementoptions.md). Only [FocusNavigationDirection.Up](focusnavigationdirection.md), [FocusNavigationDirection.Down](focusnavigationdirection.md), [FocusNavigationDirection.Left](focusnavigationdirection.md), or [FocusNavigationDirection.Right](focusnavigationdirection.md) are valid.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the input device type from which input events are received.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.inputdevice
     * @type {Integer} 
     */
    InputDevice {
        get => this.get_InputDevice()
    }

    /**
     * Gets or sets whether focus navigation should be canceled.
     * @remarks
     * Apps that target the Windows 10, version 1803 or later should use [TryCancel](losingfocuseventargs_trycancel_50138317.md) instead of this property. If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the unique ID generated when a focus movement event is initiated.
     * @remarks
     * Focus moves can result in a number of direct and indirect actions.
     * 
     * For example, there is the standard sequence of events that starts with [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) and moves through [LostFocus](../windows.ui.xaml/uielement_lostfocus.md), [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md), to [GotFocus](../windows.ui.xaml/uielement_gotfocus.md). These focus events typically get routed through multiple elements in the element tree (including the [FocusManager](focusmanager.md)).
     * 
     * In some cases, the focus event can also get re-routed. For example, if the target element is not valid for some reason, you might call [TrySetNewFocusedElement](losingfocuseventargs_trysetnewfocusedelement_804964491.md) from the [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) event to re-target focus to another element.
     * 
     * In other cases, you might need to cancel a focus change from one of your focus event handlers.
     * 
     * In addition, because focus events are raised asynchronously, focus might change again before a previous focus event has finished executing.
     * 
     * Each time a focus event is initiated, a unique CorrelationId is generated to help you track a focus event throughout these focus actions.
     * 
     * A new CorrelationId is generated when:
     * 
     * - The user moves focus.
     * - The app moves focus using methods such as [Control.Focus](../windows.ui.xaml.controls/control_focus_195503898.md) or [FocusManager.TryFocusAsync](focusmanager_tryfocusasync_1779533284.md).
     * - The app gets/loses focus due to window activation (see [CoreWindow.Activated](../windows.ui.core/corewindow_activated.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.correlationid
     * @type {Guid} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_OldFocusedElement() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_OldFocusedElement()
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_NewFocusedElement() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_NewFocusedElement()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_NewFocusedElement(value) {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.put_NewFocusedElement(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusState() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_FocusState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_Direction()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputDevice() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_InputDevice()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__ILosingFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs := ILosingFocusEventArgs(outPtr)
        }

        return this.__ILosingFocusEventArgs.put_Cancel(value)
    }

    /**
     * Attempts to cancel the ongoing focus action.
     * @remarks
     * Apps that target the Windows 10, version 1803 or later should use this property instead of [Cancel](losingfocuseventargs_cancel.md). If your app also supports previous versions, see [Version adaptive apps: Use new APIs while maintaining compatibility with previous versions](/windows/uwp/debug-test-perf/version-adaptive-apps) for more info.
     * 
     * The [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) routed event is raised on an element after it receives focus, while the [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) routed event is raised on an element after it loses focus. 
     * 
     * The [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) and [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) routed events occur before the focus change takes place, which enables your application to modify or cancel the focus change behavior.   
     * 
     * [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) and [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) are raised synchronously, while [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) and [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) are raised asynchronously. For example, if your app calls the [Focus](/uwp/api/Windows.UI.Xaml.Controls.Control#controls-and-focus) method of a control, GettingFocus is raised during the call, but GotFocus is raised after the call completes. 
     * 
     * If focus is moved while these events are still bubbling, an exception is thrown.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.trycancel
     */
    TryCancel() {
        if (!this.HasProp("__ILosingFocusEventArgs2")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs2 := ILosingFocusEventArgs2(outPtr)
        }

        return this.__ILosingFocusEventArgs2.TryCancel()
    }

    /**
     * Attempts to redirect focus from the targeted element to the specified element.
     * @remarks
     * The [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) routed event is raised on an element after it receives focus, while the [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) routed event is raised on an element after it loses focus. 
     * 
     * The [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) and [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) routed events occur before the focus change takes place, which enables your application to modify or cancel the focus change behavior.   
     * 
     * [GettingFocus](../windows.ui.xaml/uielement_gettingfocus.md) and [LosingFocus](../windows.ui.xaml/uielement_losingfocus.md) are raised synchronously, while [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) and [LostFocus](../windows.ui.xaml/uielement_lostfocus.md) are raised asynchronously. For example, if your app calls the [Focus](/uwp/api/Windows.UI.Xaml.Controls.Control#controls-and-focus) method of a control, GettingFocus is raised during the call, but [GotFocus](../windows.ui.xaml/uielement_gotfocus.md) is raised after the call completes. 
     * 
     * If focus is moved while these events are still bubbling, an exception is thrown.
     * @param {DependencyObject} element The object on which to set focus.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.losingfocuseventargs.trysetnewfocusedelement
     */
    TrySetNewFocusedElement(element) {
        if (!this.HasProp("__ILosingFocusEventArgs2")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs2 := ILosingFocusEventArgs2(outPtr)
        }

        return this.__ILosingFocusEventArgs2.TrySetNewFocusedElement(element)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__ILosingFocusEventArgs3")) {
            if ((queryResult := this.QueryInterface(ILosingFocusEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILosingFocusEventArgs3 := ILosingFocusEventArgs3(outPtr)
        }

        return this.__ILosingFocusEventArgs3.get_CorrelationId()
    }

;@endregion Instance Methods
}
