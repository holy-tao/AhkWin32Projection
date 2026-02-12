#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentOwnerRegistrationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that returns the results for [isolatedwindowsenvironmentownerregistration](isolatedwindowsenvironmentownerregistration.md).
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationresult
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentOwnerRegistrationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentOwnerRegistrationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentOwnerRegistrationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Calls for the [isolatedwindowsenvironmentownerregistrationstatus](isolatedwindowsenvironmentownerregistrationstatus.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * **Deprecated.** Returns the extended error for [isolatedwindowsenvironmentownerregistration](isolatedwindowsenvironmentownerregistration.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationresult.extendederror
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
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOwnerRegistrationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOwnerRegistrationResult := IIsolatedWindowsEnvironmentOwnerRegistrationResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOwnerRegistrationResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOwnerRegistrationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOwnerRegistrationResult := IIsolatedWindowsEnvironmentOwnerRegistrationResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOwnerRegistrationResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
