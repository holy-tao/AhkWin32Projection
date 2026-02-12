#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemApp.ahk
#Include .\IRemoteSystemApp2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an application on a remote system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemApp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemApp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemApp.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The unique identifier for this application.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * The display-friendly name for this application. This is the name used by the device for Bluetooth identification. If this hasn't been set or the device doesn't support Bluetooth, this field will be empty.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Indicates whether this application is currently available for proximal connection.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.isavailablebyproximity
     * @type {Boolean} 
     */
    IsAvailableByProximity {
        get => this.get_IsAvailableByProximity()
    }

    /**
     * Indicates whether this application is currently available for spatial sharing connection.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.isavailablebyspatialproximity
     * @type {Boolean} 
     */
    IsAvailableBySpatialProximity {
        get => this.get_IsAvailableBySpatialProximity()
    }

    /**
     * The app-specific attributes of this application.
     * @remarks
     * As an example, your app could define a unique ID attribute and share it with client devices. Then they can look for it in subsequent discoveries.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.attributes
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Gets the User.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets a token that can be persisted by a RemoteSystemApp so that it can be connected back to later.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemapp.connectiontoken
     * @type {HSTRING} 
     */
    ConnectionToken {
        get => this.get_ConnectionToken()
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
        if (!this.HasProp("__IRemoteSystemApp")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp := IRemoteSystemApp(outPtr)
        }

        return this.__IRemoteSystemApp.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IRemoteSystemApp")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp := IRemoteSystemApp(outPtr)
        }

        return this.__IRemoteSystemApp.get_DisplayName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailableByProximity() {
        if (!this.HasProp("__IRemoteSystemApp")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp := IRemoteSystemApp(outPtr)
        }

        return this.__IRemoteSystemApp.get_IsAvailableByProximity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailableBySpatialProximity() {
        if (!this.HasProp("__IRemoteSystemApp")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp := IRemoteSystemApp(outPtr)
        }

        return this.__IRemoteSystemApp.get_IsAvailableBySpatialProximity()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Attributes() {
        if (!this.HasProp("__IRemoteSystemApp")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp := IRemoteSystemApp(outPtr)
        }

        return this.__IRemoteSystemApp.get_Attributes()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IRemoteSystemApp2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp2 := IRemoteSystemApp2(outPtr)
        }

        return this.__IRemoteSystemApp2.get_User()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConnectionToken() {
        if (!this.HasProp("__IRemoteSystemApp2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemApp2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemApp2 := IRemoteSystemApp2(outPtr)
        }

        return this.__IRemoteSystemApp2.get_ConnectionToken()
    }

;@endregion Instance Methods
}
