#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentCreateResult.ahk
#Include .\IIsolatedWindowsEnvironmentCreateResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that queries for results of environment creation such as status and extended errors.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreateresult
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentCreateResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentCreateResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentCreateResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Calls for [isolatedwindowsenvironmentcreatestatus](isolatedwindowsenvironmentcreatestatus.md)
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreateresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * **Deprecated.** Queries for extended errors in case of Isolated Windows Environment creation failure.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreateresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * **Deprecated.** Queries for result of Isolated Windows Environment creation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreateresult.environment
     * @type {IsolatedWindowsEnvironment} 
     */
    Environment {
        get => this.get_Environment()
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
        if (!this.HasProp("__IIsolatedWindowsEnvironmentCreateResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentCreateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentCreateResult := IIsolatedWindowsEnvironmentCreateResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentCreateResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentCreateResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentCreateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentCreateResult := IIsolatedWindowsEnvironmentCreateResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentCreateResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {IsolatedWindowsEnvironment} 
     */
    get_Environment() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentCreateResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentCreateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentCreateResult := IIsolatedWindowsEnvironmentCreateResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentCreateResult.get_Environment()
    }

    /**
     * **Deprecated.** Change the priority of isolated environment creation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Integer} priority_ The new priority of the isolated environment creation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreateresult.changecreationpriority
     */
    ChangeCreationPriority(priority_) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentCreateResult2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentCreateResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentCreateResult2 := IIsolatedWindowsEnvironmentCreateResult2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentCreateResult2.ChangeCreationPriority(priority_)
    }

;@endregion Instance Methods
}
