#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnhandledExceptionEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [UnhandledException](application_unhandledexception.md) event.
 * @remarks
 * For more info on how to write a handler based on the [UnhandledExceptionEventHandler](unhandledexceptioneventhandler.md) delegate, see [Exception handling for    in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10)) and Remarks in [UnhandledException](application_unhandledexception.md).
 * 
 * If you're using Visual C++ component extensions (C++/CX), see [Exceptions (C++/CX)](/cpp/cppcx/exceptions-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.unhandledexceptioneventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class UnhandledExceptionEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnhandledExceptionEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnhandledExceptionEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the **HRESULT** code associated with the unhandled exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.unhandledexceptioneventargs.exception
     * @type {HRESULT} 
     */
    Exception {
        get => this.get_Exception()
    }

    /**
     * Gets the message string as passed by the originating unhandled exception.
     * @remarks
     * The message is coming from info that's propagated by the original system or runtime app error. The message is not guaranteed to be an exact match to the original error message (as seen in native stacks or output windows). For more info on error propagation and exception handling techniques, see [Exception handling for    in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10)) and Remarks in [UnhandledException](application_unhandledexception.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.unhandledexceptioneventargs.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * Gets or sets a value that indicates whether the exception is handled.
     * @remarks
     * Do not routinely set this value to **true**, that is not always safe and may not guarantee that the app wouldn't terminate anyways. For more info, see [Exception handling for    in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10)) and Remarks in [UnhandledException](application_unhandledexception.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.unhandledexceptioneventargs.handled
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
     * @returns {HRESULT} 
     */
    get_Exception() {
        if (!this.HasProp("__IUnhandledExceptionEventArgs")) {
            if ((queryResult := this.QueryInterface(IUnhandledExceptionEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledExceptionEventArgs := IUnhandledExceptionEventArgs(outPtr)
        }

        return this.__IUnhandledExceptionEventArgs.get_Exception()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IUnhandledExceptionEventArgs")) {
            if ((queryResult := this.QueryInterface(IUnhandledExceptionEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledExceptionEventArgs := IUnhandledExceptionEventArgs(outPtr)
        }

        return this.__IUnhandledExceptionEventArgs.get_Message()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IUnhandledExceptionEventArgs")) {
            if ((queryResult := this.QueryInterface(IUnhandledExceptionEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledExceptionEventArgs := IUnhandledExceptionEventArgs(outPtr)
        }

        return this.__IUnhandledExceptionEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IUnhandledExceptionEventArgs")) {
            if ((queryResult := this.QueryInterface(IUnhandledExceptionEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledExceptionEventArgs := IUnhandledExceptionEventArgs(outPtr)
        }

        return this.__IUnhandledExceptionEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
