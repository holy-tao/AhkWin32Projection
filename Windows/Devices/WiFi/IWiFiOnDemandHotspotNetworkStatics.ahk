#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WiFiOnDemandHotspotNetwork.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiOnDemandHotspotNetworkStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiOnDemandHotspotNetworkStatics
     * @type {Guid}
     */
    static IID => Guid("{00f5b8ac-80e7-5054-871c-8739f374e3c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOrCreateById"]

    /**
     * 
     * @param {Guid} networkId 
     * @returns {WiFiOnDemandHotspotNetwork} 
     */
    GetOrCreateById(networkId) {
        result := ComCall(6, this, "ptr", networkId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiOnDemandHotspotNetwork(result_)
    }
}
