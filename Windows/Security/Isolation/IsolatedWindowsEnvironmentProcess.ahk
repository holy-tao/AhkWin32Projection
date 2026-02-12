#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentProcess.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Class that returns object by start process that represents process in the Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocess
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentProcess extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentProcess

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentProcess.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Returns current state of process execution.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocess.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * **Deprecated.** Returns exit code of executed process.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocess.exitcode
     * @type {Integer} 
     */
    ExitCode {
        get => this.get_ExitCode()
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
        if (!this.HasProp("__IIsolatedWindowsEnvironmentProcess")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentProcess := IIsolatedWindowsEnvironmentProcess(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentProcess.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExitCode() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentProcess")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentProcess := IIsolatedWindowsEnvironmentProcess(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentProcess.get_ExitCode()
    }

    /**
     * **Deprecated.** Allows caller to wait for process completion.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocess.waitforexit
     */
    WaitForExit() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentProcess")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentProcess := IIsolatedWindowsEnvironmentProcess(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentProcess.WaitForExit()
    }

    /**
     * **Deprecated.** Allows caller to specify a timeout for process completion.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Integer} timeoutMilliseconds Amount of time allowed before timeout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocess.waitforexitwithtimeout
     */
    WaitForExitWithTimeout(timeoutMilliseconds) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentProcess")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentProcess := IIsolatedWindowsEnvironmentProcess(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentProcess.WaitForExitWithTimeout(timeoutMilliseconds)
    }

    /**
     * **Deprecated.** Allows caller to wait for process completion asynchronously.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentprocess.waitforexitasync
     */
    WaitForExitAsync() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentProcess")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentProcess := IIsolatedWindowsEnvironmentProcess(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentProcess.WaitForExitAsync()
    }

;@endregion Instance Methods
}
