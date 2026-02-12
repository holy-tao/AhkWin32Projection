#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExecutionStateChangeResult.ahk
#Include ..\..\Guid.ahk

/**
 * Provides the result of an attempt to change an app's execution state (such as from running to suspended).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appexecutionstatechangeresult
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppExecutionStateChangeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExecutionStateChangeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExecutionStateChangeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error information, if any, that may have resulted from trying to change the apps execution state.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appexecutionstatechangeresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
    get_ExtendedError() {
        if (!this.HasProp("__IAppExecutionStateChangeResult")) {
            if ((queryResult := this.QueryInterface(IAppExecutionStateChangeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExecutionStateChangeResult := IAppExecutionStateChangeResult(outPtr)
        }

        return this.__IAppExecutionStateChangeResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
