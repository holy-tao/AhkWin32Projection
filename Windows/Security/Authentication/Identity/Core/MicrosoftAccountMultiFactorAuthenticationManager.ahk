#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMicrosoftAccountMultiFactorAuthenticationManager.ahk
#Include .\IMicrosoftAccountMultiFactorAuthenticatorStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorAuthenticationManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMicrosoftAccountMultiFactorAuthenticationManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMicrosoftAccountMultiFactorAuthenticationManager.IID

    /**
     * This API is for internal use only and should not be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.current
     * @type {MicrosoftAccountMultiFactorAuthenticationManager} 
     */
    static Current {
        get => MicrosoftAccountMultiFactorAuthenticationManager.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MicrosoftAccountMultiFactorAuthenticationManager} 
     */
    static get_Current() {
        if (!MicrosoftAccountMultiFactorAuthenticationManager.HasProp("__IMicrosoftAccountMultiFactorAuthenticatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorAuthenticationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMicrosoftAccountMultiFactorAuthenticatorStatics.IID)
            MicrosoftAccountMultiFactorAuthenticationManager.__IMicrosoftAccountMultiFactorAuthenticatorStatics := IMicrosoftAccountMultiFactorAuthenticatorStatics(factoryPtr)
        }

        return MicrosoftAccountMultiFactorAuthenticationManager.__IMicrosoftAccountMultiFactorAuthenticatorStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {HSTRING} userAccountId This API is for internal use only and should not be used in your code.
     * @param {Integer} codeLength This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<MicrosoftAccountMultiFactorOneTimeCodedInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.getonetimepasscodeasync
     */
    GetOneTimePassCodeAsync(userAccountId, codeLength) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.GetOneTimePassCodeAsync(userAccountId, codeLength)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {HSTRING} userAccountId This API is for internal use only and should not be used in your code.
     * @param {HSTRING} authenticationToken This API is for internal use only and should not be used in your code.
     * @param {HSTRING} wnsChannelId This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.adddeviceasync
     */
    AddDeviceAsync(userAccountId, authenticationToken, wnsChannelId) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.AddDeviceAsync(userAccountId, authenticationToken, wnsChannelId)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {HSTRING} userAccountId This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.removedeviceasync
     */
    RemoveDeviceAsync(userAccountId) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.RemoveDeviceAsync(userAccountId)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {HSTRING} userAccountId This API is for internal use only and should not be used in your code.
     * @param {HSTRING} channelUri This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.updatewnschannelasync
     */
    UpdateWnsChannelAsync(userAccountId, channelUri) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.UpdateWnsChannelAsync(userAccountId, channelUri)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {IIterable<HSTRING>} userAccountIdList This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<MicrosoftAccountMultiFactorGetSessionsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.getsessionsasync
     */
    GetSessionsAsync(userAccountIdList) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.GetSessionsAsync(userAccountIdList)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {IIterable<HSTRING>} userAccountIdList This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<MicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.getsessionsandunregisteredaccountsasync
     */
    GetSessionsAndUnregisteredAccountsAsync(userAccountIdList) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.GetSessionsAndUnregisteredAccountsAsync(userAccountIdList)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {Integer} sessionAuthentictionStatus This API is for internal use only and should not be used in your code.
     * @param {MicrosoftAccountMultiFactorSessionInfo} authenticationSessionInfo This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.approvesessionasync
     */
    ApproveSessionUsingAuthSessionInfoAsync(sessionAuthentictionStatus, authenticationSessionInfo) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.ApproveSessionUsingAuthSessionInfoAsync(sessionAuthentictionStatus, authenticationSessionInfo)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {Integer} sessionAuthentictionStatus This API is for internal use only and should not be used in your code.
     * @param {HSTRING} userAccountId 
     * @param {HSTRING} sessionId 
     * @param {Integer} sessionAuthenticationType 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.approvesessionasync
     */
    ApproveSessionAsync(sessionAuthentictionStatus, userAccountId, sessionId, sessionAuthenticationType) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.ApproveSessionAsync1(sessionAuthentictionStatus, userAccountId, sessionId, sessionAuthenticationType)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {MicrosoftAccountMultiFactorSessionInfo} authenticationSessionInfo This API is for internal use only and should not be used in your code.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.denysessionasync
     */
    DenySessionUsingAuthSessionInfoAsync(authenticationSessionInfo) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.DenySessionUsingAuthSessionInfoAsync(authenticationSessionInfo)
    }

    /**
     * This API is for internal use only and should not be used in your code.
     * @param {HSTRING} userAccountId 
     * @param {HSTRING} sessionId 
     * @param {Integer} sessionAuthenticationType 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorauthenticationmanager.denysessionasync
     */
    DenySessionAsync(userAccountId, sessionId, sessionAuthenticationType) {
        if (!this.HasProp("__IMicrosoftAccountMultiFactorAuthenticationManager")) {
            if ((queryResult := this.QueryInterface(IMicrosoftAccountMultiFactorAuthenticationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMicrosoftAccountMultiFactorAuthenticationManager := IMicrosoftAccountMultiFactorAuthenticationManager(outPtr)
        }

        return this.__IMicrosoftAccountMultiFactorAuthenticationManager.DenySessionAsync1(userAccountId, sessionId, sessionAuthenticationType)
    }

;@endregion Instance Methods
}
