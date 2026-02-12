#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentOwnerRegistrationData.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Class that returns all the registration data from [isolatedwindowsenvironmentownerregistration](isolatedwindowsenvironmentownerregistration.md).
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationdata
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentOwnerRegistrationData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentOwnerRegistrationData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentOwnerRegistrationData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Folders that can be shared from the host into the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationdata.shareablefolders
     * @type {IVector<HSTRING>} 
     */
    ShareableFolders {
        get => this.get_ShareableFolders()
    }

    /**
     * **Deprecated.** Processes run as System.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationdata.processesrunnableassystem
     * @type {IVector<HSTRING>} 
     */
    ProcessesRunnableAsSystem {
        get => this.get_ProcessesRunnableAsSystem()
    }

    /**
     * **Deprecated.** Processes run as User.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationdata.processesrunnableasuser
     * @type {IVector<HSTRING>} 
     */
    ProcessesRunnableAsUser {
        get => this.get_ProcessesRunnableAsUser()
    }

    /**
     * **Deprecated.** Extensions of files that can be activated in the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentownerregistrationdata.activationfileextensions
     * @type {IVector<HSTRING>} 
     */
    ActivationFileExtensions {
        get => this.get_ActivationFileExtensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * **Deprecated.** All the attributes for owner registered to Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentOwnerRegistrationData")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ShareableFolders() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationData")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOwnerRegistrationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOwnerRegistrationData := IIsolatedWindowsEnvironmentOwnerRegistrationData(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOwnerRegistrationData.get_ShareableFolders()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ProcessesRunnableAsSystem() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationData")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOwnerRegistrationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOwnerRegistrationData := IIsolatedWindowsEnvironmentOwnerRegistrationData(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOwnerRegistrationData.get_ProcessesRunnableAsSystem()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ProcessesRunnableAsUser() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationData")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOwnerRegistrationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOwnerRegistrationData := IIsolatedWindowsEnvironmentOwnerRegistrationData(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOwnerRegistrationData.get_ProcessesRunnableAsUser()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ActivationFileExtensions() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOwnerRegistrationData")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOwnerRegistrationData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOwnerRegistrationData := IIsolatedWindowsEnvironmentOwnerRegistrationData(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOwnerRegistrationData.get_ActivationFileExtensions()
    }

;@endregion Instance Methods
}
