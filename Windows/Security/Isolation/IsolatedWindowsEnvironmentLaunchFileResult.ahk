#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentLaunchFileResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class containing result properties for file launch into an Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentlaunchfileresult
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentLaunchFileResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentLaunchFileResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentLaunchFileResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Calls the [IsolatedWindowsEnvironmentLaunchFileStatus](isolatedwindowsenvironmentlaunchfilestatus.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentlaunchfileresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * **Deprecated.** Gets the extended error code if a file fails to launch in an Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentlaunchfileresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * **Deprecated.** Instantiates the [IsolatedWindowsEnvironmentFile](isolatedwindowsenvironmentfile.md) runtime class.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentlaunchfileresult.file
     * @type {IsolatedWindowsEnvironmentFile} 
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
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentLaunchFileResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentLaunchFileResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentLaunchFileResult := IIsolatedWindowsEnvironmentLaunchFileResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentLaunchFileResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentLaunchFileResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentLaunchFileResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentLaunchFileResult := IIsolatedWindowsEnvironmentLaunchFileResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentLaunchFileResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {IsolatedWindowsEnvironmentFile} 
     */
    get_File() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentLaunchFileResult")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentLaunchFileResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentLaunchFileResult := IIsolatedWindowsEnvironmentLaunchFileResult(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentLaunchFileResult.get_File()
    }

;@endregion Instance Methods
}
