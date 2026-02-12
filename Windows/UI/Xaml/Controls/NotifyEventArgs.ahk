#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotifyEventArgs.ahk
#Include .\INotifyEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ScriptNotify](webview_scriptnotify.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.notifyeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NotifyEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotifyEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotifyEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the method name as passed to the application.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.notifyeventargs.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the page containing the script that raised the [ScriptNotify](webview_scriptnotify.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.notifyeventargs.callinguri
     * @type {Uri} 
     */
    CallingUri {
        get => this.get_CallingUri()
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
    get_Value() {
        if (!this.HasProp("__INotifyEventArgs")) {
            if ((queryResult := this.QueryInterface(INotifyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyEventArgs := INotifyEventArgs(outPtr)
        }

        return this.__INotifyEventArgs.get_Value()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CallingUri() {
        if (!this.HasProp("__INotifyEventArgs2")) {
            if ((queryResult := this.QueryInterface(INotifyEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyEventArgs2 := INotifyEventArgs2(outPtr)
        }

        return this.__INotifyEventArgs2.get_CallingUri()
    }

;@endregion Instance Methods
}
