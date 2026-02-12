#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeleteSharedPackageContainerOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for creating a shared package container with a call to  [SharedPackageContainerManager.DeleteContainer](sharedpackagecontainermanager_deletecontainer_1124709414.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deletesharedpackagecontaineroptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class DeleteSharedPackageContainerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeleteSharedPackageContainerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeleteSharedPackageContainerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value specifying whether apps with packages in the created shared container should be shut down as part of the container deletion operation.
     * @remarks
     * The delete operation is synchronous even though the app shutdown process is asynchronous. There is no progress to communicated to the caller when closing these applications.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deletesharedpackagecontaineroptions.forceappshutdown
     * @type {Boolean} 
     */
    ForceAppShutdown {
        get => this.get_ForceAppShutdown()
        set => this.put_ForceAppShutdown(value)
    }

    /**
     * Gets or sets a value indicating whether the shared package container should be deleted for all users.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deletesharedpackagecontaineroptions.allusers
     * @type {Boolean} 
     */
    AllUsers {
        get => this.get_AllUsers()
        set => this.put_AllUsers(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DeleteSharedPackageContainerOptions](deletesharedpackagecontaineroptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.DeleteSharedPackageContainerOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        if (!this.HasProp("__IDeleteSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IDeleteSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeleteSharedPackageContainerOptions := IDeleteSharedPackageContainerOptions(outPtr)
        }

        return this.__IDeleteSharedPackageContainerOptions.get_ForceAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceAppShutdown(value) {
        if (!this.HasProp("__IDeleteSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IDeleteSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeleteSharedPackageContainerOptions := IDeleteSharedPackageContainerOptions(outPtr)
        }

        return this.__IDeleteSharedPackageContainerOptions.put_ForceAppShutdown(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllUsers() {
        if (!this.HasProp("__IDeleteSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IDeleteSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeleteSharedPackageContainerOptions := IDeleteSharedPackageContainerOptions(outPtr)
        }

        return this.__IDeleteSharedPackageContainerOptions.get_AllUsers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllUsers(value) {
        if (!this.HasProp("__IDeleteSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IDeleteSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeleteSharedPackageContainerOptions := IDeleteSharedPackageContainerOptions(outPtr)
        }

        return this.__IDeleteSharedPackageContainerOptions.put_AllUsers(value)
    }

;@endregion Instance Methods
}
