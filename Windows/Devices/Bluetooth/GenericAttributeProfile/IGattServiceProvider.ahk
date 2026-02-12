#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattLocalService.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattServiceProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{7822b3cd-2889-4f86-a051-3f0aed1c2760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Service", "get_AdvertisementStatus", "add_AdvertisementStatusChanged", "remove_AdvertisementStatusChanged", "StartAdvertising", "StartAdvertisingWithParameters", "StopAdvertising"]

    /**
     * @type {GattLocalService} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * @type {Integer} 
     */
    AdvertisementStatus {
        get => this.get_AdvertisementStatus()
    }

    /**
     * 
     * @returns {GattLocalService} 
     */
    get_Service() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattLocalService(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<GattServiceProvider, GattServiceProviderAdvertisementStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvertisementStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_AdvertisementStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartAdvertising() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GattServiceProviderAdvertisingParameters} parameters 
     * @returns {HRESULT} 
     */
    StartAdvertisingWithParameters(parameters) {
        result := ComCall(11, this, "ptr", parameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopAdvertising() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
