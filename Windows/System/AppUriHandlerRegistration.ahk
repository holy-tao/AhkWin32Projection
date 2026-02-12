#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppUriHandlerRegistration.ahk
#Include .\IAppUriHandlerRegistration2.ahk
#Include ..\..\Guid.ahk

/**
 * Sets and retrieves dynamic [AppUriHandlerHost](appurihandlerhost.md) entries for a given AppUriHandler registration.
 * @remarks
 * Registrations follow the same structure as entries in the AppxManifest:
 * 
 * ```xml
 * <uap3:Extension Category="windows.appUriHandler">
 *     <uap3:AppUriHandler uap7:Name ="Runtime">
 *         <uap3:Host Name="appurihandler.example.com" />
 *     </uap3:AppUriHandler>
 * </uap3:Extension>
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppUriHandlerRegistration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppUriHandlerRegistration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppUriHandlerRegistration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The name of the registration.
     * @remarks
     * This corresponds to the "name" field of a windows.AppUriHandler contract registration in the AppxManifest.
     * 
     * Example:
     * <uap3:AppUriHandler uap7:Name ="MyRegistrationName">
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * The user context of this registration.
     * @remarks
     * This field is only relevant for apps which declare their support for multiple users.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the package family name for the app originally specified when creating the associated [AppUriHandlerRegistrationManager](appurihandlerregistrationmanager.md) object.
     * @remarks
     * This method is useful in cases where the calling app hosts multiple hosted apps, and each one has its own app URI registrations. If the associated **AppUriHandlerRegistrationManager** was retrieved with by calling [GetForUser](appurihandlerregistrationmanager_getforuser_2058550280.md), empty string is returned.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
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
        if (!this.HasProp("__IAppUriHandlerRegistration")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration := IAppUriHandlerRegistration(outPtr)
        }

        return this.__IAppUriHandlerRegistration.get_Name()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAppUriHandlerRegistration")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration := IAppUriHandlerRegistration(outPtr)
        }

        return this.__IAppUriHandlerRegistration.get_User()
    }

    /**
     * Retrieves the set of hosts added by [SetAppAddedHostsAsync](appurihandlerregistration_setappaddedhostsasync_654710773.md) for the given registration.
     * @remarks
     * This set does not include hosts defined in the AppxManifest.
     * @returns {IAsyncOperation<IVector<AppUriHandlerHost>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.getappaddedhostsasync
     */
    GetAppAddedHostsAsync() {
        if (!this.HasProp("__IAppUriHandlerRegistration")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration := IAppUriHandlerRegistration(outPtr)
        }

        return this.__IAppUriHandlerRegistration.GetAppAddedHostsAsync()
    }

    /**
     * Registers hosts in addition to the hosts already defined in the AppxManifest.
     * @remarks
     * This API does not override, replace, or remove entries that are registered via the AppxManifest.
     * @param {IIterable<AppUriHandlerHost>} hosts The set of [AppUriHandlerHost](appurihandlerhost.md) objects to register.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.setappaddedhostsasync
     */
    SetAppAddedHostsAsync(hosts) {
        if (!this.HasProp("__IAppUriHandlerRegistration")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration := IAppUriHandlerRegistration(outPtr)
        }

        return this.__IAppUriHandlerRegistration.SetAppAddedHostsAsync(hosts)
    }

    /**
     * Retrieves the set of all hosts including those added programmatically with [SetAppAddedHostsAsync](appurihandlerregistration_setappaddedhostsasync_654710773.md) and those registered statically in the app manifest.
     * @returns {IVector<AppUriHandlerHost>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.getallhosts
     */
    GetAllHosts() {
        if (!this.HasProp("__IAppUriHandlerRegistration2")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration2 := IAppUriHandlerRegistration2(outPtr)
        }

        return this.__IAppUriHandlerRegistration2.GetAllHosts()
    }

    /**
     * Updates all the app URI registrations specified in the collection.
     * @remarks
     * Each registration is represented by an [AppUriHandlerHost](appurihandlerhost.md) object. For each object, the caller can set the [IsEnabled](appurihandlerhost_isenabled.md) property to enable or disable that registration. The list of registrations can either be the full list for that app or a subset. It cannot include new registrations that are not already in the list.  Any existing registrations that are not specified in the list remain unchanged. 
     * 
     * This method requires the **Microsoft.delegatedWebFeatures** capability.
     * @param {IIterable<AppUriHandlerHost>} hosts The collection of [AppUriHandlerHost](appurihandlerhost.md) objects to update.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistration.updatehosts
     */
    UpdateHosts(hosts) {
        if (!this.HasProp("__IAppUriHandlerRegistration2")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration2 := IAppUriHandlerRegistration2(outPtr)
        }

        return this.__IAppUriHandlerRegistration2.UpdateHosts(hosts)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IAppUriHandlerRegistration2")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistration2 := IAppUriHandlerRegistration2(outPtr)
        }

        return this.__IAppUriHandlerRegistration2.get_PackageFamilyName()
    }

;@endregion Instance Methods
}
