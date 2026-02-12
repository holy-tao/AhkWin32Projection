#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WiFiAvailableNetwork.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiNetworkReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiNetworkReport
     * @type {Guid}
     */
    static IID => Guid("{9524ded2-5911-445e-8194-be4f1a704895}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_AvailableNetworks"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {IVectorView<WiFiAvailableNetwork>} 
     */
    AvailableNetworks {
        get => this.get_AvailableNetworks()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<WiFiAvailableNetwork>} 
     */
    get_AvailableNetworks() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WiFiAvailableNetwork, value)
    }
}
