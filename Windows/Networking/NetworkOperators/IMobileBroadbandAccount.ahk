#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MobileBroadbandNetwork.ahk
#Include .\MobileBroadbandDeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandAccount extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandAccount
     * @type {Guid}
     */
    static IID => Guid("{36c24ccd-cee2-43e0-a603-ee86a36d6570}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkAccountId", "get_ServiceProviderGuid", "get_ServiceProviderName", "get_CurrentNetwork", "get_CurrentDeviceInformation"]

    /**
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * @type {Guid} 
     */
    ServiceProviderGuid {
        get => this.get_ServiceProviderGuid()
    }

    /**
     * @type {HSTRING} 
     */
    ServiceProviderName {
        get => this.get_ServiceProviderName()
    }

    /**
     * @type {MobileBroadbandNetwork} 
     */
    CurrentNetwork {
        get => this.get_CurrentNetwork()
    }

    /**
     * @type {MobileBroadbandDeviceInformation} 
     */
    CurrentDeviceInformation {
        get => this.get_CurrentDeviceInformation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkAccountId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ServiceProviderGuid() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceProviderName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MobileBroadbandNetwork} 
     */
    get_CurrentNetwork() {
        result := ComCall(9, this, "ptr*", &network := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandNetwork(network)
    }

    /**
     * 
     * @returns {MobileBroadbandDeviceInformation} 
     */
    get_CurrentDeviceInformation() {
        result := ComCall(10, this, "ptr*", &deviceInformation_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandDeviceInformation(deviceInformation_)
    }
}
