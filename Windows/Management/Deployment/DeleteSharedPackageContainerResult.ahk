#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeleteSharedPackageContainerResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of a call to [SharedPackageContainerManager.DeleteContainer](sharedpackagecontainermanager_deletecontainer_1124709414.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deletesharedpackagecontainerresult
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class DeleteSharedPackageContainerResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeleteSharedPackageContainerResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeleteSharedPackageContainerResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a the result status of a call to [SharedPackageContainerManager.DeleteContainer](sharedpackagecontainermanager_deletecontainer_1124709414.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deletesharedpackagecontainerresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a the extended error code from a call to [SharedPackageContainerManager.DeleteContainer](sharedpackagecontainermanager_deletecontainer_1124709414.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deletesharedpackagecontainerresult.extendederror
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
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDeleteSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(IDeleteSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeleteSharedPackageContainerResult := IDeleteSharedPackageContainerResult(outPtr)
        }

        return this.__IDeleteSharedPackageContainerResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IDeleteSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(IDeleteSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeleteSharedPackageContainerResult := IDeleteSharedPackageContainerResult(outPtr)
        }

        return this.__IDeleteSharedPackageContainerResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
