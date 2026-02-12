#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WiFiOnDemandHotspotNetworkProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiOnDemandHotspotNetwork extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiOnDemandHotspotNetwork
     * @type {Guid}
     */
    static IID => Guid("{18dc7115-a04e-507c-bbaf-b78369d29fa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "UpdateProperties", "get_Id"]

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {WiFiOnDemandHotspotNetworkProperties} 
     */
    GetProperties() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiOnDemandHotspotNetworkProperties(result_)
    }

    /**
     * 
     * @param {WiFiOnDemandHotspotNetworkProperties} newProperties 
     * @returns {HRESULT} 
     */
    UpdateProperties(newProperties) {
        result := ComCall(7, this, "ptr", newProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
