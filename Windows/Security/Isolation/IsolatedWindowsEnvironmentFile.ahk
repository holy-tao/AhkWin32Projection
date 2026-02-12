#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentFile.ahk
#Include .\IIsolatedWindowsEnvironmentFile2.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that encapsulates functions for launching a file in an Isolated Windows Environment.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentfile
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentFile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentFile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentFile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the ID assigned to the host file.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentfile.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * **Deprecated.** Gets the full host path of a file.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentfile.hostpath
     * @type {HSTRING} 
     */
    HostPath {
        get => this.get_HostPath()
    }

    /**
     * **Deprecated.** Gets the full guest path of a file.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentfile.guestpath
     * @type {HSTRING} 
     */
    GuestPath {
        get => this.get_GuestPath()
    }

    /**
     * **Deprecated.** Gets the write permission on the file.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentfile.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentFile")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentFile := IIsolatedWindowsEnvironmentFile(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentFile.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HostPath() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentFile")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentFile := IIsolatedWindowsEnvironmentFile(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentFile.get_HostPath()
    }

    /**
     * **Deprecated.** Call to close a file in the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentfile.close
     */
    Close() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentFile")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentFile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentFile := IIsolatedWindowsEnvironmentFile(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentFile.Close()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GuestPath() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentFile2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentFile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentFile2 := IIsolatedWindowsEnvironmentFile2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentFile2.get_GuestPath()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentFile2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentFile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentFile2 := IIsolatedWindowsEnvironmentFile2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentFile2.get_IsReadOnly()
    }

;@endregion Instance Methods
}
