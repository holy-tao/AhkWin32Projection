#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Networking\Connectivity\NetworkAdapter.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\WiFiNetworkReport.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\WiFiConnectionResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiAdapter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiAdapter
     * @type {Guid}
     */
    static IID => Guid("{a6c4e423-3d75-43a4-b9de-11e26b72d9b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkAdapter", "ScanAsync", "get_NetworkReport", "add_AvailableNetworksChanged", "remove_AvailableNetworksChanged", "ConnectAsync", "ConnectWithPasswordCredentialAsync", "ConnectWithPasswordCredentialAndSsidAsync", "Disconnect"]

    /**
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * @type {WiFiNetworkReport} 
     */
    NetworkReport {
        get => this.get_NetworkReport()
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkAdapter(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ScanAsync() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @returns {WiFiNetworkReport} 
     */
    get_NetworkReport() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiNetworkReport(value)
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiAdapter, IInspectable>} args 
     * @returns {EventRegistrationToken} 
     */
    add_AvailableNetworksChanged(args) {
        eventCookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", args, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_AvailableNetworksChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(10, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WiFiAvailableNetwork} availableNetwork 
     * @param {Integer} reconnectionKind 
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     */
    ConnectAsync(availableNetwork, reconnectionKind) {
        result := ComCall(11, this, "ptr", availableNetwork, "int", reconnectionKind, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiConnectionResult, value)
    }

    /**
     * 
     * @param {WiFiAvailableNetwork} availableNetwork 
     * @param {Integer} reconnectionKind 
     * @param {PasswordCredential} passwordCredential_ 
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     */
    ConnectWithPasswordCredentialAsync(availableNetwork, reconnectionKind, passwordCredential_) {
        result := ComCall(12, this, "ptr", availableNetwork, "int", reconnectionKind, "ptr", passwordCredential_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiConnectionResult, value)
    }

    /**
     * 
     * @param {WiFiAvailableNetwork} availableNetwork 
     * @param {Integer} reconnectionKind 
     * @param {PasswordCredential} passwordCredential_ 
     * @param {HSTRING} ssid 
     * @returns {IAsyncOperation<WiFiConnectionResult>} 
     */
    ConnectWithPasswordCredentialAndSsidAsync(availableNetwork, reconnectionKind, passwordCredential_, ssid) {
        if(ssid is String) {
            pin := HSTRING.Create(ssid)
            ssid := pin.Value
        }
        ssid := ssid is Win32Handle ? NumGet(ssid, "ptr") : ssid

        result := ComCall(13, this, "ptr", availableNetwork, "int", reconnectionKind, "ptr", passwordCredential_, "ptr", ssid, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiConnectionResult, value)
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
