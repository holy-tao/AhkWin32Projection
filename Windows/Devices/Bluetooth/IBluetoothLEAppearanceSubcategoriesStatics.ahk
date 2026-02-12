#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAppearanceSubcategoriesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAppearanceSubcategoriesStatics
     * @type {Guid}
     */
    static IID => Guid("{e57ba606-2144-415a-8312-71ccf291f8d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Generic", "get_SportsWatch", "get_ThermometerEar", "get_HeartRateBelt", "get_BloodPressureArm", "get_BloodPressureWrist", "get_Keyboard", "get_Mouse", "get_Joystick", "get_Gamepad", "get_DigitizerTablet", "get_CardReader", "get_DigitalPen", "get_BarcodeScanner", "get_RunningWalkingInShoe", "get_RunningWalkingOnShoe", "get_RunningWalkingOnHip", "get_CyclingComputer", "get_CyclingSpeedSensor", "get_CyclingCadenceSensor", "get_CyclingPowerSensor", "get_CyclingSpeedCadenceSensor", "get_OximeterFingertip", "get_OximeterWristWorn", "get_LocationDisplay", "get_LocationNavigationDisplay", "get_LocationPod", "get_LocationNavigationPod"]

    /**
     * @type {Integer} 
     */
    Generic {
        get => this.get_Generic()
    }

    /**
     * @type {Integer} 
     */
    SportsWatch {
        get => this.get_SportsWatch()
    }

    /**
     * @type {Integer} 
     */
    ThermometerEar {
        get => this.get_ThermometerEar()
    }

    /**
     * @type {Integer} 
     */
    HeartRateBelt {
        get => this.get_HeartRateBelt()
    }

    /**
     * @type {Integer} 
     */
    BloodPressureArm {
        get => this.get_BloodPressureArm()
    }

    /**
     * @type {Integer} 
     */
    BloodPressureWrist {
        get => this.get_BloodPressureWrist()
    }

    /**
     * @type {Integer} 
     */
    Keyboard {
        get => this.get_Keyboard()
    }

    /**
     * @type {Integer} 
     */
    Mouse {
        get => this.get_Mouse()
    }

    /**
     * @type {Integer} 
     */
    Joystick {
        get => this.get_Joystick()
    }

    /**
     * @type {Integer} 
     */
    Gamepad {
        get => this.get_Gamepad()
    }

    /**
     * @type {Integer} 
     */
    DigitizerTablet {
        get => this.get_DigitizerTablet()
    }

    /**
     * @type {Integer} 
     */
    CardReader {
        get => this.get_CardReader()
    }

    /**
     * @type {Integer} 
     */
    DigitalPen {
        get => this.get_DigitalPen()
    }

    /**
     * @type {Integer} 
     */
    BarcodeScanner {
        get => this.get_BarcodeScanner()
    }

    /**
     * @type {Integer} 
     */
    RunningWalkingInShoe {
        get => this.get_RunningWalkingInShoe()
    }

    /**
     * @type {Integer} 
     */
    RunningWalkingOnShoe {
        get => this.get_RunningWalkingOnShoe()
    }

    /**
     * @type {Integer} 
     */
    RunningWalkingOnHip {
        get => this.get_RunningWalkingOnHip()
    }

    /**
     * @type {Integer} 
     */
    CyclingComputer {
        get => this.get_CyclingComputer()
    }

    /**
     * @type {Integer} 
     */
    CyclingSpeedSensor {
        get => this.get_CyclingSpeedSensor()
    }

    /**
     * @type {Integer} 
     */
    CyclingCadenceSensor {
        get => this.get_CyclingCadenceSensor()
    }

    /**
     * @type {Integer} 
     */
    CyclingPowerSensor {
        get => this.get_CyclingPowerSensor()
    }

    /**
     * @type {Integer} 
     */
    CyclingSpeedCadenceSensor {
        get => this.get_CyclingSpeedCadenceSensor()
    }

    /**
     * @type {Integer} 
     */
    OximeterFingertip {
        get => this.get_OximeterFingertip()
    }

    /**
     * @type {Integer} 
     */
    OximeterWristWorn {
        get => this.get_OximeterWristWorn()
    }

    /**
     * @type {Integer} 
     */
    LocationDisplay {
        get => this.get_LocationDisplay()
    }

    /**
     * @type {Integer} 
     */
    LocationNavigationDisplay {
        get => this.get_LocationNavigationDisplay()
    }

    /**
     * @type {Integer} 
     */
    LocationPod {
        get => this.get_LocationPod()
    }

    /**
     * @type {Integer} 
     */
    LocationNavigationPod {
        get => this.get_LocationNavigationPod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Generic() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SportsWatch() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThermometerEar() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeartRateBelt() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BloodPressureArm() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BloodPressureWrist() {
        result := ComCall(11, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Keyboard() {
        result := ComCall(12, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mouse() {
        result := ComCall(13, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Joystick() {
        result := ComCall(14, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gamepad() {
        result := ComCall(15, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DigitizerTablet() {
        result := ComCall(16, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CardReader() {
        result := ComCall(17, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DigitalPen() {
        result := ComCall(18, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BarcodeScanner() {
        result := ComCall(19, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RunningWalkingInShoe() {
        result := ComCall(20, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RunningWalkingOnShoe() {
        result := ComCall(21, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RunningWalkingOnHip() {
        result := ComCall(22, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CyclingComputer() {
        result := ComCall(23, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CyclingSpeedSensor() {
        result := ComCall(24, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CyclingCadenceSensor() {
        result := ComCall(25, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CyclingPowerSensor() {
        result := ComCall(26, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CyclingSpeedCadenceSensor() {
        result := ComCall(27, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OximeterFingertip() {
        result := ComCall(28, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OximeterWristWorn() {
        result := ComCall(29, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocationDisplay() {
        result := ComCall(30, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocationNavigationDisplay() {
        result := ComCall(31, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocationPod() {
        result := ComCall(32, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocationNavigationPod() {
        result := ComCall(33, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
