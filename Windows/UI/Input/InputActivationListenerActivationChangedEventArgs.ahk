#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputActivationListenerActivationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [InputActivationChanged](inputactivationlistener_inputactivationchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inputactivationlisteneractivationchangedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class InputActivationListenerActivationChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputActivationListenerActivationChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputActivationListenerActivationChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the activation state of a window, view, or other visual element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inputactivationlisteneractivationchangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IInputActivationListenerActivationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInputActivationListenerActivationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputActivationListenerActivationChangedEventArgs := IInputActivationListenerActivationChangedEventArgs(outPtr)
        }

        return this.__IInputActivationListenerActivationChangedEventArgs.get_State()
    }

;@endregion Instance Methods
}
