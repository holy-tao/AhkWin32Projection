#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WiFiDirectServiceProvisioningInfo.ahk
#Include .\WiFiDirectServiceSession.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectService
     * @type {Guid}
     */
    static IID => Guid("{50aabbb8-5f71-45ec-84f1-a1e4fc7879a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteServiceInfo", "get_SupportedConfigurationMethods", "get_PreferGroupOwnerMode", "put_PreferGroupOwnerMode", "get_SessionInfo", "put_SessionInfo", "get_ServiceError", "add_SessionDeferred", "remove_SessionDeferred", "GetProvisioningInfoAsync", "ConnectAsync", "ConnectAsyncWithPin"]

    /**
     * @type {IBuffer} 
     */
    RemoteServiceInfo {
        get => this.get_RemoteServiceInfo()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedConfigurationMethods {
        get => this.get_SupportedConfigurationMethods()
    }

    /**
     * @type {Boolean} 
     */
    PreferGroupOwnerMode {
        get => this.get_PreferGroupOwnerMode()
        set => this.put_PreferGroupOwnerMode(value)
    }

    /**
     * @type {IBuffer} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
        set => this.put_SessionInfo(value)
    }

    /**
     * @type {Integer} 
     */
    ServiceError {
        get => this.get_ServiceError()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_RemoteServiceInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedConfigurationMethods() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreferGroupOwnerMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_PreferGroupOwnerMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionInfo() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_SessionInfo(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceError() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectService, WiFiDirectServiceSessionDeferredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionDeferred(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_SessionDeferred(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} selectedConfigurationMethod 
     * @returns {IAsyncOperation<WiFiDirectServiceProvisioningInfo>} 
     */
    GetProvisioningInfoAsync(selectedConfigurationMethod) {
        result := ComCall(15, this, "int", selectedConfigurationMethod, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiDirectServiceProvisioningInfo, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     */
    ConnectAsync() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiDirectServiceSession, result_)
    }

    /**
     * 
     * @param {HSTRING} pin 
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     */
    ConnectAsyncWithPin(pin) {
        if(pin is String) {
            pin := HSTRING.Create(pin)
            pin := pin.Value
        }
        pin := pin is Win32Handle ? NumGet(pin, "ptr") : pin

        result := ComCall(17, this, "ptr", pin, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiDirectServiceSession, result_)
    }
}
