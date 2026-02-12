#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceTriggerDetails.ahk
#Include .\IAppServiceTriggerDetails2.ahk
#Include .\IAppServiceTriggerDetails3.ahk
#Include .\IAppServiceTriggerDetails4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents details associated with the background task for the app service. App services enable app-to-app communication by allowing you to provide services from your Universal Windows app to other Universal Windows app.
 * @remarks
 * To get the AppServiceTriggerDetails for an app service, use the [IBackgroundTaskInstance.TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the app service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the name of the package family for the client app that called the background task for the app service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Gets the connection to the endpoint of the other app service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.appserviceconnection
     * @type {AppServiceConnection} 
     */
    AppServiceConnection {
        get => this.get_AppServiceConnection()
    }

    /**
     * Gets whether the client app that called the background task for the app service is on another device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.isremotesystemconnection
     * @type {Boolean} 
     */
    IsRemoteSystemConnection {
        get => this.get_IsRemoteSystemConnection()
    }

    /**
     * A string token which can be used to connect back to caller of a remote app service via RemoteSystemConnectionRequest.CreateFromConnectionToken.
     * @remarks
     * This property is only available for remote app service connections.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.callerremoteconnectiontoken
     * @type {HSTRING} 
     */
    CallerRemoteConnectionToken {
        get => this.get_CallerRemoteConnectionToken()
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
        if (!this.HasProp("__IAppServiceTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IAppServiceTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceTriggerDetails := IAppServiceTriggerDetails(outPtr)
        }

        return this.__IAppServiceTriggerDetails.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerPackageFamilyName() {
        if (!this.HasProp("__IAppServiceTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IAppServiceTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceTriggerDetails := IAppServiceTriggerDetails(outPtr)
        }

        return this.__IAppServiceTriggerDetails.get_CallerPackageFamilyName()
    }

    /**
     * 
     * @returns {AppServiceConnection} 
     */
    get_AppServiceConnection() {
        if (!this.HasProp("__IAppServiceTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IAppServiceTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceTriggerDetails := IAppServiceTriggerDetails(outPtr)
        }

        return this.__IAppServiceTriggerDetails.get_AppServiceConnection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemoteSystemConnection() {
        if (!this.HasProp("__IAppServiceTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IAppServiceTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceTriggerDetails2 := IAppServiceTriggerDetails2(outPtr)
        }

        return this.__IAppServiceTriggerDetails2.get_IsRemoteSystemConnection()
    }

    /**
     * Determines whether the caller of the app service has the specified capability.
     * @remarks
     * This API can only be called from within an app that is marked as an app service in its manifest.
     * One use of this function is to determine whether a caller has the specified capability and, based on that, decide whether to share the requested data, a subset of the data, or no data.
     * @param {HSTRING} capabilityName The name of the capability.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.checkcallerforcapabilityasync
     */
    CheckCallerForCapabilityAsync(capabilityName) {
        if (!this.HasProp("__IAppServiceTriggerDetails3")) {
            if ((queryResult := this.QueryInterface(IAppServiceTriggerDetails3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceTriggerDetails3 := IAppServiceTriggerDetails3(outPtr)
        }

        return this.__IAppServiceTriggerDetails3.CheckCallerForCapabilityAsync(capabilityName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerRemoteConnectionToken() {
        if (!this.HasProp("__IAppServiceTriggerDetails4")) {
            if ((queryResult := this.QueryInterface(IAppServiceTriggerDetails4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceTriggerDetails4 := IAppServiceTriggerDetails4(outPtr)
        }

        return this.__IAppServiceTriggerDetails4.get_CallerRemoteConnectionToken()
    }

;@endregion Instance Methods
}
