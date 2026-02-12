#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBindingFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [DebugSettings.BindingFailed](debugsettings_bindingfailed.md) event.
 * @remarks
 * BindingFailedEventArgs is used for debugging bindings, using a technique that you shouldn't include in production code. Wire the event handler using [DebugSettings](application_debugsettings.md), and use this data class as the result in your handler. You'll mainly be interested in the [Message](bindingfailedeventargs_message.md) value, which you could log or send to **Debug** output.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bindingfailedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class BindingFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBindingFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBindingFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the explanation of the binding failure.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bindingfailedeventargs.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IBindingFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBindingFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBindingFailedEventArgs := IBindingFailedEventArgs(outPtr)
        }

        return this.__IBindingFailedEventArgs.get_Message()
    }

;@endregion Instance Methods
}
