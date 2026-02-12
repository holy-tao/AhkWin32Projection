#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMicrosoftAccountMultiFactorSessionInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorSessionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMicrosoftAccountMultiFactorSessionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMicrosoftAccountMultiFactorSessionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.useraccountid
     * @type {HSTRING} 
     */
    UserAccountId {
        get => this.get_UserAccountId()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.sessionid
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.displaysessionid
     * @type {HSTRING} 
     */
    DisplaySessionId {
        get => this.get_DisplaySessionId()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.approvalstatus
     * @type {Integer} 
     */
    ApprovalStatus {
        get => this.get_ApprovalStatus()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.authenticationtype
     * @type {Integer} 
     */
    AuthenticationType {
        get => this.get_AuthenticationType()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.requesttime
     * @type {DateTime} 
     */
    RequestTime {
        get => this.get_RequestTime()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessioninfo.expirationtime
     * @type {DateTime} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
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
    get_UserAccountId() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_UserAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_SessionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplaySessionId() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_DisplaySessionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ApprovalStatus() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_ApprovalStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationType() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_AuthenticationType()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_RequestTime() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_RequestTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorSessionInfo := IMicrosoftAccountMultiFactorSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorSessionInfo.get_ExpirationTime()
    }

;@endregion Instance Methods
}
