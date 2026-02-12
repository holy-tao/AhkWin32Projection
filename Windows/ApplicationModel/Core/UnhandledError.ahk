#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnhandledError.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the error data for a system error as reported by an [UnhandledErrorDetected](icoreapplicationunhandlederror_unhandlederrordetected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.unhandlederror
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class UnhandledError extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnhandledError

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnhandledError.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the error has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.unhandlederror.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IUnhandledError")) {
            if ((queryResult := this.QueryInterface(IUnhandledError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledError := IUnhandledError(outPtr)
        }

        return this.__IUnhandledError.get_Handled()
    }

    /**
     * Wraps the underlying error info in a language specific exception, and throws the error.
     * @remarks
     * In addition to throwing the language-specific wrapped error, calling this method marks the error as handled (sets [Handled](unhandlederror_handled.md) to **true**). However, if an error is returned from a delegate, the handled state is set to **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.unhandlederror.propagate
     */
    Propagate() {
        if (!this.HasProp("__IUnhandledError")) {
            if ((queryResult := this.QueryInterface(IUnhandledError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledError := IUnhandledError(outPtr)
        }

        return this.__IUnhandledError.Propagate()
    }

;@endregion Instance Methods
}
