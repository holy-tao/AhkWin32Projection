#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdServiceTicketRequest.ahk
#Include .\IOnlineIdServiceTicketRequestFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the ability for an app to specify the service and policy that is used to authenticate a Live user to obtain identity properties and tickets.
  * 
  * > [!NOTE]
  * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticketrequest
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdServiceTicketRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlineIdServiceTicketRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlineIdServiceTicketRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the OnlineIdServiceTicketRequest class.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @param {HSTRING} service The service for the request.
     * @param {HSTRING} policy The policy for the request.
     * @returns {OnlineIdServiceTicketRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticketrequest.#ctor
     */
    static CreateOnlineIdServiceTicketRequest(service, policy) {
        if (!OnlineIdServiceTicketRequest.HasProp("__IOnlineIdServiceTicketRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.OnlineId.OnlineIdServiceTicketRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOnlineIdServiceTicketRequestFactory.IID)
            OnlineIdServiceTicketRequest.__IOnlineIdServiceTicketRequestFactory := IOnlineIdServiceTicketRequestFactory(factoryPtr)
        }

        return OnlineIdServiceTicketRequest.__IOnlineIdServiceTicketRequestFactory.CreateOnlineIdServiceTicketRequest(service, policy)
    }

    /**
     * Creates an instance of the OnlineIdServiceTicketRequest class.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @param {HSTRING} service The service for the request.
     * @returns {OnlineIdServiceTicketRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticketrequest.#ctor
     */
    static CreateOnlineIdServiceTicketRequestAdvanced(service) {
        if (!OnlineIdServiceTicketRequest.HasProp("__IOnlineIdServiceTicketRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.OnlineId.OnlineIdServiceTicketRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOnlineIdServiceTicketRequestFactory.IID)
            OnlineIdServiceTicketRequest.__IOnlineIdServiceTicketRequestFactory := IOnlineIdServiceTicketRequestFactory(factoryPtr)
        }

        return OnlineIdServiceTicketRequest.__IOnlineIdServiceTicketRequestFactory.CreateOnlineIdServiceTicketRequestAdvanced(service)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Identifies the service your app uses. The service name must match the DNS name you supplied when registering your app on [http://go.microsoft.com/fwlink/p/?linkid=241860](https://account.live.com/developers/applications/index). Tickets are issued only for this service. For apps that are requesting user consent to access stored in Live, you must pass the offers to which your app needs access. The available list of offers can be found at our [Scopes and Permissions](/office/) page. The ticket can then be used with the Live Connect REST apis to access data that a user has consented to give to the app. Check out our [REST APIs](/office/) topic to learn more. Alternatively, the app can use the Live Connect SDK which will make these calls itself.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticketrequest.service
     * @type {HSTRING} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * The policy used to authenticate users. Supported values are JWT, which returns data using the JSON format. For apps that are requesting user consent to access stored in Live, app developer must pass a policy of DELEGATION.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticketrequest.policy
     * @type {HSTRING} 
     */
    Policy {
        get => this.get_Policy()
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
    get_Service() {
        if (!this.HasProp("__IOnlineIdServiceTicketRequest")) {
            if ((queryResult := this.QueryInterface(IOnlineIdServiceTicketRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdServiceTicketRequest := IOnlineIdServiceTicketRequest(outPtr)
        }

        return this.__IOnlineIdServiceTicketRequest.get_Service()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Policy() {
        if (!this.HasProp("__IOnlineIdServiceTicketRequest")) {
            if ((queryResult := this.QueryInterface(IOnlineIdServiceTicketRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdServiceTicketRequest := IOnlineIdServiceTicketRequest(outPtr)
        }

        return this.__IOnlineIdServiceTicketRequest.get_Policy()
    }

;@endregion Instance Methods
}
