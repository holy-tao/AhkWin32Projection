#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\MicrosoftAccountMultiFactorOneTimeCodedInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include .\MicrosoftAccountMultiFactorGetSessionsResult.ahk
#Include .\MicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class IMicrosoftAccountMultiFactorAuthenticationManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMicrosoftAccountMultiFactorAuthenticationManager
     * @type {Guid}
     */
    static IID => Guid("{0fd340a5-f574-4320-a08e-0a19a82322aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOneTimePassCodeAsync", "AddDeviceAsync", "RemoveDeviceAsync", "UpdateWnsChannelAsync", "GetSessionsAsync", "GetSessionsAndUnregisteredAccountsAsync", "ApproveSessionUsingAuthSessionInfoAsync", "ApproveSessionAsync1", "DenySessionUsingAuthSessionInfoAsync", "DenySessionAsync1"]

    /**
     * 
     * @param {HSTRING} userAccountId 
     * @param {Integer} codeLength 
     * @returns {IAsyncOperation<MicrosoftAccountMultiFactorOneTimeCodedInfo>} 
     */
    GetOneTimePassCodeAsync(userAccountId, codeLength) {
        if(userAccountId is String) {
            pin := HSTRING.Create(userAccountId)
            userAccountId := pin.Value
        }
        userAccountId := userAccountId is Win32Handle ? NumGet(userAccountId, "ptr") : userAccountId

        result := ComCall(6, this, "ptr", userAccountId, "uint", codeLength, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MicrosoftAccountMultiFactorOneTimeCodedInfo, asyncOperation)
    }

    /**
     * 
     * @param {HSTRING} userAccountId 
     * @param {HSTRING} authenticationToken 
     * @param {HSTRING} wnsChannelId 
     * @returns {IAsyncOperation<Integer>} 
     */
    AddDeviceAsync(userAccountId, authenticationToken, wnsChannelId) {
        if(userAccountId is String) {
            pin := HSTRING.Create(userAccountId)
            userAccountId := pin.Value
        }
        userAccountId := userAccountId is Win32Handle ? NumGet(userAccountId, "ptr") : userAccountId
        if(authenticationToken is String) {
            pin := HSTRING.Create(authenticationToken)
            authenticationToken := pin.Value
        }
        authenticationToken := authenticationToken is Win32Handle ? NumGet(authenticationToken, "ptr") : authenticationToken
        if(wnsChannelId is String) {
            pin := HSTRING.Create(wnsChannelId)
            wnsChannelId := pin.Value
        }
        wnsChannelId := wnsChannelId is Win32Handle ? NumGet(wnsChannelId, "ptr") : wnsChannelId

        result := ComCall(7, this, "ptr", userAccountId, "ptr", authenticationToken, "ptr", wnsChannelId, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @param {HSTRING} userAccountId 
     * @returns {IAsyncOperation<Integer>} 
     */
    RemoveDeviceAsync(userAccountId) {
        if(userAccountId is String) {
            pin := HSTRING.Create(userAccountId)
            userAccountId := pin.Value
        }
        userAccountId := userAccountId is Win32Handle ? NumGet(userAccountId, "ptr") : userAccountId

        result := ComCall(8, this, "ptr", userAccountId, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @param {HSTRING} userAccountId 
     * @param {HSTRING} channelUri 
     * @returns {IAsyncOperation<Integer>} 
     */
    UpdateWnsChannelAsync(userAccountId, channelUri) {
        if(userAccountId is String) {
            pin := HSTRING.Create(userAccountId)
            userAccountId := pin.Value
        }
        userAccountId := userAccountId is Win32Handle ? NumGet(userAccountId, "ptr") : userAccountId
        if(channelUri is String) {
            pin := HSTRING.Create(channelUri)
            channelUri := pin.Value
        }
        channelUri := channelUri is Win32Handle ? NumGet(channelUri, "ptr") : channelUri

        result := ComCall(9, this, "ptr", userAccountId, "ptr", channelUri, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} userAccountIdList 
     * @returns {IAsyncOperation<MicrosoftAccountMultiFactorGetSessionsResult>} 
     */
    GetSessionsAsync(userAccountIdList) {
        result := ComCall(10, this, "ptr", userAccountIdList, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MicrosoftAccountMultiFactorGetSessionsResult, asyncOperation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} userAccountIdList 
     * @returns {IAsyncOperation<MicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo>} 
     */
    GetSessionsAndUnregisteredAccountsAsync(userAccountIdList) {
        result := ComCall(11, this, "ptr", userAccountIdList, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo, asyncOperation)
    }

    /**
     * 
     * @param {Integer} sessionAuthentictionStatus 
     * @param {MicrosoftAccountMultiFactorSessionInfo} authenticationSessionInfo 
     * @returns {IAsyncOperation<Integer>} 
     */
    ApproveSessionUsingAuthSessionInfoAsync(sessionAuthentictionStatus, authenticationSessionInfo) {
        result := ComCall(12, this, "int", sessionAuthentictionStatus, "ptr", authenticationSessionInfo, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @param {Integer} sessionAuthentictionStatus 
     * @param {HSTRING} userAccountId 
     * @param {HSTRING} sessionId 
     * @param {Integer} sessionAuthenticationType 
     * @returns {IAsyncOperation<Integer>} 
     */
    ApproveSessionAsync1(sessionAuthentictionStatus, userAccountId, sessionId, sessionAuthenticationType) {
        if(userAccountId is String) {
            pin := HSTRING.Create(userAccountId)
            userAccountId := pin.Value
        }
        userAccountId := userAccountId is Win32Handle ? NumGet(userAccountId, "ptr") : userAccountId
        if(sessionId is String) {
            pin := HSTRING.Create(sessionId)
            sessionId := pin.Value
        }
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId

        result := ComCall(13, this, "int", sessionAuthentictionStatus, "ptr", userAccountId, "ptr", sessionId, "int", sessionAuthenticationType, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @param {MicrosoftAccountMultiFactorSessionInfo} authenticationSessionInfo 
     * @returns {IAsyncOperation<Integer>} 
     */
    DenySessionUsingAuthSessionInfoAsync(authenticationSessionInfo) {
        result := ComCall(14, this, "ptr", authenticationSessionInfo, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }

    /**
     * 
     * @param {HSTRING} userAccountId 
     * @param {HSTRING} sessionId 
     * @param {Integer} sessionAuthenticationType 
     * @returns {IAsyncOperation<Integer>} 
     */
    DenySessionAsync1(userAccountId, sessionId, sessionAuthenticationType) {
        if(userAccountId is String) {
            pin := HSTRING.Create(userAccountId)
            userAccountId := pin.Value
        }
        userAccountId := userAccountId is Win32Handle ? NumGet(userAccountId, "ptr") : userAccountId
        if(sessionId is String) {
            pin := HSTRING.Create(sessionId)
            sessionId := pin.Value
        }
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId

        result := ComCall(15, this, "ptr", userAccountId, "ptr", sessionId, "int", sessionAuthenticationType, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOperation)
    }
}
