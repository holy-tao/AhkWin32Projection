#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedBarcodeScanner extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedBarcodeScanner
     * @type {Guid}
     */
    static IID => Guid("{4a63b49c-8fa4-4332-bb26-945d11d81e0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_IsEnabled", "put_IsDisabledOnDataReceived", "get_IsDisabledOnDataReceived", "put_IsDecodeDataEnabled", "get_IsDecodeDataEnabled", "EnableAsync", "DisableAsync", "RetainDevice", "SetActiveSymbologiesAsync", "ResetStatisticsAsync", "UpdateStatisticsAsync", "SetActiveProfileAsync", "add_DataReceived", "remove_DataReceived", "add_TriggerPressed", "remove_TriggerPressed", "add_TriggerReleased", "remove_TriggerReleased", "add_ReleaseDeviceRequested", "remove_ReleaseDeviceRequested", "add_ImagePreviewReceived", "remove_ImagePreviewReceived", "add_ErrorOccurred", "remove_ErrorOccurred"]

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
     * @returns {IAsyncAction} 
     */
    EnableAsync() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<Integer>} symbologies 
     * @returns {IAsyncAction} 
     */
    SetActiveSymbologiesAsync(symbologies) {
        result := ComCall(15, this, "ptr", symbologies, "ptr*", &result_ := 0, "int")
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
        result := ComCall(16, this, "ptr", statisticsCategories, "ptr*", &result_ := 0, "int")
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
        result := ComCall(17, this, "ptr", statistics, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {HSTRING} profile_ 
     * @returns {IAsyncAction} 
     */
    SetActiveProfileAsync(profile_) {
        if(profile_ is String) {
            pin := HSTRING.Create(profile_)
            profile_ := pin.Value
        }
        profile_ := profile_ is Win32Handle ? NumGet(profile_, "ptr") : profile_

        result := ComCall(18, this, "ptr", profile_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_DataReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ClaimedBarcodeScanner>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TriggerPressed(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
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
    remove_TriggerPressed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ClaimedBarcodeScanner>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TriggerReleased(handler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", token, "int")
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
    remove_TriggerReleased(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<ClaimedBarcodeScanner>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerImagePreviewReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImagePreviewReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(27, this, "ptr", handler, "ptr", token, "int")
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
    remove_ImagePreviewReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedBarcodeScanner, BarcodeScannerErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
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
    remove_ErrorOccurred(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
