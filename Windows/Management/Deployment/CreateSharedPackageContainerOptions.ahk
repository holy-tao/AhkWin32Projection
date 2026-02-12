#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateSharedPackageContainerOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for creating a shared package container with a call to  [SharedPackageContainerManager.CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontaineroptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class CreateSharedPackageContainerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateSharedPackageContainerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateSharedPackageContainerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a read-only list of [SharedPackageContainerMember](sharedpackagecontainermember.md) objects representing the set package families, and any associated tuple-data included in the container.
     * @remarks
     * Package families in the container ordered by priority, highest to lowest, for virtual resource resolution
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontaineroptions.members
     * @type {IVector<SharedPackageContainerMember>} 
     */
    Members {
        get => this.get_Members()
    }

    /**
     * Gets or sets a value specifying whether apps with packages in the created shared container should be shut down as part of the container creation operation.
     * @remarks
     * The create operation is synchronous even though the app shutdown process is asynchronous. There is no progress to communicated to the caller when closing these applications.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontaineroptions.forceappshutdown
     * @type {Boolean} 
     */
    ForceAppShutdown {
        get => this.get_ForceAppShutdown()
        set => this.put_ForceAppShutdown(value)
    }

    /**
     * Gets or sets collision options for the shared package container creation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontaineroptions.createcollisionoption
     * @type {Integer} 
     */
    CreateCollisionOption {
        get => this.get_CreateCollisionOption()
        set => this.put_CreateCollisionOption(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CreateSharedPackageContainerOptions](createsharedpackagecontaineroptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.CreateSharedPackageContainerOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<SharedPackageContainerMember>} 
     */
    get_Members() {
        if (!this.HasProp("__ICreateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerOptions := ICreateSharedPackageContainerOptions(outPtr)
        }

        return this.__ICreateSharedPackageContainerOptions.get_Members()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        if (!this.HasProp("__ICreateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerOptions := ICreateSharedPackageContainerOptions(outPtr)
        }

        return this.__ICreateSharedPackageContainerOptions.get_ForceAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceAppShutdown(value) {
        if (!this.HasProp("__ICreateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerOptions := ICreateSharedPackageContainerOptions(outPtr)
        }

        return this.__ICreateSharedPackageContainerOptions.put_ForceAppShutdown(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CreateCollisionOption() {
        if (!this.HasProp("__ICreateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerOptions := ICreateSharedPackageContainerOptions(outPtr)
        }

        return this.__ICreateSharedPackageContainerOptions.get_CreateCollisionOption()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CreateCollisionOption(value) {
        if (!this.HasProp("__ICreateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerOptions := ICreateSharedPackageContainerOptions(outPtr)
        }

        return this.__ICreateSharedPackageContainerOptions.put_CreateCollisionOption(value)
    }

;@endregion Instance Methods
}
