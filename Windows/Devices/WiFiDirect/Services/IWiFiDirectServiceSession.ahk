#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Networking\EndpointPair.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceSession
     * @type {Guid}
     */
    static IID => Guid("{81142163-e426-47cb-8640-e1b3588bf26f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceName", "get_Status", "get_ErrorStatus", "get_SessionId", "get_AdvertisementId", "get_ServiceAddress", "get_SessionAddress", "GetConnectionEndpointPairs", "add_SessionStatusChanged", "remove_SessionStatusChanged", "AddStreamSocketListenerAsync", "AddDatagramSocketAsync", "add_RemotePortAdded", "remove_RemotePortAdded"]

    /**
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    ErrorStatus {
        get => this.get_ErrorStatus()
    }

    /**
     * @type {Integer} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {Integer} 
     */
    AdvertisementId {
        get => this.get_AdvertisementId()
    }

    /**
     * @type {HSTRING} 
     */
    ServiceAddress {
        get => this.get_ServiceAddress()
    }

    /**
     * @type {HSTRING} 
     */
    SessionAddress {
        get => this.get_SessionAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorStatus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionId() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementId() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceAddress() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionAddress() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<EndpointPair>} 
     */
    GetConnectionEndpointPairs() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(EndpointPair, value)
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_SessionStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {StreamSocketListener} value 
     * @returns {IAsyncAction} 
     */
    AddStreamSocketListenerAsync(value) {
        result := ComCall(16, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {DatagramSocket} value 
     * @returns {IAsyncAction} 
     */
    AddDatagramSocketAsync(value) {
        result := ComCall(17, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceSession, WiFiDirectServiceRemotePortAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemotePortAdded(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_RemotePortAdded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
