#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateSharedPackageContainerResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of a call to [SharedPackageContainerManager.CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontainerresult
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class CreateSharedPackageContainerResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateSharedPackageContainerResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateSharedPackageContainerResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the shared package container created by the call to [SharedPackageContainerManager.CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontainerresult.container
     * @type {SharedPackageContainer} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * Gets a the result status of a call to  [SharedPackageContainerManager.CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontainerresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a the extended error code from a call to  [SharedPackageContainerManager.CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.createsharedpackagecontainerresult.extendederror
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
     * @returns {SharedPackageContainer} 
     */
    get_Container() {
        if (!this.HasProp("__ICreateSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerResult := ICreateSharedPackageContainerResult(outPtr)
        }

        return this.__ICreateSharedPackageContainerResult.get_Container()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ICreateSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerResult := ICreateSharedPackageContainerResult(outPtr)
        }

        return this.__ICreateSharedPackageContainerResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(ICreateSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateSharedPackageContainerResult := ICreateSharedPackageContainerResult(outPtr)
        }

        return this.__ICreateSharedPackageContainerResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
