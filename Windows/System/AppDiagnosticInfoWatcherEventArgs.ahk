#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppDiagnosticInfoWatcherEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * The data object passed to an **[AppDiagnosticInfoWatcher](appdiagnosticinfowatcher.md)** event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatchereventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppDiagnosticInfoWatcherEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppDiagnosticInfoWatcherEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppDiagnosticInfoWatcherEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets diagnostic info for the app package.
     * @remarks
     * Typically there will only be one app associated with the  **AppDiagnosticInfo**, but there can be more.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatchereventargs.appdiagnosticinfo
     * @type {AppDiagnosticInfo} 
     */
    AppDiagnosticInfo {
        get => this.get_AppDiagnosticInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppDiagnosticInfo} 
     */
    get_AppDiagnosticInfo() {
        if (!this.HasProp("__IAppDiagnosticInfoWatcherEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcherEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcherEventArgs := IAppDiagnosticInfoWatcherEventArgs(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcherEventArgs.get_AppDiagnosticInfo()
    }

;@endregion Instance Methods
}
