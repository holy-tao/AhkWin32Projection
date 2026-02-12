#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedMagneticStripeReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedMagneticStripeReader
     * @type {Guid}
     */
    static IID => Guid("{475ca8f3-9417-48bc-b9d7-4163a7844c02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_IsEnabled", "put_IsDisabledOnDataReceived", "get_IsDisabledOnDataReceived", "put_IsDecodeDataEnabled", "get_IsDecodeDataEnabled", "get_IsDeviceAuthenticated", "put_DataEncryptionAlgorithm", "get_DataEncryptionAlgorithm", "put_TracksToRead", "get_TracksToRead", "put_IsTransmitSentinelsEnabled", "get_IsTransmitSentinelsEnabled", "EnableAsync", "DisableAsync", "RetainDevice", "SetErrorReportingType", "RetrieveDeviceAuthenticationDataAsync", "AuthenticateDeviceAsync", "DeAuthenticateDeviceAsync", "UpdateKeyAsync", "ResetStatisticsAsync", "UpdateStatisticsAsync", "add_BankCardDataReceived", "remove_BankCardDataReceived", "add_AamvaCardDataReceived", "remove_AamvaCardDataReceived", "add_VendorSpecificDataReceived", "remove_VendorSpecificDataReceived", "add_ReleaseDeviceRequested", "remove_ReleaseDeviceRequested", "add_ErrorOccurred", "remove_ErrorOccurred"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsDisabledOnDataReceived {
        get => this.get_IsDisabledOnDataReceived()
        set => this.put_IsDisabledOnDataReceived(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDecodeDataEnabled {
        get => this.get_IsDecodeDataEnabled()
        set => this.put_IsDecodeDataEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDeviceAuthenticated {
        get => this.get_IsDeviceAuthenticated()
    }

    /**
     * @type {Integer} 
     */
    DataEncryptionAlgorithm {
        get => this.get_DataEncryptionAlgorithm()
        set => this.put_DataEncryptionAlgorithm(value)
    }

    /**
     * @type {Integer} 
     */
    TracksToRead {
        get => this.get_TracksToRead()
        set => this.put_TracksToRead(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTransmitSentinelsEnabled {
        get => this.get_IsTransmitSentinelsEnabled()
        set => this.put_IsTransmitSentinelsEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDisabledOnDataReceived(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledOnDataReceived() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDecodeDataEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDecodeDataEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeviceAuthenticated() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataEncryptionAlgorithm(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataEncryptionAlgorithm() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TracksToRead(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TracksToRead() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTransmitSentinelsEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransmitSentinelsEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    EnableAsync() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DisableAsync() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RetainDevice() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetErrorReportingType(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    RetrieveDeviceAuthenticationDataAsync() {
        result := ComCall(23, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }

    /**
     * 
     * @param {Integer} responseToken_length 
     * @param {Pointer<Integer>} responseToken 
     * @returns {IAsyncAction} 
     */
    AuthenticateDeviceAsync(responseToken_length, responseToken) {
        responseTokenMarshal := responseToken is VarRef ? "char*" : "ptr"

        result := ComCall(24, this, "uint", responseToken_length, responseTokenMarshal, responseToken, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {Integer} responseToken_length 
     * @param {Pointer<Integer>} responseToken 
     * @returns {IAsyncAction} 
     */
    DeAuthenticateDeviceAsync(responseToken_length, responseToken) {
        responseTokenMarshal := responseToken is VarRef ? "char*" : "ptr"

        result := ComCall(25, this, "uint", responseToken_length, responseTokenMarshal, responseToken, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {HSTRING} keyName 
     * @returns {IAsyncAction} 
     */
    UpdateKeyAsync(key, keyName) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key
        if(keyName is String) {
            pin := HSTRING.Create(keyName)
            keyName := pin.Value
        }
        keyName := keyName is Win32Handle ? NumGet(keyName, "ptr") : keyName

        result := ComCall(26, this, "ptr", key, "ptr", keyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} statisticsCategories 
     * @returns {IAsyncAction} 
     */
    ResetStatisticsAsync(statisticsCategories) {
        result := ComCall(27, this, "ptr", statisticsCategories, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} statistics 
     * @returns {IAsyncAction} 
     */
    UpdateStatisticsAsync(statistics) {
        result := ComCall(28, this, "ptr", statistics, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderBankCardDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BankCardDataReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BankCardDataReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderAamvaCardDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AamvaCardDataReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AamvaCardDataReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderVendorSpecificCardDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VendorSpecificDataReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VendorSpecificDataReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ClaimedMagneticStripeReader>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReleaseDeviceRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedMagneticStripeReader, MagneticStripeReaderErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorOccurred(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
