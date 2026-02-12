#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WiFiOnDemandHotspotNetwork.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\WiFiOnDemandHotspotConnectionResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiOnDemandHotspotConnectTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiOnDemandHotspotConnectTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{a268eb58-68f5-59cf-8d38-35bf44b097ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestedNetwork", "ReportError", "ConnectAsync", "Connect"]

    /**
     * @type {WiFiOnDemandHotspotNetwork} 
     */
    RequestedNetwork {
        get => this.get_RequestedNetwork()
    }

    /**
     * 
     * @returns {WiFiOnDemandHotspotNetwork} 
     */
    get_RequestedNetwork() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiOnDemandHotspotNetwork(value)
    }

    /**
     * 
     * @param {Integer} status_ 
     * @returns {HRESULT} 
     */
    ReportError(status_) {
        result := ComCall(7, this, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<WiFiOnDemandHotspotConnectionResult>} 
     */
    ConnectAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiOnDemandHotspotConnectionResult, operation)
    }

    /**
     * Represents a connection between two shapes in a drawing, such as a line and a box in an organization chart.
     * @returns {WiFiOnDemandHotspotConnectionResult} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/connect-element-connects_type-complextypevisio-xml
     */
    Connect() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiOnDemandHotspotConnectionResult(result_)
    }
}
