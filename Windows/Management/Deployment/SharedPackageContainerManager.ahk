#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISharedPackageContainerManager.ahk
#Include .\ISharedPackageContainerManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for creating, deleting, and retrieving [SharedPackageContainer](sharedpackagecontainer.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class SharedPackageContainerManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISharedPackageContainerManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISharedPackageContainerManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of the [SharedPackageContainerManager](sharedpackagecontainermanager.md) class for the current user.
     * @returns {SharedPackageContainerManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.getdefault
     */
    static GetDefault() {
        if (!SharedPackageContainerManager.HasProp("__ISharedPackageContainerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.SharedPackageContainerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedPackageContainerManagerStatics.IID)
            SharedPackageContainerManager.__ISharedPackageContainerManagerStatics := ISharedPackageContainerManagerStatics(factoryPtr)
        }

        return SharedPackageContainerManager.__ISharedPackageContainerManagerStatics.GetDefault()
    }

    /**
     * Gets an instance of the [SharedPackageContainerManager](sharedpackagecontainermanager.md) class for the specified user.
     * @param {HSTRING} userSid The security identifier of the user for which the manager is created.
     * @returns {SharedPackageContainerManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.getforuser
     */
    static GetForUser(userSid) {
        if (!SharedPackageContainerManager.HasProp("__ISharedPackageContainerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.SharedPackageContainerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedPackageContainerManagerStatics.IID)
            SharedPackageContainerManager.__ISharedPackageContainerManagerStatics := ISharedPackageContainerManagerStatics(factoryPtr)
        }

        return SharedPackageContainerManager.__ISharedPackageContainerManagerStatics.GetForUser(userSid)
    }

    /**
     * Gets an instance of the [SharedPackageContainerManager](sharedpackagecontainermanager.md) class that facilitates provisioning containers that will apply to all users.
     * @returns {SharedPackageContainerManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.getforprovisioning
     */
    static GetForProvisioning() {
        if (!SharedPackageContainerManager.HasProp("__ISharedPackageContainerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.SharedPackageContainerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedPackageContainerManagerStatics.IID)
            SharedPackageContainerManager.__ISharedPackageContainerManagerStatics := ISharedPackageContainerManagerStatics(factoryPtr)
        }

        return SharedPackageContainerManager.__ISharedPackageContainerManagerStatics.GetForProvisioning()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @remarks
     * Packages in the specified families will launch inside the created container.  This method can be called multiple times with the same container name to update the definition.
     * @param {HSTRING} name Creates [SharedPackageContainer](sharedpackagecontainer.md) object that comprises the package families specified in the provided [CreateSharedPackageContainerOptions](createsharedpackagecontaineroptions.md) object.  
     * 
     * 
     * A string containing the name of the created package.
     * @param {CreateSharedPackageContainerOptions} options A **CreateSharedPackageContainerOptions** specifying the options for the create operation.
     * @returns {CreateSharedPackageContainerResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.createcontainer
     */
    CreateContainer(name, options) {
        if (!this.HasProp("__ISharedPackageContainerManager")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainerManager := ISharedPackageContainerManager(outPtr)
        }

        return this.__ISharedPackageContainerManager.CreateContainer(name, options)
    }

    /**
     * Deletes the specified package container.
     * @remarks
     * Deletion destroys the container and all of its data in the current manager scope.  For a user-scoped manager, it only removes for the current user. For a machine-scoped manager, it deprovisions the container so future users won’t acquire it.
     * @param {HSTRING} id The ID of the package to delete.
     * @param {DeleteSharedPackageContainerOptions} options A [DeleteSharedPackageContainerOptions](deletesharedpackagecontaineroptions.md) object specifying options for the delete operation.
     * @returns {DeleteSharedPackageContainerResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.deletecontainer
     */
    DeleteContainer(id, options) {
        if (!this.HasProp("__ISharedPackageContainerManager")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainerManager := ISharedPackageContainerManager(outPtr)
        }

        return this.__ISharedPackageContainerManager.DeleteContainer(id, options)
    }

    /**
     * 
     * @param {HSTRING} id Retrieves the [SharedPackageContainer](sharedpackagecontainer.md) with the specified ID.
     * 
     * 
     * A string containing the ID of the container to retrieve.
     * @returns {SharedPackageContainer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.getcontainer
     */
    GetContainer(id) {
        if (!this.HasProp("__ISharedPackageContainerManager")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainerManager := ISharedPackageContainerManager(outPtr)
        }

        return this.__ISharedPackageContainerManager.GetContainer(id)
    }

    /**
     * Retrieves a list of [SharedPackageContainer](sharedpackagecontainer.md) objects within the scope of the current manager, using the criteria specified by the provided [FindSharedPackageContainerOptions](findsharedpackagecontaineroptions.md).
     * @returns {IVector<SharedPackageContainer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.findcontainers
     */
    FindContainers() {
        if (!this.HasProp("__ISharedPackageContainerManager")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainerManager := ISharedPackageContainerManager(outPtr)
        }

        return this.__ISharedPackageContainerManager.FindContainers()
    }

    /**
     * Retrieves a list of all [SharedPackageContainer](sharedpackagecontainer.md) objects within the scope of the current manager.
     * @param {FindSharedPackageContainerOptions} options 
     * @returns {IVector<SharedPackageContainer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermanager.findcontainers
     */
    FindContainersWithOptions(options) {
        if (!this.HasProp("__ISharedPackageContainerManager")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainerManager := ISharedPackageContainerManager(outPtr)
        }

        return this.__ISharedPackageContainerManager.FindContainersWithOptions(options)
    }

;@endregion Instance Methods
}
