#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemAppRegistration.ahk
#Include .\IRemoteSystemAppRegistrationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class represents an application that is to be registered in the cloud for remote connectivity. A registered app can provide remote app services or be used to launch a URI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemappregistration
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemAppRegistration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemAppRegistration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemAppRegistration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a **[RemoteSystemAppRegistration](RemoteSystemAppRegistration.md)** instance to register an app for the device's default user account.
     * @returns {RemoteSystemAppRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemappregistration.getdefault
     */
    static GetDefault() {
        if (!RemoteSystemAppRegistration.HasProp("__IRemoteSystemAppRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemAppRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemAppRegistrationStatics.IID)
            RemoteSystemAppRegistration.__IRemoteSystemAppRegistrationStatics := IRemoteSystemAppRegistrationStatics(factoryPtr)
        }

        return RemoteSystemAppRegistration.__IRemoteSystemAppRegistrationStatics.GetDefault()
    }

    /**
     * Gets a **[RemoteSystemAppRegistration](RemoteSystemAppRegistration.md)** instance to register an app for the given user.
     * @param {User} user_ The user.
     * @returns {RemoteSystemAppRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemappregistration.getforuser
     */
    static GetForUser(user_) {
        if (!RemoteSystemAppRegistration.HasProp("__IRemoteSystemAppRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemAppRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemAppRegistrationStatics.IID)
            RemoteSystemAppRegistration.__IRemoteSystemAppRegistrationStatics := IRemoteSystemAppRegistrationStatics(factoryPtr)
        }

        return RemoteSystemAppRegistration.__IRemoteSystemAppRegistrationStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The user under which to register the app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemappregistration.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the attributes associated with this application.
     * @remarks
     * As an example, your app could define a unique ID attribute and share it with client devices. Then they can look for it in subsequent discoveries.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemappregistration.attributes
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Attributes {
        get => this.get_Attributes()
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
        if (!this.HasProp("__IRemoteSystemAppRegistration")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemAppRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemAppRegistration := IRemoteSystemAppRegistration(outPtr)
        }

        return this.__IRemoteSystemAppRegistration.get_User()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Attributes() {
        if (!this.HasProp("__IRemoteSystemAppRegistration")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemAppRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemAppRegistration := IRemoteSystemAppRegistration(outPtr)
        }

        return this.__IRemoteSystemAppRegistration.get_Attributes()
    }

    /**
     * Starts the process of registering this application in the cloud.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemappregistration.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IRemoteSystemAppRegistration")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemAppRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemAppRegistration := IRemoteSystemAppRegistration(outPtr)
        }

        return this.__IRemoteSystemAppRegistration.SaveAsync()
    }

;@endregion Instance Methods
}
