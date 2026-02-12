#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnhandledErrorDetectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides [UnhandledError](unhandlederror.md) event data for [UnhandledErrorDetected](icoreapplicationunhandlederror_unhandlederrordetected.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.unhandlederrordetectedeventargs
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class UnhandledErrorDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnhandledErrorDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnhandledErrorDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error info object that can be used to handle the event or propagate the error through a language-specific error.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.unhandlederrordetectedeventargs.unhandlederror
     * @type {UnhandledError} 
     */
    UnhandledError {
        get => this.get_UnhandledError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UnhandledError} 
     */
    get_UnhandledError() {
        if (!this.HasProp("__IUnhandledErrorDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUnhandledErrorDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnhandledErrorDetectedEventArgs := IUnhandledErrorDetectedEventArgs(outPtr)
        }

        return this.__IUnhandledErrorDetectedEventArgs.get_UnhandledError()
    }

;@endregion Instance Methods
}
