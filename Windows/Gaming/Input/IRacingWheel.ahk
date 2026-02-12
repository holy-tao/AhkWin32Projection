#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ForceFeedback\ForceFeedbackMotor.ahk
#Include .\RacingWheelReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IRacingWheel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRacingWheel
     * @type {Guid}
     */
    static IID => Guid("{f546656f-e106-4c82-a90f-554012904b85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasClutch", "get_HasHandbrake", "get_HasPatternShifter", "get_MaxPatternShifterGear", "get_MaxWheelAngle", "get_WheelMotor", "GetButtonLabel", "GetCurrentReading"]

    /**
     * @type {Boolean} 
     */
    HasClutch {
        get => this.get_HasClutch()
    }

    /**
     * @type {Boolean} 
     */
    HasHandbrake {
        get => this.get_HasHandbrake()
    }

    /**
     * @type {Boolean} 
     */
    HasPatternShifter {
        get => this.get_HasPatternShifter()
    }

    /**
     * @type {Integer} 
     */
    MaxPatternShifterGear {
        get => this.get_MaxPatternShifterGear()
    }

    /**
     * @type {Float} 
     */
    MaxWheelAngle {
        get => this.get_MaxWheelAngle()
    }

    /**
     * @type {ForceFeedbackMotor} 
     */
    WheelMotor {
        get => this.get_WheelMotor()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasClutch() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasHandbrake() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPatternShifter() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPatternShifterGear() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxWheelAngle() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ForceFeedbackMotor} 
     */
    get_WheelMotor() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ForceFeedbackMotor(value)
    }

    /**
     * 
     * @param {Integer} button_ 
     * @returns {Integer} 
     */
    GetButtonLabel(button_) {
        result := ComCall(12, this, "uint", button_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RacingWheelReading} 
     */
    GetCurrentReading() {
        value := RacingWheelReading()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
