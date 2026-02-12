#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAppearanceCategoriesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAppearanceCategoriesStatics
     * @type {Guid}
     */
    static IID => Guid("{6d4d54fe-046a-4185-aab6-824cf0610861}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uncategorized", "get_Phone", "get_Computer", "get_Watch", "get_Clock", "get_Display", "get_RemoteControl", "get_EyeGlasses", "get_Tag", "get_Keyring", "get_MediaPlayer", "get_BarcodeScanner", "get_Thermometer", "get_HeartRate", "get_BloodPressure", "get_HumanInterfaceDevice", "get_GlucoseMeter", "get_RunningWalking", "get_Cycling", "get_PulseOximeter", "get_WeightScale", "get_OutdoorSportActivity"]

    /**
     * @type {Integer} 
     */
    Uncategorized {
        get => this.get_Uncategorized()
    }

    /**
     * @type {Integer} 
     */
    Phone {
        get => this.get_Phone()
    }

    /**
     * @type {Integer} 
     */
    Computer {
        get => this.get_Computer()
    }

    /**
     * @type {Integer} 
     */
    Watch {
        get => this.get_Watch()
    }

    /**
     * @type {Integer} 
     */
    Clock {
        get => this.get_Clock()
    }

    /**
     * @type {Integer} 
     */
    Display {
        get => this.get_Display()
    }

    /**
     * @type {Integer} 
     */
    RemoteControl {
        get => this.get_RemoteControl()
    }

    /**
     * @type {Integer} 
     */
    EyeGlasses {
        get => this.get_EyeGlasses()
    }

    /**
     * @type {Integer} 
     */
    Tag {
        get => this.get_Tag()
    }

    /**
     * @type {Integer} 
     */
    Keyring {
        get => this.get_Keyring()
    }

    /**
     * @type {Integer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
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
    Thermometer {
        get => this.get_Thermometer()
    }

    /**
     * @type {Integer} 
     */
    HeartRate {
        get => this.get_HeartRate()
    }

    /**
     * @type {Integer} 
     */
    BloodPressure {
        get => this.get_BloodPressure()
    }

    /**
     * @type {Integer} 
     */
    HumanInterfaceDevice {
        get => this.get_HumanInterfaceDevice()
    }

    /**
     * @type {Integer} 
     */
    GlucoseMeter {
        get => this.get_GlucoseMeter()
    }

    /**
     * @type {Integer} 
     */
    RunningWalking {
        get => this.get_RunningWalking()
    }

    /**
     * @type {Integer} 
     */
    Cycling {
        get => this.get_Cycling()
    }

    /**
     * @type {Integer} 
     */
    PulseOximeter {
        get => this.get_PulseOximeter()
    }

    /**
     * @type {Integer} 
     */
    WeightScale {
        get => this.get_WeightScale()
    }

    /**
     * @type {Integer} 
     */
    OutdoorSportActivity {
        get => this.get_OutdoorSportActivity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Uncategorized() {
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
    get_Phone() {
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
    get_Computer() {
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
    get_Watch() {
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
    get_Clock() {
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
    get_Display() {
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
    get_RemoteControl() {
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
    get_EyeGlasses() {
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
    get_Tag() {
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
    get_Keyring() {
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
    get_MediaPlayer() {
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
    get_BarcodeScanner() {
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
    get_Thermometer() {
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
    get_HeartRate() {
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
    get_BloodPressure() {
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
    get_HumanInterfaceDevice() {
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
    get_GlucoseMeter() {
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
    get_RunningWalking() {
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
    get_Cycling() {
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
    get_PulseOximeter() {
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
    get_WeightScale() {
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
    get_OutdoorSportActivity() {
        result := ComCall(27, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
