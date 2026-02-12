#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdServiceTicket.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the ticket that is obtained after the user authenticates to this app or has provided consent to access user data stored in Live.
  * 
  * > [!NOTE]
  * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * To get an instance of this object, use the [UserIdentity.Tickets](useridentity_tickets.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticket
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdServiceTicket extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlineIdServiceTicket

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlineIdServiceTicket.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The ticket.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticket.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Represents the [OnlineIdServiceTicketRequest](onlineidserviceticketrequest.md) for which the ticket was obtained.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticket.request
     * @type {OnlineIdServiceTicketRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * If there was an error in obtaining the ticket, then the error code is captured here.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidserviceticket.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
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
    get_Value() {
        if (!this.HasProp("__IOnlineIdServiceTicket")) {
            if ((queryResult := this.QueryInterface(IOnlineIdServiceTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdServiceTicket := IOnlineIdServiceTicket(outPtr)
        }

        return this.__IOnlineIdServiceTicket.get_Value()
    }

    /**
     * 
     * @returns {OnlineIdServiceTicketRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IOnlineIdServiceTicket")) {
            if ((queryResult := this.QueryInterface(IOnlineIdServiceTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdServiceTicket := IOnlineIdServiceTicket(outPtr)
        }

        return this.__IOnlineIdServiceTicket.get_Request()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IOnlineIdServiceTicket")) {
            if ((queryResult := this.QueryInterface(IOnlineIdServiceTicket.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdServiceTicket := IOnlineIdServiceTicket(outPtr)
        }

        return this.__IOnlineIdServiceTicket.get_ErrorCode()
    }

;@endregion Instance Methods
}
