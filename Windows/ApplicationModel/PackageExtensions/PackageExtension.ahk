#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtension.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a packaged extension.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtension extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtension

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtension.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The extension's instance identifier.
     * @remarks
     * There may be multiple extensions within an extension group. The identifier distinguishes them from each other. For example, a category may contain both a test and shipping extension in the same category and they would have different identifiers so you can tell them apart.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Provides the display name of the packaged extension.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Provides the description of the packaged extension.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the package information for the packaged extension.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
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
    get_Id() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.get_Description()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.get_Package()
    }

    /**
     * Used by the extension to specify any extra information that the hosting app can query.
     * @remarks
     * Examples of extra information that could be returned from this method include authorship information, capability information, etc.
     * @returns {IPropertySet} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.getextensionproperties
     */
    GetExtensionProperties() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.GetExtensionProperties()
    }

    /**
     * Used by the extension to specify any extra information that the hosting app can query.
     * @remarks
     * Examples of extra information that could be returned from this method include authorship information, capability information, etc.
     * @returns {IAsyncOperation<IPropertySet>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.getextensionpropertiesasync
     */
    GetExtensionPropertiesAsync() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.GetExtensionPropertiesAsync()
    }

    /**
     * Gets the path to the extension's isolated storage location.
     * @remarks
     * This API can be used in conjunction with [GetExtensionProperties](packageextension_getextensionproperties_517263467.md) to access files in the extension's isolated storage.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.getpublicpath
     */
    GetPublicPath() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.GetPublicPath()
    }

    /**
     * Gets the readable subfolder in the extension's isolated storage.
     * @remarks
     * An extension can provide a subfolder containing files that hosting apps can read from. Hosts cannot write to the folder.
     * @returns {StorageFolder} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.getpublicfolder
     */
    GetPublicFolder() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.GetPublicFolder()
    }

    /**
     * Gets the readable subfolder in the extension's isolated storage.
     * @remarks
     * An extension can provide a subfolder containing files that hosting apps can read from. Hosts cannot write to the folder.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextension.getpublicfolderasync
     */
    GetPublicFolderAsync() {
        if (!this.HasProp("__IPackageExtension")) {
            if ((queryResult := this.QueryInterface(IPackageExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtension := IPackageExtension(outPtr)
        }

        return this.__IPackageExtension.GetPublicFolderAsync()
    }

;@endregion Instance Methods
}
