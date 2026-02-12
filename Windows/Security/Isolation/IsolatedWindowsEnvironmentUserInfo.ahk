#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentUserInfo.ahk
#Include .\IIsolatedWindowsEnvironmentUserInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class containing properties for the Isolated Windows Environment user.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentuserinfo
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentUserInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentUserInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentUserInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets the SID of the user signed in to the Isolated Windows Environment, since this is different and separate from the host user.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * 
     * This can be queried before Isolated Windows Environment sign-in completes.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentuserinfo.environmentusersid
     * @type {HSTRING} 
     */
    EnvironmentUserSid {
        get => this.get_EnvironmentUserSid()
    }

    /**
     * **Deprecated.** Gets the username of the user signed in to the Isolated Windows Environment, since this is different and separate from the host user.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * 
     * This can be queried before Isolated Windows Environment sign-in completes.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentuserinfo.environmentusername
     * @type {HSTRING} 
     */
    EnvironmentUserName {
        get => this.get_EnvironmentUserName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentUserSid() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentUserInfo")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentUserInfo := IIsolatedWindowsEnvironmentUserInfo(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentUserInfo.get_EnvironmentUserSid()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentUserName() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentUserInfo")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentUserInfo := IIsolatedWindowsEnvironmentUserInfo(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentUserInfo.get_EnvironmentUserName()
    }

    /**
     * **Deprecated.** This asynchronous wait function returns once the Isolated Windows Environment sign-in process is complete. It returns `true` if sign-in succeeded, `false` otherwise.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * 
     * If sign-in is complete when `TryWaitForSignInAsync` is called, the API returns `true` immediately.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentuserinfo.trywaitforsigninasync
     */
    TryWaitForSignInAsync() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentUserInfo")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentUserInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentUserInfo := IIsolatedWindowsEnvironmentUserInfo(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentUserInfo.TryWaitForSignInAsync()
    }

    /**
     * **Deprecated.** An asynchronous function which allows callers to wait for the environment sign-in process to complete before continuing. This function provides progress updates as it waits for sign-in; [TryWaitForSignInAsync](isolatedwindowsenvironmentuserinfo_trywaitforsigninasync_2135355077.md) does not.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @returns {IAsyncOperationWithProgress<Boolean, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentuserinfo.trywaitforsigninwithprogressasync
     */
    TryWaitForSignInWithProgressAsync() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentUserInfo2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentUserInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentUserInfo2 := IIsolatedWindowsEnvironmentUserInfo2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentUserInfo2.TryWaitForSignInWithProgressAsync()
    }

;@endregion Instance Methods
}
