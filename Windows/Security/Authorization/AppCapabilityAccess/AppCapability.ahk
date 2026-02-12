#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCapability.ahk
#Include .\IAppCapability2.ahk
#Include .\IAppCapabilityStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AppCapability.ahk
#Include .\AppCapabilityAccessChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Creates an AppCapability object for the app's user and the current process.
 * @remarks
 * Created through the static methods Create and CreateWithProcessIdForUser. 
 * 
 * > Note: Create is callable only by SUA apps.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability
 * @namespace Windows.Security.Authorization.AppCapabilityAccess
 * @version WindowsRuntime 1.4
 */
class AppCapability extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCapability

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCapability.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Requests access to multiple capabilities simultaneously.
     * @remarks
     * RequestAccessForCapabilitiesAsync does not create any new objects and can cause a user prompt to appear.
     * > Note: Must be called from the UI thread.
     * @param {IIterable<HSTRING>} capabilityNames The capability name strings.
     * @returns {IAsyncOperation<IMapView<HSTRING, Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.requestaccessforcapabilitiesasync
     */
    static RequestAccessForCapabilitiesAsync(capabilityNames) {
        if (!AppCapability.HasProp("__IAppCapabilityStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authorization.AppCapabilityAccess.AppCapability")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCapabilityStatics.IID)
            AppCapability.__IAppCapabilityStatics := IAppCapabilityStatics(factoryPtr)
        }

        return AppCapability.__IAppCapabilityStatics.RequestAccessForCapabilitiesAsync(capabilityNames)
    }

    /**
     * Requests access to multiple capabilities simultaneously.
     * @remarks
     * RequestAccessForCapabilitiesForUserAsync does not create any new objects and can cause a user prompt to appear.
     * 
     * > Note: Must be called from the UI thread.
     * @param {User} user_ The user property for which the object was created.
     * @param {IIterable<HSTRING>} capabilityNames The capability name strings.
     * @returns {IAsyncOperation<IMapView<HSTRING, Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.requestaccessforcapabilitiesforuserasync
     */
    static RequestAccessForCapabilitiesForUserAsync(user_, capabilityNames) {
        if (!AppCapability.HasProp("__IAppCapabilityStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authorization.AppCapabilityAccess.AppCapability")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCapabilityStatics.IID)
            AppCapability.__IAppCapabilityStatics := IAppCapabilityStatics(factoryPtr)
        }

        return AppCapability.__IAppCapabilityStatics.RequestAccessForCapabilitiesForUserAsync(user_, capabilityNames)
    }

    /**
     * Creates an AppCapability object.
     * @param {HSTRING} capabilityName The string property of CapabilityName.
     * @returns {AppCapability} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.create
     */
    static Create(capabilityName) {
        if (!AppCapability.HasProp("__IAppCapabilityStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authorization.AppCapabilityAccess.AppCapability")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCapabilityStatics.IID)
            AppCapability.__IAppCapabilityStatics := IAppCapabilityStatics(factoryPtr)
        }

        return AppCapability.__IAppCapabilityStatics.Create(capabilityName)
    }

    /**
     * Creates an AppCapability object for the specified process and user.
     * @param {User} user_ The user property for which the object was created.
     * @param {HSTRING} capabilityName The string property of CapabilityName.
     * @param {Integer} pid The Process ID.
     * @returns {AppCapability} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.createwithprocessidforuser
     */
    static CreateWithProcessIdForUser(user_, capabilityName, pid) {
        if (!AppCapability.HasProp("__IAppCapabilityStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authorization.AppCapabilityAccess.AppCapability")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppCapabilityStatics.IID)
            AppCapability.__IAppCapabilityStatics := IAppCapabilityStatics(factoryPtr)
        }

        return AppCapability.__IAppCapabilityStatics.CreateWithProcessIdForUser(user_, capabilityName, pid)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Accesses the stored capability.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.capabilityname
     * @type {HSTRING} 
     */
    CapabilityName {
        get => this.get_CapabilityName()
    }

    /**
     * The user under which the AppCapability is created.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * The purpose of why the capability is being accessed.
     * @remarks
     * The display message, if specified, appears in the system tray and Windows Settings under **Privacy & security > App permissions** pages while the capability is in use. Display messages should be provided before the capability is accessed and should continue to be provided until the app terminates access to the capability.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.displaymessage
     * @type {HSTRING} 
     */
    DisplayMessage {
        get => this.get_DisplayMessage()
        set => this.put_DisplayMessage(value)
    }

    /**
     * Raised when there is a change to access status.
     * @remarks
     * This event is guaranteed to be invoked when access status changes for the indicated capability on the system, but only if the app is not suspended. This event has no payload, as the application cannot rely on this potentially delayed information and must return to their held AppCapability object to determine the current access status.
     * @type {TypedEventHandler<AppCapability, AppCapabilityAccessChangedEventArgs>}
    */
    OnAccessChanged {
        get {
            if(!this.HasProp("__OnAccessChanged")){
                this.__OnAccessChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6d923c95-7b83-5f59-8883-f44175284898}"),
                    AppCapability,
                    AppCapabilityAccessChangedEventArgs
                )
                this.__OnAccessChangedToken := this.add_AccessChanged(this.__OnAccessChanged.iface)
            }
            return this.__OnAccessChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAccessChangedToken")) {
            this.remove_AccessChanged(this.__OnAccessChangedToken)
            this.__OnAccessChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CapabilityName() {
        if (!this.HasProp("__IAppCapability")) {
            if ((queryResult := this.QueryInterface(IAppCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability := IAppCapability(outPtr)
        }

        return this.__IAppCapability.get_CapabilityName()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAppCapability")) {
            if ((queryResult := this.QueryInterface(IAppCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability := IAppCapability(outPtr)
        }

        return this.__IAppCapability.get_User()
    }

    /**
     * Requests access for the object's stored capability and user.
     * @remarks
     * Must be called from the UI thread.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IAppCapability")) {
            if ((queryResult := this.QueryInterface(IAppCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability := IAppCapability(outPtr)
        }

        return this.__IAppCapability.RequestAccessAsync()
    }

    /**
     * Checks access for the object's stored capability and user.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapability.checkaccess
     */
    CheckAccess() {
        if (!this.HasProp("__IAppCapability")) {
            if ((queryResult := this.QueryInterface(IAppCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability := IAppCapability(outPtr)
        }

        return this.__IAppCapability.CheckAccess()
    }

    /**
     * 
     * @param {TypedEventHandler<AppCapability, AppCapabilityAccessChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessChanged(handler) {
        if (!this.HasProp("__IAppCapability")) {
            if ((queryResult := this.QueryInterface(IAppCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability := IAppCapability(outPtr)
        }

        return this.__IAppCapability.add_AccessChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccessChanged(token) {
        if (!this.HasProp("__IAppCapability")) {
            if ((queryResult := this.QueryInterface(IAppCapability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability := IAppCapability(outPtr)
        }

        return this.__IAppCapability.remove_AccessChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMessage() {
        if (!this.HasProp("__IAppCapability2")) {
            if ((queryResult := this.QueryInterface(IAppCapability2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability2 := IAppCapability2(outPtr)
        }

        return this.__IAppCapability2.get_DisplayMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMessage(value) {
        if (!this.HasProp("__IAppCapability2")) {
            if ((queryResult := this.QueryInterface(IAppCapability2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCapability2 := IAppCapability2(outPtr)
        }

        return this.__IAppCapability2.put_DisplayMessage(value)
    }

;@endregion Instance Methods
}
