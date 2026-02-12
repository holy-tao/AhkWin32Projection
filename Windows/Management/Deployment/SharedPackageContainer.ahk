#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISharedPackageContainer.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a shared package container which groups packages together to run a shared virtual environment where they have access to the same virtual file system, virtual registry, and package files.
 * @remarks
 * This object is a snapshot view of the shared package container and is not live data. Updating a container definition will not dynamically update an existing **SharedPackageContainer** object. 
 * 
 * Use the [SharedPackageContainerManager](sharedpackagecontainermanager.md) class to create, delete, and manage **SharedPackageContainer** objects.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainer
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class SharedPackageContainer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISharedPackageContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISharedPackageContainer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the shared package container.
     * @remarks
     * Specify the name of a shared package container in the call to [CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainer.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the unique identifier on the device for the shared package container.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainer.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
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
    get_Name() {
        if (!this.HasProp("__ISharedPackageContainer")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainer := ISharedPackageContainer(outPtr)
        }

        return this.__ISharedPackageContainer.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISharedPackageContainer")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainer := ISharedPackageContainer(outPtr)
        }

        return this.__ISharedPackageContainer.get_Id()
    }

    /**
     * Retrieves a list of [SharedPackageContainerMember](sharedpackagecontainermember.md) objects representing the set package families, and any associated tuple-data included in the container.
     * @returns {IVector<SharedPackageContainerMember>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainer.getmembers
     */
    GetMembers() {
        if (!this.HasProp("__ISharedPackageContainer")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainer := ISharedPackageContainer(outPtr)
        }

        return this.__ISharedPackageContainer.GetMembers()
    }

    /**
     * Removes the specified package family name from the shared package container.
     * @param {HSTRING} packageFamilyName The package family name of the package to be removed from the container.
     * @param {UpdateSharedPackageContainerOptions} options A [UpdateSharedPackageContainerOptions](updatesharedpackagecontaineroptions.md) object specifying the options for the create operation.
     * @returns {UpdateSharedPackageContainerResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainer.removepackagefamily
     */
    RemovePackageFamily(packageFamilyName, options) {
        if (!this.HasProp("__ISharedPackageContainer")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainer := ISharedPackageContainer(outPtr)
        }

        return this.__ISharedPackageContainer.RemovePackageFamily(packageFamilyName, options)
    }

    /**
     * Deletes all data in the shared package container, including virtualized AppData files and virtualized registry keys.
     * @returns {UpdateSharedPackageContainerResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainer.resetdata
     */
    ResetData() {
        if (!this.HasProp("__ISharedPackageContainer")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainer := ISharedPackageContainer(outPtr)
        }

        return this.__ISharedPackageContainer.ResetData()
    }

;@endregion Instance Methods
}
