#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageContentGroup.ahk
#Include .\IPackageContentGroupStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about a package content group.
 * @remarks
 * A package content group allows you to segment a large app into different groups. A group may be automatic which means it can be downloaded in the background or on-demand. A group may be required which means that it will be downloaded during app install.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroup
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageContentGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageContentGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageContentGroup.IID

    /**
     * Gets the name of the required content group.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroup.requiredgroupname
     * @type {HSTRING} 
     */
    static RequiredGroupName {
        get => PackageContentGroup.get_RequiredGroupName()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RequiredGroupName() {
        if (!PackageContentGroup.HasProp("__IPackageContentGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.PackageContentGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPackageContentGroupStatics.IID)
            PackageContentGroup.__IPackageContentGroupStatics := IPackageContentGroupStatics(factoryPtr)
        }

        return PackageContentGroup.__IPackageContentGroupStatics.get_RequiredGroupName()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the package for this content group.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroup.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets the name of this package content group.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroup.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the state of the package content group.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroup.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Indicates whether this package content group is required or automatic.
     * @remarks
     * Required packages are downloaded during app install. Automatic packages are downloaded on demand. There can only be one required packaged content group per app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroup.isrequired
     * @type {Boolean} 
     */
    IsRequired {
        get => this.get_IsRequired()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageContentGroup")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroup := IPackageContentGroup(outPtr)
        }

        return this.__IPackageContentGroup.get_Package()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPackageContentGroup")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroup := IPackageContentGroup(outPtr)
        }

        return this.__IPackageContentGroup.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IPackageContentGroup")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroup := IPackageContentGroup(outPtr)
        }

        return this.__IPackageContentGroup.get_State()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequired() {
        if (!this.HasProp("__IPackageContentGroup")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroup := IPackageContentGroup(outPtr)
        }

        return this.__IPackageContentGroup.get_IsRequired()
    }

;@endregion Instance Methods
}
