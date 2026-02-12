#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILogFileGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [LogFileGenerated](fileloggingsession_logfilegenerated.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.logfilegeneratedeventargs
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LogFileGeneratedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILogFileGeneratedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILogFileGeneratedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the log file.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.logfilegeneratedeventargs.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        if (!this.HasProp("__ILogFileGeneratedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILogFileGeneratedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILogFileGeneratedEventArgs := ILogFileGeneratedEventArgs(outPtr)
        }

        return this.__ILogFileGeneratedEventArgs.get_File()
    }

;@endregion Instance Methods
}
