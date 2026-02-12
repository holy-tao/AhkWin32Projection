#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorunregisteredaccountsandsessioninfo
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorunregisteredaccountsandsessioninfo.sessions
     * @type {IVectorView<MicrosoftAccountMultiFactorSessionInfo>} 
     */
    Sessions {
        get => this.get_Sessions()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorunregisteredaccountsandsessioninfo.unregisteredaccounts
     * @type {IVectorView<HSTRING>} 
     */
    UnregisteredAccounts {
        get => this.get_UnregisteredAccounts()
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorunregisteredaccountsandsessioninfo.serviceresponse
     * @type {Integer} 
     */
    ServiceResponse {
        get => this.get_ServiceResponse()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MicrosoftAccountMultiFactorSessionInfo>} 
     */
    get_Sessions() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo := IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.get_Sessions()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_UnregisteredAccounts() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo := IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.get_UnregisteredAccounts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceResponse() {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo := IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.get_ServiceResponse()
    }

;@endregion Instance Methods
}
