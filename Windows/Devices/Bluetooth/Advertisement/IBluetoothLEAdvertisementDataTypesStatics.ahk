#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementDataTypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementDataTypesStatics
     * @type {Guid}
     */
    static IID => Guid("{3bb6472f-0606-434b-a76e-74159f0684d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flags", "get_IncompleteService16BitUuids", "get_CompleteService16BitUuids", "get_IncompleteService32BitUuids", "get_CompleteService32BitUuids", "get_IncompleteService128BitUuids", "get_CompleteService128BitUuids", "get_ShortenedLocalName", "get_CompleteLocalName", "get_TxPowerLevel", "get_PeripheralConnectionIntervalRange", "get_ServiceSolicitation16BitUuids", "get_ServiceSolicitation32BitUuids", "get_ServiceSolicitation128BitUuids", "get_ServiceData16BitUuids", "get_ServiceData32BitUuids", "get_ServiceData128BitUuids", "get_PublicTargetAddress", "get_RandomTargetAddress", "get_Appearance", "get_AdvertisingInterval", "get_ManufacturerSpecificData"]

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * @type {Integer} 
     */
    IncompleteService16BitUuids {
        get => this.get_IncompleteService16BitUuids()
    }

    /**
     * @type {Integer} 
     */
    CompleteService16BitUuids {
        get => this.get_CompleteService16BitUuids()
    }

    /**
     * @type {Integer} 
     */
    IncompleteService32BitUuids {
        get => this.get_IncompleteService32BitUuids()
    }

    /**
     * @type {Integer} 
     */
    CompleteService32BitUuids {
        get => this.get_CompleteService32BitUuids()
    }

    /**
     * @type {Integer} 
     */
    IncompleteService128BitUuids {
        get => this.get_IncompleteService128BitUuids()
    }

    /**
     * @type {Integer} 
     */
    CompleteService128BitUuids {
        get => this.get_CompleteService128BitUuids()
    }

    /**
     * @type {Integer} 
     */
    ShortenedLocalName {
        get => this.get_ShortenedLocalName()
    }

    /**
     * @type {Integer} 
     */
    CompleteLocalName {
        get => this.get_CompleteLocalName()
    }

    /**
     * @type {Integer} 
     */
    TxPowerLevel {
        get => this.get_TxPowerLevel()
    }

    /**
     * @type {Integer} 
     */
    PeripheralConnectionIntervalRange {
        get => this.get_PeripheralConnectionIntervalRange()
    }

    /**
     * @type {Integer} 
     */
    ServiceSolicitation16BitUuids {
        get => this.get_ServiceSolicitation16BitUuids()
    }

    /**
     * @type {Integer} 
     */
    ServiceSolicitation32BitUuids {
        get => this.get_ServiceSolicitation32BitUuids()
    }

    /**
     * @type {Integer} 
     */
    ServiceSolicitation128BitUuids {
        get => this.get_ServiceSolicitation128BitUuids()
    }

    /**
     * @type {Integer} 
     */
    ServiceData16BitUuids {
        get => this.get_ServiceData16BitUuids()
    }

    /**
     * @type {Integer} 
     */
    ServiceData32BitUuids {
        get => this.get_ServiceData32BitUuids()
    }

    /**
     * @type {Integer} 
     */
    ServiceData128BitUuids {
        get => this.get_ServiceData128BitUuids()
    }

    /**
     * @type {Integer} 
     */
    PublicTargetAddress {
        get => this.get_PublicTargetAddress()
    }

    /**
     * @type {Integer} 
     */
    RandomTargetAddress {
        get => this.get_RandomTargetAddress()
    }

    /**
     * @type {Integer} 
     */
    Appearance {
        get => this.get_Appearance()
    }

    /**
     * @type {Integer} 
     */
    AdvertisingInterval {
        get => this.get_AdvertisingInterval()
    }

    /**
     * @type {Integer} 
     */
    ManufacturerSpecificData {
        get => this.get_ManufacturerSpecificData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncompleteService16BitUuids() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompleteService16BitUuids() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncompleteService32BitUuids() {
        result := ComCall(9, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompleteService32BitUuids() {
        result := ComCall(10, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncompleteService128BitUuids() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompleteService128BitUuids() {
        result := ComCall(12, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShortenedLocalName() {
        result := ComCall(13, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompleteLocalName() {
        result := ComCall(14, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TxPowerLevel() {
        result := ComCall(15, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeripheralConnectionIntervalRange() {
        result := ComCall(16, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceSolicitation16BitUuids() {
        result := ComCall(17, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceSolicitation32BitUuids() {
        result := ComCall(18, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceSolicitation128BitUuids() {
        result := ComCall(19, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceData16BitUuids() {
        result := ComCall(20, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceData32BitUuids() {
        result := ComCall(21, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceData128BitUuids() {
        result := ComCall(22, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PublicTargetAddress() {
        result := ComCall(23, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RandomTargetAddress() {
        result := ComCall(24, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Appearance() {
        result := ComCall(25, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisingInterval() {
        result := ComCall(26, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManufacturerSpecificData() {
        result := ComCall(27, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
