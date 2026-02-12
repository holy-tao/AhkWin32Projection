#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageId.ahk
#Include .\IPackageIdWithMetadata.ahk
#Include ..\..\Guid.ahk

/**
 * Provides package identification info, such as name, version, and publisher.
 * @remarks
 * Use the [Package.Current](package_current.md) property to get the package for the current app.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageId extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageId

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageId.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the package version info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.version
     * @type {PackageVersion} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * Gets the processor architecture for which the package was created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.architecture
     * @type {Integer} 
     */
    Architecture {
        get => this.get_Architecture()
    }

    /**
     * Gets the resource ID of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.resourceid
     * @type {HSTRING} 
     */
    ResourceId {
        get => this.get_ResourceId()
    }

    /**
     * Gets the publisher of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.publisher
     * @type {HSTRING} 
     */
    Publisher {
        get => this.get_Publisher()
    }

    /**
     * Gets the publisher ID of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.publisherid
     * @type {HSTRING} 
     */
    PublisherId {
        get => this.get_PublisherId()
    }

    /**
     * Gets the full name of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.fullname
     * @type {HSTRING} 
     */
    FullName {
        get => this.get_FullName()
    }

    /**
     * Gets the family name of the package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.familyname
     * @type {HSTRING} 
     */
    FamilyName {
        get => this.get_FamilyName()
    }

    /**
     * Windows Phone only. Gets the value of the ProductID attribute associated with this XAP application package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.productid
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Windows Phone only. Gets the value of the Author attribute for the specified application package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageid.author
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
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
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_Name()
    }

    /**
     * 
     * @returns {PackageVersion} 
     */
    get_Version() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_Version()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Architecture() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_Architecture()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResourceId() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_ResourceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Publisher() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_Publisher()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublisherId() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_PublisherId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FullName() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_FullName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FamilyName() {
        if (!this.HasProp("__IPackageId")) {
            if ((queryResult := this.QueryInterface(IPackageId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageId := IPackageId(outPtr)
        }

        return this.__IPackageId.get_FamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProductId() {
        if (!this.HasProp("__IPackageIdWithMetadata")) {
            if ((queryResult := this.QueryInterface(IPackageIdWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageIdWithMetadata := IPackageIdWithMetadata(outPtr)
        }

        return this.__IPackageIdWithMetadata.get_ProductId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Author() {
        if (!this.HasProp("__IPackageIdWithMetadata")) {
            if ((queryResult := this.QueryInterface(IPackageIdWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageIdWithMetadata := IPackageIdWithMetadata(outPtr)
        }

        return this.__IPackageIdWithMetadata.get_Author()
    }

;@endregion Instance Methods
}
