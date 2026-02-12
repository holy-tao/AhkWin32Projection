#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentShareFolderResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Object containing information about the result of the share folder request.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefolderresult
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentShareFolderResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentShareFolderResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentShareFolderResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Status of the share folder operation: success or failure.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefolderresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * **Deprecated.** When a failure to share a folder occurs this will contain the error code associated with that failure.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentsharefolderresult.extendederror
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
        if (!this.HasProp("__IIsolatedWindowsEnvironmentShareFolderResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentShareFolderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentShareFolderResult := IIsolatedWindowsEnvironmentShareFolderResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentShareFolderResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentShareFolderResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentShareFolderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentShareFolderResult := IIsolatedWindowsEnvironmentShareFolderResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentShareFolderResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
