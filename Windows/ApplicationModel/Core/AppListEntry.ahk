#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppListEntry.ahk
#Include .\IAppListEntry2.ahk
#Include .\IAppListEntry3.ahk
#Include .\IAppListEntry4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides an app's display info such as its display name and description, and a method to launch the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.applistentry
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class AppListEntry extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppListEntry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppListEntry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides an app's display name, description, and logo.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.applistentry.displayinfo
     * @type {AppDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * Gets the **Application User Model ID (AUMID)** for this `AppListEntry`.
     * @remarks
     * An **AUMID** is a persistable value that you can use to identify an application. It's based on **package family name** + **Package Relative Application ID (PRAID)**.
     * 
     * | Identifier | Description |
     * |--------|--------|
     * | Package family name | Name + Publisher (the `<Identity>` element found in **appxmanifest.xml**). |
     * | PRAID | The `Id` property of the `Application` found in **appxmanifest.xml** (e.g. `<Application Id="Foo"...>`). |
     * 
     * The AUMID is independent of package version or architecture, so it can be used to identify an app across multiple versions or platforms.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.applistentry.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Provides information about an application such as its name, logo, package information, ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.applistentry.appinfo
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppDisplayInfo} 
     */
    get_DisplayInfo() {
        if (!this.HasProp("__IAppListEntry")) {
            if ((queryResult := this.QueryInterface(IAppListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppListEntry := IAppListEntry(outPtr)
        }

        return this.__IAppListEntry.get_DisplayInfo()
    }

    /**
     * Launch the app associated with this [AppListEntry](applistentry.md)
     * @remarks
     * The app is launched without passing parameters. It is launched in the same way as if the user clicked on the entry in the app list.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.applistentry.launchasync
     */
    LaunchAsync() {
        if (!this.HasProp("__IAppListEntry")) {
            if ((queryResult := this.QueryInterface(IAppListEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppListEntry := IAppListEntry(outPtr)
        }

        return this.__IAppListEntry.LaunchAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IAppListEntry2")) {
            if ((queryResult := this.QueryInterface(IAppListEntry2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppListEntry2 := IAppListEntry2(outPtr)
        }

        return this.__IAppListEntry2.get_AppUserModelId()
    }

    /**
     * Launch the app associated with this [AppListEntry](applistentry.md) within the context of a specified user.
     * @remarks
     * This is a Multi-User-Aware (MUA) API and can only be used by apps that declare themselves to be MUA, and only on devices that support MUA apps.
     * The app is launched in the same way as if the specified user clicked on the entry in the app list. The user is passed to the launched app via the event args. Passing `null` for `user` will result in an exception.
     * 
     * MUA apps launch with the a default user context. The `user` value, which is passed to the activated application via the event arguments, indicates who the app is activating on behalf of. A Single-User-Aware app will launch in the context of the `user` value that is passed into this API.
     * @param {User} user_ The user context that the app should be launched under.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.applistentry.launchforuserasync
     */
    LaunchForUserAsync(user_) {
        if (!this.HasProp("__IAppListEntry3")) {
            if ((queryResult := this.QueryInterface(IAppListEntry3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppListEntry3 := IAppListEntry3(outPtr)
        }

        return this.__IAppListEntry3.LaunchForUserAsync(user_)
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        if (!this.HasProp("__IAppListEntry4")) {
            if ((queryResult := this.QueryInterface(IAppListEntry4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppListEntry4 := IAppListEntry4(outPtr)
        }

        return this.__IAppListEntry4.get_AppInfo()
    }

;@endregion Instance Methods
}
