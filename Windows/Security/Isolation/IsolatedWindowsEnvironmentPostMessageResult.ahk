#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentPostMessageResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that queries for results of post message from host to Isolated Windows Environment such as status and extended errors.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentpostmessageresult
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentPostMessageResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentPostMessageResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentPostMessageResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Calls for the [isolatedwindowsenvironmentpostmessagestatus](isolatedwindowsenvironmentpostmessagestatus.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentpostmessageresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * **Deprecated.** Returns the extended error for [isolatedwindowsenvironmentpostmessageresult](isolatedwindowsenvironmentpostmessageresult.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentpostmessageresult.extendederror
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
        if (!this.HasProp("__IIsolatedWindowsEnvironmentPostMessageResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentPostMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentPostMessageResult := IIsolatedWindowsEnvironmentPostMessageResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentPostMessageResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentPostMessageResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentPostMessageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentPostMessageResult := IIsolatedWindowsEnvironmentPostMessageResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentPostMessageResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
