#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Devices\Bluetooth\GenericAttributeProfile\GattLocalService.ahk
#Include ..\..\Devices\Bluetooth\GenericAttributeProfile\GattServiceProviderAdvertisingParameters.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IGattServiceProviderTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProviderTrigger
     * @type {Guid}
     */
    static IID => Guid("{ddc6a3e9-1557-4bd8-8542-468aa0c696f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TriggerId", "get_Service", "put_AdvertisingParameters", "get_AdvertisingParameters"]

    /**
     * @type {HSTRING} 
     */
    TriggerId {
        get => this.get_TriggerId()
    }

    /**
     * @type {GattLocalService} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * @type {GattServiceProviderAdvertisingParameters} 
     */
    AdvertisingParameters {
        get => this.get_AdvertisingParameters()
        set => this.put_AdvertisingParameters(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TriggerId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GattLocalService} 
     */
    get_Service() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattLocalService(value)
    }

    /**
     * 
     * @param {GattServiceProviderAdvertisingParameters} value 
     * @returns {HRESULT} 
     */
    put_AdvertisingParameters(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GattServiceProviderAdvertisingParameters} 
     */
    get_AdvertisingParameters() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattServiceProviderAdvertisingParameters(value)
    }
}
