#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExtension.ahk
#Include .\IAppExtension2.ahk
#Include .\IAppExtension3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an application extension.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class AppExtension extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExtension

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExtension.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The extension's instance identifier.
     * @remarks
     * There may be multiple extensions within an extension group. The identifier distinguishes them from each other. For example, a category may contain both a test and shipping extension in the same category and they would have different identifiers so you can tell them apart.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Provides the display name of this extension.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Provides the description of this app extension.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the package information for the app extension.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Provides information such as the app extension's name, logo, package information, and app identifier, that the host app may choose to show to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.appinfo
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

    /**
     * Gets an identifier that uniquely identifies the app.
     * @remarks
     * An application user model identifier is used to associate processes, files, and windows with a particular application. See [Application User Model IDs](/windows/desktop/shell/appids) for more details.
     * 
     * This API is a more efficient, but otherwise exact equivalent of the [AppInfo.AppUserModelId](../windows.applicationmodel/appinfo_appusermodelid.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
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
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.get_Description()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.get_Package()
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.get_AppInfo()
    }

    /**
     * Used by the extension to specify any extra information that the hosting app can query.
     * @remarks
     * Examples of extra information that could be returned from this property includes authorship information, capability information, etc.
     * @returns {IAsyncOperation<IPropertySet>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.getextensionpropertiesasync
     */
    GetExtensionPropertiesAsync() {
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.GetExtensionPropertiesAsync()
    }

    /**
     * Gets the subfolder provided by the `PublicFolder` attribute in the app extension for sharing files between the extension and the host.
     * @remarks
     * Extensions must create this folder by populating it with files as part of their package definition. It is read-only to both the extension and its host.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.getpublicfolderasync
     */
    GetPublicFolderAsync() {
        if (!this.HasProp("__IAppExtension")) {
            if ((queryResult := this.QueryInterface(IAppExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension := IAppExtension(outPtr)
        }

        return this.__IAppExtension.GetPublicFolderAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IAppExtension2")) {
            if ((queryResult := this.QueryInterface(IAppExtension2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension2 := IAppExtension2(outPtr)
        }

        return this.__IAppExtension2.get_AppUserModelId()
    }

    /**
     * Used by the extension to specify any extra information that the hosting app can query.
     * @remarks
     * Examples of extra information that could be returned from this property includes authorship information, capability information, etc.
     * @returns {IPropertySet} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.getextensionproperties
     */
    GetExtensionProperties() {
        if (!this.HasProp("__IAppExtension3")) {
            if ((queryResult := this.QueryInterface(IAppExtension3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension3 := IAppExtension3(outPtr)
        }

        return this.__IAppExtension3.GetExtensionProperties()
    }

    /**
     * Gets the path to the extension's isolated storage location.
     * @remarks
     * This API can be used in conjunction with [GetExtensionProperties](appextension_getextensionproperties_517263467.md) to access files in the extension's isolated storage.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.getpublicpath
     */
    GetPublicPath() {
        if (!this.HasProp("__IAppExtension3")) {
            if ((queryResult := this.QueryInterface(IAppExtension3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension3 := IAppExtension3(outPtr)
        }

        return this.__IAppExtension3.GetPublicPath()
    }

    /**
     * Gets the subfolder provided by the `PublicFolder` attribute in the app extension for sharing files between the extension and the host.
     * @remarks
     * Extensions must create this folder by populating it with files as part of their package definition. It is read-only to both the extension and its host.
     * @returns {StorageFolder} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextension.getpublicfolder
     */
    GetPublicFolder() {
        if (!this.HasProp("__IAppExtension3")) {
            if ((queryResult := this.QueryInterface(IAppExtension3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtension3 := IAppExtension3(outPtr)
        }

        return this.__IAppExtension3.GetPublicFolder()
    }

;@endregion Instance Methods
}
