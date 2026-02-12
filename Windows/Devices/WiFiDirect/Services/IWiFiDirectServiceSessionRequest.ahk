#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Enumeration\DeviceInformation.ahk
#Include .\WiFiDirectServiceProvisioningInfo.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceSessionRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceSessionRequest
     * @type {Guid}
     */
    static IID => Guid("{a0e27c8b-50cb-4a58-9bcf-e472b99fba04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceInformation", "get_ProvisioningInfo", "get_SessionInfo"]

    /**
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * @type {WiFiDirectServiceProvisioningInfo} 
     */
    ProvisioningInfo {
        get => this.get_ProvisioningInfo()
    }

    /**
     * @type {IBuffer} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @returns {WiFiDirectServiceProvisioningInfo} 
     */
    get_ProvisioningInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiDirectServiceProvisioningInfo(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
