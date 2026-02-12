#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateSharedPackageContainerResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of shared package container update operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.updatesharedpackagecontainerresult
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class UpdateSharedPackageContainerResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateSharedPackageContainerResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateSharedPackageContainerResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a the result status of a shared package container update operation.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.updatesharedpackagecontainerresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the extended error code for a shared package container update operation.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.updatesharedpackagecontainerresult.extendederror
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
        if (!this.HasProp("__IUpdateSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(IUpdateSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateSharedPackageContainerResult := IUpdateSharedPackageContainerResult(outPtr)
        }

        return this.__IUpdateSharedPackageContainerResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IUpdateSharedPackageContainerResult")) {
            if ((queryResult := this.QueryInterface(IUpdateSharedPackageContainerResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateSharedPackageContainerResult := IUpdateSharedPackageContainerResult(outPtr)
        }

        return this.__IUpdateSharedPackageContainerResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
