#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattServiceUuidsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceUuidsStatics2
     * @type {Guid}
     */
    static IID => Guid("{d2ae94f5-3d15-4f79-9c0c-eaafa675155c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlertNotification", "get_CurrentTime", "get_CyclingPower", "get_DeviceInformation", "get_HumanInterfaceDevice", "get_ImmediateAlert", "get_LinkLoss", "get_LocationAndNavigation", "get_NextDstChange", "get_PhoneAlertStatus", "get_ReferenceTimeUpdate", "get_ScanParameters", "get_TxPower"]

    /**
     * @type {Guid} 
     */
    AlertNotification {
        get => this.get_AlertNotification()
    }

    /**
     * @type {Guid} 
     */
    CurrentTime {
        get => this.get_CurrentTime()
    }

    /**
     * @type {Guid} 
     */
    CyclingPower {
        get => this.get_CyclingPower()
    }

    /**
     * @type {Guid} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * @type {Guid} 
     */
    HumanInterfaceDevice {
        get => this.get_HumanInterfaceDevice()
    }

    /**
     * @type {Guid} 
     */
    ImmediateAlert {
        get => this.get_ImmediateAlert()
    }

    /**
     * @type {Guid} 
     */
    LinkLoss {
        get => this.get_LinkLoss()
    }

    /**
     * @type {Guid} 
     */
    LocationAndNavigation {
        get => this.get_LocationAndNavigation()
    }

    /**
     * @type {Guid} 
     */
    NextDstChange {
        get => this.get_NextDstChange()
    }

    /**
     * @type {Guid} 
     */
    PhoneAlertStatus {
        get => this.get_PhoneAlertStatus()
    }

    /**
     * @type {Guid} 
     */
    ReferenceTimeUpdate {
        get => this.get_ReferenceTimeUpdate()
    }

    /**
     * @type {Guid} 
     */
    ScanParameters {
        get => this.get_ScanParameters()
    }

    /**
     * @type {Guid} 
     */
    TxPower {
        get => this.get_TxPower()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AlertNotification() {
        value := Guid()
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
    get_CurrentTime() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CyclingPower() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DeviceInformation() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HumanInterfaceDevice() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ImmediateAlert() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LinkLoss() {
        value := Guid()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LocationAndNavigation() {
        value := Guid()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NextDstChange() {
        value := Guid()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_PhoneAlertStatus() {
        value := Guid()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ReferenceTimeUpdate() {
        value := Guid()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ScanParameters() {
        value := Guid()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TxPower() {
        value := Guid()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
