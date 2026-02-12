#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ConnectionProfile.ahk
#Include .\LanIdentifier.ahk
#Include ..\HostName.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ProxyConfiguration.ahk
#Include ..\EndpointPair.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{5074f851-950d-4165-9c15-365619481eea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionProfiles", "GetInternetConnectionProfile", "GetLanIdentifiers", "GetHostNames", "GetProxyConfigurationAsync", "GetSortedEndpointPairs", "add_NetworkStatusChanged", "remove_NetworkStatusChanged"]

    /**
     * 
     * @returns {IVectorView<ConnectionProfile>} 
     */
    GetConnectionProfiles() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ConnectionProfile, value)
    }

    /**
     * 
     * @returns {ConnectionProfile} 
     */
    GetInternetConnectionProfile() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectionProfile(value)
    }

    /**
     * 
     * @returns {IVectorView<LanIdentifier>} 
     */
    GetLanIdentifiers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(LanIdentifier, value)
    }

    /**
     * 
     * @returns {IVectorView<HostName>} 
     */
    GetHostNames() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HostName, value)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<ProxyConfiguration>} 
     */
    GetProxyConfigurationAsync(uri_) {
        result := ComCall(10, this, "ptr", uri_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProxyConfiguration, value)
    }

    /**
     * 
     * @param {IIterable<EndpointPair>} destinationList_ 
     * @param {Integer} sortOptions 
     * @returns {IVectorView<EndpointPair>} 
     */
    GetSortedEndpointPairs(destinationList_, sortOptions) {
        result := ComCall(11, this, "ptr", destinationList_, "uint", sortOptions, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(EndpointPair, value)
    }

    /**
     * 
     * @param {NetworkStatusChangedEventHandler} networkStatusHandler 
     * @returns {EventRegistrationToken} 
     */
    add_NetworkStatusChanged(networkStatusHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(12, this, "ptr", networkStatusHandler, "ptr", eventCookie, "int")
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
    remove_NetworkStatusChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(13, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
