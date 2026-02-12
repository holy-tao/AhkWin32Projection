#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentStartProcessResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that queries the result of the start process in the Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentstartprocessresult
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentStartProcessResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentStartProcessResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentStartProcessResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Queries the status of process execution in the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentstartprocessresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * **Deprecated.** Queries for extended errors if the start process for Isolated Windows Environment fails.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentstartprocessresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * **Deprecated.** Represents lifetime of the process in execution in the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentstartprocessresult.process
     * @type {IsolatedWindowsEnvironmentProcess} 
     */
    Process {
        get => this.get_Process()
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
    get_Status() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentStartProcessResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentStartProcessResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentStartProcessResult := IIsolatedWindowsEnvironmentStartProcessResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentStartProcessResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentStartProcessResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentStartProcessResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentStartProcessResult := IIsolatedWindowsEnvironmentStartProcessResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentStartProcessResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {IsolatedWindowsEnvironmentProcess} 
     */
    get_Process() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentStartProcessResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentStartProcessResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentStartProcessResult := IIsolatedWindowsEnvironmentStartProcessResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentStartProcessResult.get_Process()
    }

;@endregion Instance Methods
}
