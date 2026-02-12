#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusManagerLostFocusEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [LostFocus](focusmanager_lostfocus.md) event.
 * @remarks
 * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](focusmanager.md) events whenever possible.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanagerlostfocuseventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class FocusManagerLostFocusEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusManagerLostFocusEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusManagerLostFocusEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the last focused element.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](focusmanager.md) events whenever possible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanagerlostfocuseventargs.oldfocusedelement
     * @type {DependencyObject} 
     */
    OldFocusedElement {
        get => this.get_OldFocusedElement()
    }

    /**
     * Gets the unique ID generated when a focus movement event is initiated.
     * @remarks
     * We recommend using the [UIElement](../windows.ui.xaml/uielement.md) focus routed events instead of [FocusManager](focusmanager.md) events whenever possible.
     * 
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusmanagerlostfocuseventargs.correlationid
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
        if (!this.HasProp("__IFocusManagerLostFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(IFocusManagerLostFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusManagerLostFocusEventArgs := IFocusManagerLostFocusEventArgs(outPtr)
        }

        return this.__IFocusManagerLostFocusEventArgs.get_OldFocusedElement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__IFocusManagerLostFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(IFocusManagerLostFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusManagerLostFocusEventArgs := IFocusManagerLostFocusEventArgs(outPtr)
        }

        return this.__IFocusManagerLostFocusEventArgs.get_CorrelationId()
    }

;@endregion Instance Methods
}
