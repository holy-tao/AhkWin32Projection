#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceConnection.ahk
#Include .\IAppServiceConnection2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAppServiceConnectionStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppServiceConnection.ahk
#Include .\AppServiceRequestReceivedEventArgs.ahk
#Include .\AppServiceClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection to the endpoint for an app service. App services enable app-to-app communication by allowing you to provide services from your Universal Windows app to other Universal Windows app. The AppService provider receives the connection request as part of their background task; see [AppServiceTriggerDetails class](/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails) for details.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceConnection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Opens an app service connection, sends a single message, waits for a single response, and then closes the connection.
     * @remarks
     * This API can optimize latency for remote app service scenarios which do not require state to be built up over several SendMessageAsync operations.
     * @param {AppServiceConnection} connection_ The app service to connect to.
     * @param {RemoteSystemConnectionRequest} connectionRequest Specifies the connection preferences for the AppServiceConnection, such as transport preferences (cloud/proximal/any) as well as the target System.RemoteSystems object.
     * @param {ValueSet} message The message that you want to send.
     * @returns {IAsyncOperation<StatelessAppServiceResponse>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.sendstatelessmessageasync
     */
    static SendStatelessMessageAsync(connection_, connectionRequest, message) {
        if (!AppServiceConnection.HasProp("__IAppServiceConnectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppService.AppServiceConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppServiceConnectionStatics.IID)
            AppServiceConnection.__IAppServiceConnectionStatics := IAppServiceConnectionStatics(factoryPtr)
        }

        return AppServiceConnection.__IAppServiceConnectionStatics.SendStatelessMessageAsync(connection_, connectionRequest, message)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name of the app service to which you want to connect.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.appservicename
     * @type {HSTRING} 
     */
    AppServiceName {
        get => this.get_AppServiceName()
        set => this.put_AppServiceName(value)
    }

    /**
     * Gets or sets the package family name for the package that contains the endpoint for the app service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
        set => this.put_PackageFamilyName(value)
    }

    /**
     * Gets/sets the user context. This property returns **null** if the caller did not specify a user.
     * @remarks
     * This property is set by the caller. Callers that have the multi-user manifest entry must set this property even if the app is not running on a multi-user platform.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.user
     * @type {User} 
     */
    User {
        get => this.get_User()
        set => this.put_User(value)
    }

    /**
     * Occurs when a message arrives from the other endpoint of the app service connection.
     * @type {TypedEventHandler<AppServiceConnection, AppServiceRequestReceivedEventArgs>}
    */
    OnRequestReceived {
        get {
            if(!this.HasProp("__OnRequestReceived")){
                this.__OnRequestReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{18c67d61-4176-5553-b18d-d8f57fe79552}"),
                    AppServiceConnection,
                    AppServiceRequestReceivedEventArgs
                )
                this.__OnRequestReceivedToken := this.add_RequestReceived(this.__OnRequestReceived.iface)
            }
            return this.__OnRequestReceived
        }
    }

    /**
     * Occurs when the other endpoint closes the connection to the app service.
     * @type {TypedEventHandler<AppServiceConnection, AppServiceClosedEventArgs>}
    */
    OnServiceClosed {
        get {
            if(!this.HasProp("__OnServiceClosed")){
                this.__OnServiceClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e4efa98d-4bfc-5e61-a233-688f5f06521f}"),
                    AppServiceConnection,
                    AppServiceClosedEventArgs
                )
                this.__OnServiceClosedToken := this.add_ServiceClosed(this.__OnServiceClosed.iface)
            }
            return this.__OnServiceClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [AppServiceConnection](appserviceconnection.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppService.AppServiceConnection")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRequestReceivedToken")) {
            this.remove_RequestReceived(this.__OnRequestReceivedToken)
            this.__OnRequestReceived.iface.Dispose()
        }

        if(this.HasProp("__OnServiceClosedToken")) {
            this.remove_ServiceClosed(this.__OnServiceClosedToken)
            this.__OnServiceClosed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppServiceName() {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.get_AppServiceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AppServiceName(value) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.put_AppServiceName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.get_PackageFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PackageFamilyName(value) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.put_PackageFamilyName(value)
    }

    /**
     * Opens a connection to the endpoint for the app service.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.openasync
     */
    OpenAsync() {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.OpenAsync()
    }

    /**
     * Sends a message to the other endpoint of the app service connection.
     * @remarks
     * Message delivery is not  guaranteed. The [AppServiceResponseStatus](appserviceresponsestatus.md) tells you whether delivery succeeded or not.
     * 
     * When multiple messages are sent, [RequestReceived](appserviceconnection_requestreceived.md) is not guaranteed to fire in the same order that the messages were sent. This method is asynchronous, meaning that it will return whenever the work that needs to be done is complete. No ordering is enforced.
     * @param {ValueSet} message The message that you want to send.
     * @returns {IAsyncOperation<AppServiceResponse>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.sendmessageasync
     */
    SendMessageAsync(message) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.SendMessageAsync(message)
    }

    /**
     * 
     * @param {TypedEventHandler<AppServiceConnection, AppServiceRequestReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RequestReceived(handler) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.add_RequestReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RequestReceived(token) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.remove_RequestReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppServiceConnection, AppServiceClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServiceClosed(handler) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.add_ServiceClosed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ServiceClosed(token) {
        if (!this.HasProp("__IAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection := IAppServiceConnection(outPtr)
        }

        return this.__IAppServiceConnection.remove_ServiceClosed(token)
    }

    /**
     * Opens a connection to the endpoint on another device for the app service.
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ Specifies the connection preferences for the [AppServiceConnection](appserviceconnection.md), such as transport preferences (cloud/proximal/any) as well as the target [System.RemoteSystems](../windows.system.remotesystems/windows_system_remotesystems.md) object.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.openremoteasync
     */
    OpenRemoteAsync(remoteSystemConnectionRequest_) {
        if (!this.HasProp("__IAppServiceConnection2")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection2 := IAppServiceConnection2(outPtr)
        }

        return this.__IAppServiceConnection2.OpenRemoteAsync(remoteSystemConnectionRequest_)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAppServiceConnection2")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection2 := IAppServiceConnection2(outPtr)
        }

        return this.__IAppServiceConnection2.get_User()
    }

    /**
     * 
     * @param {User} value 
     * @returns {HRESULT} 
     */
    put_User(value) {
        if (!this.HasProp("__IAppServiceConnection2")) {
            if ((queryResult := this.QueryInterface(IAppServiceConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceConnection2 := IAppServiceConnection2(outPtr)
        }

        return this.__IAppServiceConnection2.put_User(value)
    }

    /**
     * Closes the connection to the app service.
     * @remarks
     * **C++/WinRT** : You don't *need* to call **Close** from C++/WinRT because the object will be closed and destructed naturally when all references are released. But you might choose to call **Close** if you want to stop the app service regardless of outstanding references to the app service connection. After calling **Close** in a situation like that, we recommend that you consider the object to be invalid, and not to use it further. Specifically, consider that the **AppServiceConnection** object isn't reusable nor re-openable after **Close** is called. Also see [Do I need to call IClosable::Close on runtime classes that I consume?](/windows/uwp/cpp-and-winrt-apis/faq#do-i-need-to-call-iclosableclose-on-runtime-classes-that-i-consume).
     * 
     * **C++/CX** : You can't call [Close](../windows.foundation/iclosable_close_811482585.md) methods through Visual C++ component extensions (C++/CX) on Windows Runtime class instances where the class implements [IClosable](../windows.foundation/iclosable.md). Instead, Visual C++ component extensions (C++/CX) code for runtime classes should call the destructor, or set the last reference to **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnection.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
