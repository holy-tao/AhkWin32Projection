#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageAllUserProvisioningOptions.ahk
#Include .\IPackageAllUserProvisioningOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for calls to [ProvisionPackageForAllUsersAsync](packagemanager_provisionpackageforallusersasync_1152150951.md), including specifying optional packages to install.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagealluserprovisioningoptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageAllUserProvisioningOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageAllUserProvisioningOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageAllUserProvisioningOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of optional family names of packages that form a related set with the specified main package family.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagealluserprovisioningoptions.optionalpackagefamilynames
     * @type {IVector<HSTRING>} 
     */
    OptionalPackageFamilyNames {
        get => this.get_OptionalPackageFamilyNames()
    }

    /**
     * Gets the list of package family names that will determine the order that package contents will be projected to the common location, for related sets with payload that requires projection into a common folder.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagealluserprovisioningoptions.projectionorderpackagefamilynames
     * @type {IVector<HSTRING>} 
     */
    ProjectionOrderPackageFamilyNames {
        get => this.get_ProjectionOrderPackageFamilyNames()
    }

    /**
     * @type {Boolean} 
     */
    DeferAutomaticRegistration {
        get => this.get_DeferAutomaticRegistration()
        set => this.put_DeferAutomaticRegistration(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PackageAllUserProvisioningOptions](packagealluserprovisioningoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.PackageAllUserProvisioningOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OptionalPackageFamilyNames() {
        if (!this.HasProp("__IPackageAllUserProvisioningOptions")) {
            if ((queryResult := this.QueryInterface(IPackageAllUserProvisioningOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageAllUserProvisioningOptions := IPackageAllUserProvisioningOptions(outPtr)
        }

        return this.__IPackageAllUserProvisioningOptions.get_OptionalPackageFamilyNames()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ProjectionOrderPackageFamilyNames() {
        if (!this.HasProp("__IPackageAllUserProvisioningOptions")) {
            if ((queryResult := this.QueryInterface(IPackageAllUserProvisioningOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageAllUserProvisioningOptions := IPackageAllUserProvisioningOptions(outPtr)
        }

        return this.__IPackageAllUserProvisioningOptions.get_ProjectionOrderPackageFamilyNames()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferAutomaticRegistration() {
        if (!this.HasProp("__IPackageAllUserProvisioningOptions2")) {
            if ((queryResult := this.QueryInterface(IPackageAllUserProvisioningOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageAllUserProvisioningOptions2 := IPackageAllUserProvisioningOptions2(outPtr)
        }

        return this.__IPackageAllUserProvisioningOptions2.get_DeferAutomaticRegistration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeferAutomaticRegistration(value) {
        if (!this.HasProp("__IPackageAllUserProvisioningOptions2")) {
            if ((queryResult := this.QueryInterface(IPackageAllUserProvisioningOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageAllUserProvisioningOptions2 := IPackageAllUserProvisioningOptions2(outPtr)
        }

        return this.__IPackageAllUserProvisioningOptions2.put_DeferAutomaticRegistration(value)
    }

;@endregion Instance Methods
}
