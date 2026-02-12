#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystem.ahk
#Include .\IRemoteSystem2.ahk
#Include .\IRemoteSystem3.ahk
#Include .\IRemoteSystem4.ahk
#Include .\IRemoteSystem5.ahk
#Include .\IRemoteSystem6.ahk
#Include .\IRemoteSystemStatics3.ahk
#Include .\IRemoteSystemStatics2.ahk
#Include .\IRemoteSystemStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class manages the attributes of a discovered remote system (device) and provides the capabilities to discover remote systems as part of Project Rome.
 * @remarks
 * This class is instantiated whenever a remote system (device) is discovered, is updated, or disappears (the instance is referenced as a property of the [RemoteSystemAddedEventArgs](remotesystemaddedeventargs.md), [RemoteSystemUpdatedEventArgs](remotesystemupdatedeventargs.md), or [RemoteSystemRemovedEventArgs](remotesystemremovedeventargs.md) class).
 * 
 * The properties of the RemoteSystem class are used to determine the operations that can be done on a given remote system.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a [RemoteSystemWatcher](remotesystemwatcher.md) object that operates in the context of a given User and filters the remote systems it can see. The *user* parameter indicates the User to discover remote systems for. The *filters* parameter determines which remote systems will be seen.
     * @param {User} user_ The specific User for which the RemoteSystemWatcher will discover remote systems.
     * @returns {RemoteSystemWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.createwatcherforuser
     */
    static CreateWatcherForUser(user_) {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics3")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics3.IID)
            RemoteSystem.__IRemoteSystemStatics3 := IRemoteSystemStatics3(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics3.CreateWatcherForUser(user_)
    }

    /**
     * Returns a [RemoteSystemWatcher](remotesystemwatcher.md) object that operates in the context of the specified User. The *user* parameter indicates the User to discover devices for.
     * @param {User} user_ The specific User for which the RemoteSystemWatcher will discover remote systems.
     * @param {IIterable<IRemoteSystemFilter>} filters 
     * @returns {RemoteSystemWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.createwatcherforuser
     */
    static CreateWatcherWithFiltersForUser(user_, filters) {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics3")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics3.IID)
            RemoteSystem.__IRemoteSystemStatics3 := IRemoteSystemStatics3(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics3.CreateWatcherWithFiltersForUser(user_, filters)
    }

    /**
     * Checks whether the client device is authorized to discover other users' devices or just same-user devices.
     * @remarks
     * This authorization is a system-wide setting. The user can view and change it by going to Settings > System > Shared experiences.
     * @param {Integer} kind The [RemoteSystemAuthorizationKind](remotesystemauthorizationkind.md) to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.isauthorizationkindenabled
     */
    static IsAuthorizationKindEnabled(kind) {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics2.IID)
            RemoteSystem.__IRemoteSystemStatics2 := IRemoteSystemStatics2(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics2.IsAuthorizationKindEnabled(kind)
    }

    /**
     * Attempts to discover a single remote system specified by the *HostName* parameter.
     * @remarks
     * > [!IMPORTANT]
     * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you call this method.
     * @param {HostName} hostName_ A wrapper object for the address of a remote system to be discovered. For information on how to instantiate a , see the [HostName constructor](../windows.networking/hostname_hostname_290278668.md).
     * @returns {IAsyncOperation<RemoteSystem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.findbyhostnameasync
     */
    static FindByHostNameAsync(hostName_) {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics.IID)
            RemoteSystem.__IRemoteSystemStatics := IRemoteSystemStatics(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics.FindByHostNameAsync(hostName_)
    }

    /**
     * Returns a [RemoteSystemWatcher](remotesystemwatcher.md) object that filters the remote systems it can see. The *filters* parameter determines which remote systems will be seen.
     * @remarks
     * > [!IMPORTANT]
     * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you call this method.
     * @returns {RemoteSystemWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.createwatcher
     */
    static CreateWatcher() {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics.IID)
            RemoteSystem.__IRemoteSystemStatics := IRemoteSystemStatics(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics.CreateWatcher()
    }

    /**
     * Returns a [RemoteSystemWatcher](remotesystemwatcher.md) object with no filters.
     * @remarks
     * > [!IMPORTANT]
     * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you call this method.
     * @param {IIterable<IRemoteSystemFilter>} filters 
     * @returns {RemoteSystemWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.createwatcher
     */
    static CreateWatcherWithFilters(filters) {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics.IID)
            RemoteSystem.__IRemoteSystemStatics := IRemoteSystemStatics(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics.CreateWatcherWithFilters(filters)
    }

    /**
     * Gets the status of the calling app's access to the Remote Systems feature. This method should always be called before an app attempts to discover or otherwise interact with remote systems.
     * @remarks
     * This method must be called from the UI thread.
     * 
     * Some of the conditions that are tested by calls to this method are: 
     * * The application has added the `remoteSystem` capability.
     * * Remote Systems scenarios are allowed by the [Group Policy](https://www.microsoft.com/download/details.aspx?id=25250) setting (**HKLM\Software\Policies\Microsoft\Windows\System!EnableCdp**). 
     * * Remote Systems scenarios are allowed by the [mobile device management (MDM)](/windows/client-management/mdm/new-in-windows-mdm-enrollment-management) policy setting (**Connectivity/AllowConnectedDevices**).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!RemoteSystem.HasProp("__IRemoteSystemStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatics.IID)
            RemoteSystem.__IRemoteSystemStatics := IRemoteSystemStatics(factoryPtr)
        }

        return RemoteSystem.__IRemoteSystemStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the machine name of the given remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the unique string identifier for the given remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a String representation of the device type of the given remote system.
     * @remarks
     * This property should not be used to make functionality or experience decisions regarding connected devices. Instead, device capabilities should be checked with the [GetCapabilitySupportedAsync](remotesystem_getcapabilitysupportedasync_1130940389.md) method. The **Kind** property is meant to provide developers with information about the types of devices being connected to so that they can display this information in the UI.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.kind
     * @type {HSTRING} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the status of this remote system's availability.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Checks whether the given remote system is available through proximal connection (such as a Bluetooth or local network connection) as opposed to cloud connection.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.isavailablebyproximity
     * @type {Boolean} 
     */
    IsAvailableByProximity {
        get => this.get_IsAvailableByProximity()
    }

    /**
     * Checks whether the given remote system is available through spatially proximal connection.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.isavailablebyspatialproximity
     * @type {Boolean} 
     */
    IsAvailableBySpatialProximity {
        get => this.get_IsAvailableBySpatialProximity()
    }

    /**
     * Gets the manufacturer name of the given remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.manufacturerdisplayname
     * @type {HSTRING} 
     */
    ManufacturerDisplayName {
        get => this.get_ManufacturerDisplayName()
    }

    /**
     * Gets the model name of the given remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.modeldisplayname
     * @type {HSTRING} 
     */
    ModelDisplayName {
        get => this.get_ModelDisplayName()
    }

    /**
     * Gets a value describing the OS platform that this remote system is running.
     * @remarks
     * Applications that integrate Remote Systems APIs across multiple platforms should deliver user experiences tailored to each platform. For example: sending all connected systems a link to an app on the Microsoft Store, versus the Google Play Store or Apple's App Store.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.platform
     * @type {Integer} 
     */
    Platform {
        get => this.get_Platform()
    }

    /**
     * A list of the applications on this remote system that have registered with the Connected Devices Platform.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.apps
     * @type {IVectorView<RemoteSystemApp>} 
     */
    Apps {
        get => this.get_Apps()
    }

    /**
     * Gets the User property.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.user
     * @type {User} 
     */
    User {
        get => this.get_User()
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
    get_DisplayName() {
        if (!this.HasProp("__IRemoteSystem")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem := IRemoteSystem(outPtr)
        }

        return this.__IRemoteSystem.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IRemoteSystem")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem := IRemoteSystem(outPtr)
        }

        return this.__IRemoteSystem.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Kind() {
        if (!this.HasProp("__IRemoteSystem")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem := IRemoteSystem(outPtr)
        }

        return this.__IRemoteSystem.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IRemoteSystem")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem := IRemoteSystem(outPtr)
        }

        return this.__IRemoteSystem.get_Status()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailableByProximity() {
        if (!this.HasProp("__IRemoteSystem")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem := IRemoteSystem(outPtr)
        }

        return this.__IRemoteSystem.get_IsAvailableByProximity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAvailableBySpatialProximity() {
        if (!this.HasProp("__IRemoteSystem2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem2 := IRemoteSystem2(outPtr)
        }

        return this.__IRemoteSystem2.get_IsAvailableBySpatialProximity()
    }

    /**
     * Reports whether the **RemoteSystem** is capable of the given Remote System feature.
     * @param {HSTRING} capabilityName The Remote System capability to check. This should be the value of one of the properties of [KnownRemoteSystemCapabilities](KnownRemoteSystemCapabilities.md).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystem.getcapabilitysupportedasync
     */
    GetCapabilitySupportedAsync(capabilityName) {
        if (!this.HasProp("__IRemoteSystem2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem2 := IRemoteSystem2(outPtr)
        }

        return this.__IRemoteSystem2.GetCapabilitySupportedAsync(capabilityName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ManufacturerDisplayName() {
        if (!this.HasProp("__IRemoteSystem3")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem3 := IRemoteSystem3(outPtr)
        }

        return this.__IRemoteSystem3.get_ManufacturerDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelDisplayName() {
        if (!this.HasProp("__IRemoteSystem3")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem3 := IRemoteSystem3(outPtr)
        }

        return this.__IRemoteSystem3.get_ModelDisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Platform() {
        if (!this.HasProp("__IRemoteSystem4")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem4 := IRemoteSystem4(outPtr)
        }

        return this.__IRemoteSystem4.get_Platform()
    }

    /**
     * 
     * @returns {IVectorView<RemoteSystemApp>} 
     */
    get_Apps() {
        if (!this.HasProp("__IRemoteSystem5")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem5 := IRemoteSystem5(outPtr)
        }

        return this.__IRemoteSystem5.get_Apps()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IRemoteSystem6")) {
            if ((queryResult := this.QueryInterface(IRemoteSystem6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystem6 := IRemoteSystem6(outPtr)
        }

        return this.__IRemoteSystem6.get_User()
    }

;@endregion Instance Methods
}
