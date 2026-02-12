#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceInformation
     * @type {Guid}
     */
    static IID => Guid("{e6d08168-e381-4c6e-9be8-fe156969a446}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkDeviceStatus", "get_Manufacturer", "get_Model", "get_FirmwareInformation", "get_CellularClass", "get_DataClasses", "get_CustomDataClass", "get_MobileEquipmentId", "get_TelephoneNumbers", "get_SubscriberId", "get_SimIccId", "get_DeviceType", "get_DeviceId", "get_CurrentRadioState"]

    /**
     * @type {Integer} 
     */
    NetworkDeviceStatus {
        get => this.get_NetworkDeviceStatus()
    }

    /**
     * @type {HSTRING} 
     */
    Manufacturer {
        get => this.get_Manufacturer()
    }

    /**
     * @type {HSTRING} 
     */
    Model {
        get => this.get_Model()
    }

    /**
     * @type {HSTRING} 
     */
    FirmwareInformation {
        get => this.get_FirmwareInformation()
    }

    /**
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * @type {Integer} 
     */
    DataClasses {
        get => this.get_DataClasses()
    }

    /**
     * @type {HSTRING} 
     */
    CustomDataClass {
        get => this.get_CustomDataClass()
    }

    /**
     * @type {HSTRING} 
     */
    MobileEquipmentId {
        get => this.get_MobileEquipmentId()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    TelephoneNumbers {
        get => this.get_TelephoneNumbers()
    }

    /**
     * @type {HSTRING} 
     */
    SubscriberId {
        get => this.get_SubscriberId()
    }

    /**
     * @type {HSTRING} 
     */
    SimIccId {
        get => this.get_SimIccId()
    }

    /**
     * @type {Integer} 
     */
    DeviceType {
        get => this.get_DeviceType()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Integer} 
     */
    CurrentRadioState {
        get => this.get_CurrentRadioState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkDeviceStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Manufacturer() {
        value := HSTRING()
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
    get_Model() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirmwareInformation() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataClasses() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomDataClass() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MobileEquipmentId() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_TelephoneNumbers() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubscriberId() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimIccId() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceType() {
        result := ComCall(17, this, "int*", &pDeviceType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDeviceType
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentRadioState() {
        result := ComCall(19, this, "int*", &pCurrentState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCurrentState
    }
}
