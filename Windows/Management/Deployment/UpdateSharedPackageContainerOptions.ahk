#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateSharedPackageContainerOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for updating a shared package container.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.updatesharedpackagecontaineroptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class UpdateSharedPackageContainerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateSharedPackageContainerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateSharedPackageContainerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value specifying whether apps with packages in the created shared container should be shut down as part of the container update operation.
     * @remarks
     * The update operation is synchronous even though the app shutdown process is asynchronous. There is no progress to communicated to the caller when closing these applications.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.updatesharedpackagecontaineroptions.forceappshutdown
     * @type {Boolean} 
     */
    ForceAppShutdown {
        get => this.get_ForceAppShutdown()
        set => this.put_ForceAppShutdown(value)
    }

    /**
     * Gets or sets a value that specifies whether the affected packages must be present for the update operation to succeed.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.updatesharedpackagecontaineroptions.requirepackagespresent
     * @type {Boolean} 
     */
    RequirePackagesPresent {
        get => this.get_RequirePackagesPresent()
        set => this.put_RequirePackagesPresent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [UpdateSharedPackageContainerOptions](updatesharedpackagecontaineroptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.UpdateSharedPackageContainerOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceAppShutdown() {
        if (!this.HasProp("__IUpdateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IUpdateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateSharedPackageContainerOptions := IUpdateSharedPackageContainerOptions(outPtr)
        }

        return this.__IUpdateSharedPackageContainerOptions.get_ForceAppShutdown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceAppShutdown(value) {
        if (!this.HasProp("__IUpdateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IUpdateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateSharedPackageContainerOptions := IUpdateSharedPackageContainerOptions(outPtr)
        }

        return this.__IUpdateSharedPackageContainerOptions.put_ForceAppShutdown(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequirePackagesPresent() {
        if (!this.HasProp("__IUpdateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IUpdateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateSharedPackageContainerOptions := IUpdateSharedPackageContainerOptions(outPtr)
        }

        return this.__IUpdateSharedPackageContainerOptions.get_RequirePackagesPresent()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequirePackagesPresent(value) {
        if (!this.HasProp("__IUpdateSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IUpdateSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateSharedPackageContainerOptions := IUpdateSharedPackageContainerOptions(outPtr)
        }

        return this.__IUpdateSharedPackageContainerOptions.put_RequirePackagesPresent(value)
    }

;@endregion Instance Methods
}
