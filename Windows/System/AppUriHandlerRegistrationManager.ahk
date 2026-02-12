#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppUriHandlerRegistrationManager.ahk
#Include .\IAppUriHandlerRegistrationManager2.ahk
#Include .\IAppUriHandlerRegistrationManagerStatics2.ahk
#Include .\IAppUriHandlerRegistrationManagerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Retrieves [AppUriHandlerRegistrations](appurihandlerregistration.md) for the calling package. This can be used to access AppUriHandler registrations.
 * @remarks
 * In order to create this object to manage host registrations in addition to those declared in the AppxManifest, a windows.AppUriHandler contract registration must exist in the manifest with a name field provided.
 * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppUriHandlerRegistrationManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppUriHandlerRegistrationManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppUriHandlerRegistrationManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an [AppUriHandlerRegistrationManager](appurihandlerregistrationmanager.md) instance for a given package.
     * @remarks
     * With the returned **AppUriHandlerRegistrationManager**, the caller can then call [AppUriHandlerRegistrationManager.TryGetRegistration](appurihandlerregistrationmanager_trygetregistration_907258794.md) method to get an [AppUriHandlerRegistration](appurihandlerregistration.md) object.
     * @param {HSTRING} packageFamilyName The package family name for which the **AppUriHandlerRegistrationManager** is retrieved. The specified name can be for the calling app itself or any hosted app that is hosted by the calling app.
     * @returns {AppUriHandlerRegistrationManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.getforpackage
     */
    static GetForPackage(packageFamilyName) {
        if (!AppUriHandlerRegistrationManager.HasProp("__IAppUriHandlerRegistrationManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppUriHandlerRegistrationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppUriHandlerRegistrationManagerStatics2.IID)
            AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics2 := IAppUriHandlerRegistrationManagerStatics2(factoryPtr)
        }

        return AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics2.GetForPackage(packageFamilyName)
    }

    /**
     * Retrieves an [AppUriHandlerRegistrationManager](appurihandlerregistrationmanager.md) instance for a given package and user.
     * @remarks
     * With the returned **AppUriHandlerRegistrationManager**, the caller can then call [AppUriHandlerRegistrationManager.TryGetRegistration](appurihandlerregistrationmanager_trygetregistration_907258794.md) method to get an [AppUriHandlerRegistration](appurihandlerregistration.md) object.
     * @param {HSTRING} packageFamilyName The package family name for which the **AppUriHandlerRegistrationManager** is retrieved. The specified name can be for the calling app itself or any hosted app that is hosted by the calling app.
     * @param {User} user_ The user for which the **AppUriHandlerRegistrationManager** is retrieved.
     * @returns {AppUriHandlerRegistrationManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.getforpackageforuser
     */
    static GetForPackageForUser(packageFamilyName, user_) {
        if (!AppUriHandlerRegistrationManager.HasProp("__IAppUriHandlerRegistrationManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.AppUriHandlerRegistrationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppUriHandlerRegistrationManagerStatics2.IID)
            AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics2 := IAppUriHandlerRegistrationManagerStatics2(factoryPtr)
        }

        return AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics2.GetForPackageForUser(packageFamilyName, user_)
    }

    /**
     * Creates an [AppUriHandlerRegistrationManager](AppUriHandlerRegistrationManager.md) for the calling app for the current user.
     * @remarks
     * Apps which support multiple users should instead use [AppUriHandlerRegistrationManager.GetForUser](appurihandlerregistrationmanager_getforuser_2058550280.md).
     * @returns {AppUriHandlerRegistrationManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.getdefault
     */
    static GetDefault() {
        if (!AppUriHandlerRegistrationManager.HasProp("__IAppUriHandlerRegistrationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.AppUriHandlerRegistrationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppUriHandlerRegistrationManagerStatics.IID)
            AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics := IAppUriHandlerRegistrationManagerStatics(factoryPtr)
        }

        return AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics.GetDefault()
    }

    /**
     * Creates an [AppUriHandlerRegistrationManager](AppUriHandlerRegistrationManager.md) for the calling app for the requested user context.
     * @remarks
     * This API will fail if the caller has not set the "SupportedUsers" property in their AppxManifest to "multiple".
     * 
     * Apps which do not support multiple users should instead use [AppUriHandlerRegistrationManager.GetDefault](appurihandlerregistrationmanager_getdefault_846721868.md).
     * @param {User} user_ [User](user.md) context to perform operations for.
     * @returns {AppUriHandlerRegistrationManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.getforuser
     */
    static GetForUser(user_) {
        if (!AppUriHandlerRegistrationManager.HasProp("__IAppUriHandlerRegistrationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.AppUriHandlerRegistrationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppUriHandlerRegistrationManagerStatics.IID)
            AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics := IAppUriHandlerRegistrationManagerStatics(factoryPtr)
        }

        return AppUriHandlerRegistrationManager.__IAppUriHandlerRegistrationManagerStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The user context registrations will occur for.
     * @remarks
     * This field is only populated for apps which have set their "SupportedUsers" property to "multiple" and used [AppUriHandlerRegistrationManager.GetForUser](appurihandlerregistrationmanager_getforuser_2058550280.md) to create the AppUriHandlerRegistrationManager.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the package family name for the app originally specified when creating the [AppUriHandlerRegistrationManager](appurihandlerregistrationmanager.md) object.
     * @remarks
     * This method is useful in cases where the calling app hosts multiple hosted apps, and each one has its own app URI registrations. If the **AppUriHandlerRegistrationManager** was retrieved with by calling [GetForUser](appurihandlerregistrationmanager_getforuser_2058550280.md), empty string is returned.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.packagefamilyname
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
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAppUriHandlerRegistrationManager")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistrationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistrationManager := IAppUriHandlerRegistrationManager(outPtr)
        }

        return this.__IAppUriHandlerRegistrationManager.get_User()
    }

    /**
     * Attempts to retrieve a registration object for the windows.AppUriHandler extension present in the caller's AppxManifest with the given name.
     * @remarks
     * The registration retrieved by this API represents a "windows.appUriHandler" extension like the example below.
     * <uap3:Extension Category="windows.appUriHandler">
     *     <uap3:AppUriHandler uap7:Name ="Runtime">
     *         <uap3:Host Name="www.appurihandler.com" />
     * </uap3:AppUriHandler>
     * @param {HSTRING} name Name corresponding to an entry in the caller's AppxManfiest.
     * @returns {AppUriHandlerRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appurihandlerregistrationmanager.trygetregistration
     */
    TryGetRegistration(name) {
        if (!this.HasProp("__IAppUriHandlerRegistrationManager")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistrationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistrationManager := IAppUriHandlerRegistrationManager(outPtr)
        }

        return this.__IAppUriHandlerRegistrationManager.TryGetRegistration(name)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IAppUriHandlerRegistrationManager2")) {
            if ((queryResult := this.QueryInterface(IAppUriHandlerRegistrationManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppUriHandlerRegistrationManager2 := IAppUriHandlerRegistrationManager2(outPtr)
        }

        return this.__IAppUriHandlerRegistrationManager2.get_PackageFamilyName()
    }

;@endregion Instance Methods
}
